function vhat_analytical = velocity_vector_rqh(eccentricity, u_planet, true_anomaly, h)
    vr = (u_planet/h) * eccentricity * sind(true_anomaly);
    vtheta = (u_planet/h) * (1 + (eccentricity * cosd(true_anomaly)));
    vhat_analytical = [vr; vtheta; 0];
end

