function true_anomaly = true_anomaly_rhat_ehat(rhat, ehat, vhat)

    e = norm(ehat);
    r = norm(rhat);

    if dot(rhat, vhat) > 0
        true_anomaly = acosd(dot(rhat, ehat) / (r * e));
    else
        true_anomaly = -acosd(dot(rhat, ehat) / (r * e));
    end
end
