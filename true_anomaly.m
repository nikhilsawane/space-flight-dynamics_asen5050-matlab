function true_anomaly = true_anomaly(eccentricity, p, rhat, vhat)
    r = norm(rhat);
    if dot(rhat, vhat) > 0
        true_anomaly = acosd((1/eccentricity) * ((p/r) - 1));
    else
        true_anomaly = -acosd((1/eccentricity) * ((p/r) - 1));
    end
end
