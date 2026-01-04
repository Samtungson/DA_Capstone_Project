# DA_Capstone_Project
## Cyclistic Bike-Share Analysis: Casual vs. Member Trends

## 🚲 Project Overview
This analysis explores how annual members and casual riders use Cyclistic bikes differently. The goal is to design marketing strategies to convert casual riders into annual members.

## 🛠️ Data Analysis Process
The project follows the six phases of data analysis: **Ask, Prepare, Process, Analyze, Share, and Act.**

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

## 📊 View the Full Work
* **The Detail Analyze Phase Codes and Explanation (R Markdown):** [[Link to your RPubs](https://rpubs.com/Samtungson/1385212)]
* **Interactive Dashboard for Share Phase (Tableau):** [[Link to your Tableau Public](https://public.tableau.com/views/CyclisticRidePatternsandTrendsAYearlyComparison/CyclisticRidePatternsandTrends?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)]
