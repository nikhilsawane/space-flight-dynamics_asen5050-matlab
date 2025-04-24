function [f, g, f_dot, g_dot, rhat_final, vhat_final] = f_g_functions_E0_delta_time(delta_time, a, r_initial, r_final, eccentric_anomaly_initial, eccentric_anomaly_final, u_planet, rhat_initial, vhat_initial)
    delta_eccentric_anomaly = eccentric_anomaly_final - eccentric_anomaly_initial;
    f = 1 - (a/r_initial) * (1 - cos(delta_eccentric_anomaly));
    g = delta_time - (sqrt(a^3/u_planet) * (delta_eccentric_anomaly - sin(delta_eccentric_anomaly)));

    f_dot = - sin(delta_eccentric_anomaly) * sqrt(u_planet * a)/ r_final * r_initial;
    g_dot = 1 - ((a/r_final) * (1 - cos(delta_eccentric_anomaly)));

    rhat_final = f * rhat_initial + g * vhat_initial;
    vhat_final = f_dot * rhat_initial + g_dot * vhat_initial;
end



