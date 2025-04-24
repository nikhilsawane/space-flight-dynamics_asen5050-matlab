function r = position_from_eccentric_anomaly(eccentricity, semi_major_axis, eccentric_anomaly)
    r = semi_major_axis * (1 - eccentricity * cos(eccentric_anomaly));
end