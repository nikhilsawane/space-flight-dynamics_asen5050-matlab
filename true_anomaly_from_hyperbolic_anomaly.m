function true_anomaly = true_anomaly_from_hyperbolic_anomaly(eccentricity, hyperbolic_anomaly)
    true_anomaly = 2 * atand(sqrt(eccentricity + 1 / eccentricity - 1) * tanh(hyperbolic_anomaly/2));
end
