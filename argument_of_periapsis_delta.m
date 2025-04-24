function delta_arg_periapsis = argument_of_periapsis_delta(true_anomaly_t1, true_anomaly_t2)
    if true_anomaly_t1 > 0 && true_anomaly_t2 > 0
        delta_arg_periapsis = (true_anomaly_t1) - true_anomaly_t2;
    elseif true_anomaly_t1 < 0 && true_anomaly_t2 < 0
        delta_arg_periapsis = (360 + true_anomaly_t1) - (360 + true_anomaly_t2);
    elseif true_anomaly_t1 < 0
        delta_arg_periapsis = (360 + true_anomaly_t1) - true_anomaly_t2;
    else 
        delta_arg_periapsis = (true_anomaly_t1) - (360 + true_anomaly_t2);
    end
end
