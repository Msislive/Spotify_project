-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

select count(*) from spotify

--EDA
--1. what are the different artist
select artist from spotify

--2. Retrieve the names of all tracks that have more than 1 billion streams
SELECT "Track"
FROM spotify
WHERE "Stream" > 1000000000;

--3. List all albums along with their respective artists
SELECT DISTINCT
    "Album",
    "Artist"
FROM spotify
ORDER BY "Artist";

--4.Get the total number of comments for tracks where licensed = TRUE
SELECT
    SUM("Comments") AS total_comments
FROM spotify
WHERE "Licensed" = TRUE;

--6.Find all tracks that belong to the album type single
SELECT "Track"
FROM spotify
WHERE "Album_type" = 'single';

--7.Count the total number of tracks by each artist
SELECT
    "Artist",
    COUNT(DISTINCT "Track") AS total_tracks
FROM spotify
GROUP BY "Artist"
ORDER BY total_tracks DESC;

--8.Calculate the average danceability of tracks in each album
SELECT
    "Album",
    ROUND(AVG("Danceability")::numeric, 3) AS avg_danceability
FROM spotify
GROUP BY "Album"
ORDER BY avg_danceability DESC;

--9.Find the top 5 tracks with the highest energy values
SELECT
    "Track",
    "Energy"
FROM spotify
ORDER BY "Energy" DESC
LIMIT 5;

--10. List all tracks along with their views and likes where official_video = TRUE
SELECT
    "Track",
    "Views",
    "Likes"
FROM spotify
WHERE "official_video" = TRUE
ORDER BY "Views" DESC;

--11.For each album, calculate the total views of all associated tracks
SELECT
    "Album",
    SUM(COALESCE("Views", 0)) AS total_views
FROM spotify
GROUP BY "Album"
ORDER BY total_views DESC;

--12.Retrieve the track names that have been streamed on Spotify more than YouTube
SELECT
    "Track",
    "Stream",
    "Views"
FROM spotify
WHERE COALESCE("Stream", 0) > COALESCE("Views", 0)
ORDER BY "Stream" DESC;

--13.Find the top 3 most-viewed tracks for each artist (Window Function)
SELECT
    "Artist",
    "Track",
    "Views"
FROM (
    SELECT
        "Artist",
        "Track",
        "Views",
        DENSE_RANK() OVER (
            PARTITION BY "Artist"
            ORDER BY "Views" DESC
        ) AS rnk
    FROM spotify
) ranked
WHERE rnk <= 3;

--14.Find tracks where the liveness score is above the average
SELECT
    "Track",
    "Liveness"
FROM spotify
WHERE "Liveness" > (
    SELECT AVG("Liveness")
    FROM spotify
);

--15.Use WITH clause to find difference between highest & lowest energy per album
WITH energy_stats AS (
    SELECT
        "Album",
        MAX("Energy") AS max_energy,
        MIN("Energy") AS min_energy
    FROM spotify
    GROUP BY "Album"
)
SELECT
    "Album",
    max_energy - min_energy AS energy_difference
FROM energy_stats
ORDER BY energy_difference DESC;

