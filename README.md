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

## 📊 View the Full Work
* **Technical Report (R Markdown):** [[Link to your RPubs](https://rpubs.com/Samtungson/1385212)]
* **Interactive Dashboard (Tableau):** [[Link to your Tableau Public](https://public.tableau.com/views/CyclisticRidePatternsandTrendsAYearlyComparison/CyclisticRidePatternsandTrends?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)]
