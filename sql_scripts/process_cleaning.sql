PROCESS PHASE
Tools Selected
BigQuery SQL was chosen for this phase because:
It can handle large datasets efficiently.


Allows reproducible transformations and filtering.


Prepares clean datasets for further analysis in R or Tableau.

Step 1: Inspect Schemas

-- Inspect 2019 dataset schema
SELECT *
FROM `single-portal-483106-h2.bike_share.divvy_2019_q1`
LIMIT 5;


-- Inspect 2020 dataset schema
SELECT *
FROM `single-portal-483106-h2.bike_share.divvy_2020_q1`
LIMIT 5;


Observation:
2019 uses trip_id, start_time, end_time, bikeid, tripduration, usertype, gender, birthyear.


2020 uses ride_id, started_at, ended_at, rideable_type, member_casual, plus lat/long coordinates.


Columns must be standardized for consistent analysis.


Step 2: Standardize and Clean 2019 Dataset

-- Create a clean and standardized version of the 2019 Divvy dataset
-- This prepares the data for analysis and future merging with the 2020 dataset
CREATE OR REPLACE TABLE `single-portal-483106-h2.bike_share.divvy_2019_q1_clean` AS


SELECT
  -- Standardize trip identifier column to match 2020 naming
  trip_id AS ride_id,
 
  -- Standardize start and end timestamps to match 2020 naming
  start_time AS started_at,
  end_time AS ended_at,
 
  -- Standardize station names and IDs for start and end points
  from_station_name AS start_station_name,
  from_station_id AS start_station_id,
  to_station_name AS end_station_name,
  to_station_id AS end_station_id,
 
  -- Map user type to match 2020 'member_casual' convention
  CASE
    WHEN usertype = 'Subscriber' THEN 'member'  -- Subscriber → member
    WHEN usertype = 'Customer' THEN 'casual'   -- Customer → casual
    ELSE 'unknown'                              -- Handle any missing/unexpected values
  END AS member_casual,
 
  -- Calculate trip duration in seconds from start and end timestamps
  TIMESTAMP_DIFF(end_time, start_time, SECOND) AS ride_length_seconds,
 
  -- Extract day of the week from start_time for potential analysis (1=Sunday, 7=Saturday)
  EXTRACT(DAYOFWEEK FROM start_time) AS day_of_week,
 
  -- Include optional rider demographic info (may have NULLs)
  gender,
  birthyear,
 
  -- Add placeholder for bike type to match 2020 schema (2019 data does not have this)
  NULL AS rideable_type


FROM `single-portal-483106-h2.bike_share.divvy_2019_q1`


-- Filter out invalid trips where end time is earlier than start time
WHERE end_time > start_time;


Notes:
Columns renamed to match 2020 dataset for consistency (trip_id → ride_id, start_time → started_at, end_time → ended_at, etc.).


ride_length_seconds calculated from timestamps, since tripduration may have inconsistencies.


Invalid trips filtered out (end_time <= start_time).


Rider types standardized (Subscriber → member, Customer → casual).


Gender and birthyear included, though they are not present in 2020 dataset (may be NULL when merging).


rideable_type added as NULL to match 2020 schema.


Day of week extracted (day_of_week) for temporal analysis.


bikeid not included, since it does not exist in 2020 dataset and is not needed for standard analysis.
Step 3: Standardize and Clean 2020 Dataset

-- Create a clean and standardized version of the 2020 Divvy dataset
-- Prepares the data for analysis and future merging with 2019 cleaned dataset
CREATE OR REPLACE TABLE `single-portal-483106-h2.bike_share.divvy_2020_q1_clean` AS


SELECT
  -- Unique trip identifier (already called ride_id in 2020)
  ride_id,
 
  -- Start and end timestamps (same as 2019 standardized column names)
  started_at,
  ended_at,
 
  -- Station names and IDs
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
 
  -- Rider type (already uses 'member' / 'casual' convention)
  member_casual,
 
  -- Calculate trip duration in seconds for analysis
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length_seconds,
 
  -- Extract day of the week from start timestamp
  EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week,
 
  -- Gender and birthyear not available in 2020; added as NULL to match 2019 schema
  NULL AS gender,
  NULL AS birthyear,
 
  -- Bike type already exists in 2020
  rideable_type


FROM `single-portal-483106-h2.bike_share.divvy_2020_q1`


-- Filter out invalid trips where end time is earlier than start time
WHERE ended_at > started_at;


Notes for 2020 Cleaning
No column renaming needed; 2020 dataset already uses the standardized names (ride_id, started_at, ended_at, etc.).


Calculated ride_length_seconds from timestamps to ensure consistency with 2019 dataset.


Extracted day_of_week from started_at for temporal analysis.


Invalid trips removed (ended_at <= started_at).


Added gender and birthyear as NULL to match 2019 schema for future merging.


rideable_type column preserved (exists in 2020; added as NULL in 2019).
Step 4: Validate Cleaned Data
1. Check for negative or extremely long durations:
SELECT *
FROM `single-portal-483106-h2.bike_share.divvy_2019_q1_clean`
WHERE ride_length_seconds <= 0
   OR ride_length_seconds > 86400;  -- more than 24 hours

During our data review of Q1 2019 bike share rides, we identified a small number of rides with unusually long durations:
Rides ≤ 0 seconds: 0


Rides > 24 hours (86,400 seconds): 192


Given the size of our dataset, these outliers represent a very small fraction and will be included in the current analysis. We will continue to monitor and document any potential impact on insights.
2. Compare averages between 2019 and 2020 in a single query:
SELECT '2019' AS year, member_casual,
  COUNT(*) AS total_rides,
  MIN(ride_length_seconds) AS min_duration,
  MAX(ride_length_seconds) AS max_duration,
  AVG(ride_length_seconds) AS avg_duration
FROM `single-portal-483106-h2.bike_share.divvy_2019_q1_clean`
GROUP BY member_casual
UNION ALL
SELECT '2020' AS year, member_casual,
  COUNT(*) AS total_rides,
  MIN(ride_length_seconds) AS min_duration,
  MAX(ride_length_seconds) AS max_duration,
  AVG(ride_length_seconds) AS avg_duration
FROM `single-portal-483106-h2.bike_share.divvy_2020_q1_clean`
GROUP BY member_casual
ORDER BY year, member_casual;



Year
Rider Type
Total Rides
Min Duration (s)
Max Duration (s)
Avg Duration (s)
2019
casual
23,163
61
10,632,022
3,716.52
2019
member
341,906
61
6,096,428
833.57
2020
casual
48,270
1
9,387,024
5,772.00
2020
member
378,407
1
5,627,611
760.63


Observations:
Rider counts are consistent with expectations: members vastly outnumber casual riders. 


Minimum ride durations:


2019: both types start at 61 s


2020: now 1 s (probably the schema/recording changed or more very short rides were captured)


Maximum ride durations: extremely high (millions of seconds → hundreds of hours). These are clearly outliers.


Average ride duration:


Members ride shorter on average (~13–14 min)


Casual riders ride much longer on average (~1–1.6 hours), skewed by outliers


Conclusion for executive summary:
Rider type classifications are consistent year-over-year.


A small number of extremely long rides inflate the max and average for casual riders, but the overall pattern aligns with expectations: casual riders take longer rides on average than members.

