function true_anomaly = true_anomaly_without_qc(eccentricity, p, r)
        true_anomaly = acosd((1/eccentricity) * ((p/r) - 1));
end
