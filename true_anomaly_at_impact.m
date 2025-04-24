function true_anomaly = true_anomaly_at_impact(eccentricity, p, radius_at_impact)
        true_anomaly = -acosd((1/eccentricity) * ((p/radius_at_impact) - 1));
end
