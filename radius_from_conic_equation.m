function r = radius_from_conic_equation(eccentricity, p, true_anomaly)
    r = p / (1 + eccentricity * cosd(true_anomaly));
end