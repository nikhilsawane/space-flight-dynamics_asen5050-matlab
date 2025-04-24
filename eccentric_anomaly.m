function E = eccentric_anomaly(e, true_anomaly)
    if true_anomaly > 0
        E = acos((e + cosd(true_anomaly)) / (1 + e * cosd(true_anomaly)));
    else
        E = -acos((e + cosd(true_anomaly)) / (1 + e * cosd(true_anomaly)));
    end
end
