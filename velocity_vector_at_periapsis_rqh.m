function vhat_analytical = velocity_vector_at_periapsis_rqh(eccentricity, u_planet, h)
    vr = (u_planet/h) * eccentricity * sind(0);
    vtheta = (u_planet/h) * (1 + (eccentricity * cosd(0)));
    vhat_analytical = [vr; vtheta; 0];
end