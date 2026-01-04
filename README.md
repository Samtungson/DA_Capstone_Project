# DA_Capstone_Project
## Cyclistic Bike-Share Analysis: Casual vs. Member Trends

## 🚲 Project Overview
This analysis explores how annual members and casual riders use Cyclistic bikes differently, aiming to inform marketing strategies to convert casual riders into annual members.

## 🛠️ Data Analysis Process
The project follows six phases: **Ask, Prepare, Process, Analyze, Share, and Act**.

### Phase 1: Ask – Cyclistic Case Study
**Problem:**  
Cyclistic wants to increase annual memberships but the marketing team does not fully understand casual vs. member usage patterns.

**Business Impact:**  
Insights help identify likely converts, develop targeted strategies, and support executive decisions.

**Task:**  
Produce an analysis comparing casual and member bike usage, supported by data visualizations and key findings.

**Stakeholders:**  
* Lily Moreno (Director of Marketing) – Shapes campaigns  
* Marketing Analytics Team – Collects and analyzes data  
* Cyclistic Executive Team – Reviews and approves strategies

### Phase 2: Prepare – Cyclistic Case Study
**Data Sources:**  
* Divvy 2019 Q1 CSV – Historical trip data  
* Divvy 2020 Q1 CSV – Updated dataset with standardized schema  

**Tools:** Google Sheets, SQL, R, Tableau  

**Preparation:**  
* Converted timestamps, calculated ride durations, derived day-of-week and hour-of-day  
* Checked for missing values, duplicates, and schema consistency  

**Considerations:**  
* Only Q1 data analyzed; seasonal patterns may vary  
* Some fields (end station coordinates, gender, birthyear) are missing  

### Phase 3: Process – Data Cleaning
Used **BigQuery SQL** to clean and standardize datasets:  
* Renamed columns for consistency (`trip_id` → `ride_id`)  
* Removed invalid trips (end before start)  
* Created `ride_length_seconds` and `day_of_week` features  
* Flagged extreme outliers (>24 hours)

### Phase 4: Analyze – Exploratory Data Analysis in R
* **Setup:** Loaded `dplyr`, `ggplot2`, `lubridate`, `readr`  
* **Data Prep:** Converted timestamps, calculated `ride_length_min`, extracted `day_of_week` and `hour_of_day`  
* **Analysis:** Compared ride volumes and durations, identified patterns by day and hour  
* **Visualizations:** Bar and line charts for trends by rider type  
* **Export:** Aggregated summaries saved as CSV for reporting

### Phase 5: Share – Executive-Ready Plan
**Audience:** Executives (non-technical), Marketing & Strategy  

**Story:** Members = transportation; Casual = leisure. Insights reveal conversion opportunities.  

**Visualizations:**  
1. Ride Volume – Bar chart  
2. Trip Duration – Bar chart  
3. Day of Week – Grouped bar chart  
4. Hour of Day – Line chart  
5. Business Insights – Text/icons  

**Key Findings:**  
* Members dominate rides; casual ridership growing  
* Casual trips 4–7× longer – leisure-focused  
* Members ride weekdays; casual ride weekends and midday  
* Two behaviors = one conversion opportunity  

**Design:**  
* **Blue = Casual**, **Orange = Member**  
* Clear titles, readable fonts, minimal clutter  
* Each chart answers one question  

**Deliverables:**  
* 4–5 polished charts (Tableau/dashboard)  
* Executive summary highlighting behaviors and opportunities

## 📊 Full Work
* **Analyze Phase (R Markdown):** [[RPubs Link]](https://rpubs.com/Samtungson/1385212)  
* **Share Phase Dashboard (Tableau):** [[Tableau Public]](https://public.tableau.com/views/CyclisticRidePatternsandTrendsAYearlyComparison/CyclisticRidePatternsandTrends?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
