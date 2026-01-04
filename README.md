# DA_Capstone_Project
## Cyclistic Bike-Share Analysis: Casual vs. Member Trends

## 🚲 Project Overview
This analysis explores how annual members and casual riders use Cyclistic bikes differently. The goal is to design marketing strategies to convert casual riders into annual members.

## 🛠️ Data Analysis Process
The project follows the six phases of data analysis: **Ask, Prepare, Process, Analyze, Share, and Act.**

### Phase 1: Ask – Cyclistic Case Study

**Problem to Solve**  
Cyclistic wants to increase annual memberships by converting casual riders. The marketing team does not yet understand how casual riders and annual members use Cyclistic bikes differently, which makes it difficult to design targeted campaigns.

**How Insights Will Drive Business Decisions**  
By analyzing differences in usage patterns, the marketing team can:

* Identify which casual riders are most likely to convert to annual memberships.
* Develop data-driven marketing strategies highlighting benefits that appeal to casual riders.
* Support executive decisions with compelling, actionable insights, increasing the likelihood of program approval.

**Business Task**  
Produce an analysis that clearly identifies the differences in bike usage between casual riders and annual members, supported by data visualizations and key findings, to inform marketing strategies aimed at converting casual riders into annual members.

**Key Stakeholders**  

* **Lily Moreno (Director of Marketing):** Uses insights to shape campaigns.  
* **Marketing Analytics Team:** Collaborates on data collection, analysis, and reporting.  
* **Cyclistic Executive Team:** Reviews recommendations and approves marketing strategies.

### Phase 2: Prepare – Cyclistic Case Study

#### Data Sources
* **Divvy 2019 Q1 Dataset (CSV)** – Historical trip data for comparison  
* **Divvy 2020 Q1 Dataset (CSV)** – Updated trip data with standardized schema  

The datasets are publicly available from Divvy (Lyft Bikes and Scooters, LLC) for educational and analytical use.

#### Tools Used
* **Google Sheets:** Initial exploration  
* **SQL:** Sorting and aggregation  
* **R:** Cleaning, transformation, and analysis  
* **Tableau:** Visualization  

#### Data Preparation
* Converted timestamps to proper date-time format  
* Calculated ride duration and derived features for day-of-week and hour-of-day  
* Checked for missing or inconsistent values and duplicates  
* Ensured schema consistency across datasets  

#### Key Considerations
* Only Q1 data is analyzed, so seasonal patterns may not be fully represented  
* Some fields (e.g., end station coordinates, gender, birthyear) contain missing values  

#### How the Data Supports the Business Task
The datasets enable comparison of usage patterns between casual riders and annual members, including ride duration, time-of-day usage, and station trends, supporting the marketing team's strategy to convert casual riders into annual members.


### Phase 3: Process (Data Cleaning)
I used **BigQuery SQL** to clean and standardize datasets from 2019 and 2020. Key steps included:
* **Schema Standardization**: Renaming columns like `trip_id` to `ride_id` for year-over-year consistency.
* **Data Integrity**: Filtering out invalid trips (where end time preceded start time).
* **Feature Engineering**: Calculating `ride_length_seconds` and extracting `day_of_week`.
* **Outlier Handling**: Identifying 192 rides exceeding 24 hours to explain duration skews.

### Phase 4: Analyze (Exploratory Data Analysis in R)
I conducted **exploratory and descriptive analysis in R** on the cleaned 2019 and 2020 Divvy datasets exported from BigQuery. Key steps included:
* **Environment Setup**: Loaded essential R packages (`dplyr`, `ggplot2`, `lubridate`, `readr`) to support data manipulation and visualization.
* **Data Preparation**: Converted timestamps to `POSIXct`, calculated `ride_length_min`, and derived `day_of_week` and `hour_of_day` features for time-based analysis.
* **Descriptive Analysis**: Compared ride volumes and average ride durations between member and casual riders, revealing differences in usage behavior across years.
* **Temporal Pattern Analysis**: Analyzed trips by day of week and hour of day to identify commuting patterns for members versus leisure-focused usage for casual riders.
* **Visualization**: Created bar and line charts to clearly communicate weekly and hourly riding trends across rider types.
* **Export for Reporting**: Saved aggregated summaries—including counts, durations, and trips by day and hour—as CSV files for downstream visualization and presentation.

### Phase 5: Share – Executive-Ready Plan

**Audience:**  
* Cyclistic executives (non-technical)  
* Marketing & strategy stakeholders  

**Story:**  
Annual members use bikes for transportation; casual riders use bikes for leisure. Insights reveal opportunities to convert casual riders into members.

**Visualization Plan:**  
1. **Ride Volume:** Who rides more? – Bar chart  
2. **Trip Duration:** How long do they ride? – Bar chart  
3. **Day of Week:** When do they ride? – Grouped bar chart  
4. **Hour of Day:** When do they ride? – Line chart  
5. **Business Insights:** What does it mean? – Text/icons  

**Key Findings:**  
* Members dominate total rides; casual ridership growing.  
* Casual trips 4–7× longer than members – leisure-focused.  
* Members ride weekdays (commute); casual riders peak weekends and midday.  
* Two distinct behaviors = one conversion opportunity.  

**Design Guidelines:**  
* Colors: **Blue = Casual**, **Orange = Member**  
* Clear titles, readable fonts, high contrast, minimal clutter  
* Each chart answers a single question  

**Deliverables:**  
* 4–5 polished charts (Tableau dashboard or slides)  
* Executive summary highlighting behaviors and conversion opportunities

## 📊 View the Full Work
* **The Detail Analyze Phase Codes and Explanation (R Markdown):** [[Link to your RPubs](https://rpubs.com/Samtungson/1385212)]
* **Interactive Dashboard for Share Phase (Tableau):** [[Link to your Tableau Public](https://public.tableau.com/views/CyclisticRidePatternsandTrendsAYearlyComparison/CyclisticRidePatternsandTrends?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)]
