function flight_path_angle = flight_path_angle(eccentricity, true_anomaly)
    flight_path_angle = atand(eccentricity * sind(true_anomaly) / (1 + eccentricity * cosd(true_anomaly)));
end