function M = mean_anomaly(mean_motion, time_past_periapsis)
    M = mean_motion * time_past_periapsis; %n * (t-tp)
end