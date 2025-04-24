function hyperbolic_anomaly = hyperbolic_anomaly_from_true_anomaly(eccentricity, true_anomaly)
    hyperbolic_anomaly = 2 * atanh(sqrt(eccentricity - 1 / eccentricity + 1) * tand(true_anomaly/2));
end
