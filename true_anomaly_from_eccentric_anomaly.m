function true_anomaly = true_anomaly_from_eccentric_anomaly(e, E)
    % True anomaly calculation (in radians):
    true_anomaly_rad = 2 * atan(sqrt((1 + e) / (1 - e)) * tan(E / 2));

    % Convert to degrees:
    true_anomaly= rad2deg(true_anomaly_rad);
end
