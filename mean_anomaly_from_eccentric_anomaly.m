function M = mean_anomaly_from_eccentric_anomaly(eccentric_anomaly, eccentricity)
    M = eccentric_anomaly - eccentricity * sin(eccentric_anomaly);
end