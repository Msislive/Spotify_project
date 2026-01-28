# Spotify_project
# spotify
![spotify](https://github.com/Msislive/Spotify_project/blob/main/spotify.webp)

download dataset from here👉 [Dataset](https://github.com/Msislive/Spotify_project/blob/main/spotify%20data.csv)

## 📌 Project Overview
This project focuses on analyzing Spotify music data using **PostgreSQL** to extract meaningful insights related to tracks, albums, artists, and audience engagement.  
The analysis uses SQL queries ranging from basic aggregations to advanced window functions and CTEs.

The objective of this project is to demonstrate **SQL proficiency, analytical thinking, and real-world data analysis skills**.

---

## 📂 Dataset Description
The dataset contains Spotify music and engagement data with attributes such as:

- Artist
- Track
- Album
- Album_type (single / album)
- Audio features (Danceability, Energy, Liveness, etc.)
- YouTube metrics (Views, Likes, Comments)
- Spotify Streams
- Official video and licensing information

---

## 🛠 Tools & Technologies
- **PostgreSQL** – Database management
- **SQL** – Data querying and analysis
- **CSV** – Data source

---

## 🔍 Analysis Performed

### 🟢 Easy Level Analysis
- Tracks with more than 1 billion streams
- Albums with their respective artists
- Total comments on licensed tracks
- Tracks belonging to single-type albums
- Total number of tracks by each artist

### 🟡 Medium Level Analysis
- Average danceability per album
- Top 5 tracks with highest energy
- Official video tracks with views and likes
- Total views per album
- Tracks streamed more on Spotify than YouTube

### 🔴 Advanced Level Analysis
- Top 3 most-viewed tracks per artist using window functions
- Tracks with liveness above average
- Energy range (max–min) per album using CTEs

---

## 📈 Key Insights
- Certain tracks perform significantly better on Spotify compared to YouTube
- Energy and danceability vary widely across albums
- Artists often have a few top-performing tracks dominating views
- Album-wise aggregation helps identify high-impact releases

---

## 📁 Project Structure
- `cleaned_dataset.csv` – Source dataset
- `spotify.sql` – SQL queries for analysis
- `README.md` – Project documentation

---

## 🎯 Conclusion
This project showcases the use of **PostgreSQL for structured data analysis**, covering aggregations, filtering, window functions, and CTEs.  
It highlights the ability to translate raw music data into actionable insights using SQL.

---

## 👤 Author
**Mohammed Sahir Awais**  
Aspiring Data Analyst / Data Analytics Enthusiast  
