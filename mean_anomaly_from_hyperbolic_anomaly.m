function Mh = mean_anomaly_from_hyperbolic_anomaly(hyperbolic_anomaly, eccentricity)
    Mh = (eccentricity * sin(hyperbolic_anomaly)) - hyperbolic_anomaly;
end