function eccentric_anomaly = eccentric_anomaly_from_true_anomaly(e, true_anomaly)
    % Convert true anomaly from degrees to radians:
    true_anomaly_rad = deg2rad(true_anomaly);

    % Eccentric anomaly calculation:
    eccentric_anomaly = 2 * atan(sqrt((1 - e) / (1 + e)) * tan(true_anomaly_rad / 2));
end

