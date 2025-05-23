USE 131224_Kushnir;

-- 2
CREATE TABLE weather (
    weather_id INT AUTO_INCREMENT PRIMARY KEY,
    weather_date DATE NOT NULL,
    weather_daytime_temperature INT CHECK (weather_daytime_temperature BETWEEN - 30 AND 30),
    weather_night_temperature INT CHECK (weather_night_temperature BETWEEN - 30 AND 30),
    weather_wind_speed DECIMAL(5 , 2 ) CHECK (weather_wind_speed >= 0)
);

-- 3
INSERT INTO weather(weather_date, weather_daytime_temperature, weather_night_temperature, weather_wind_speed)
VALUES 
('2025-04-30', 22, 12, 4.6), 
('2025-04-29', 21, 10, 1.5), 
('2025-04-28', 19, 7, 2.9), 
('2025-04-27', 16, 6, 4.4),
('2025-04-26', 15, 7, 5.1);

-- 4
UPDATE weather 
SET 
    weather_night_temperature = weather_night_temperature + 1
WHERE
    weather_wind_speed <= 3;
    
-- 5
CREATE VIEW hw4_task5 AS
    SELECT 
        *, 
        (weather_daytime_temperature + weather_night_temperature) / 2 AS weather_average_daily_temperature,
        CASE 
			WHEN weather_wind_speed < 2 
				THEN  'штиль'
			WHEN weather_wind_speed BETWEEN 2 AND 5 
				THEN 'умеренный ветер' 
			WHEN weather_wind_speed > 5 
				THEN 'сильный ветер' 
			END
		AS weather_wind_description
    FROM
        weather;
