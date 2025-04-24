function true_anomaly_infinity = true_anomaly_infinity(eccentricity)
    true_anomaly_infinity = acosd(-1/eccentricity);
     fprintf('- %.6f < true_anomaly < %.6f \n', true_anomaly_infinity, true_anomaly_infinity);
end

