function [a, e, i, RAAN1, arg_periapsis, true_anomaly1] = orbital_elements(rhat, vhat, u_planet)
    r = norm(rhat);
    v = norm(vhat);
    
    hhat = specific_angular_momentum(rhat, vhat);
    h = norm(hhat);
    
    specific_energy1 = specific_energy(v, u_planet, r);
    
    a = semi_major_axis(u_planet, specific_energy1);
    e = eccentricity(h, specific_energy1, u_planet);
    i = inclination(hhat);
    RAAN1 = RAAN(hhat);
    
    nhat = line_of_nodes(hhat);
    ehat = eccentricity_vector(vhat, hhat, u_planet, rhat);
    
    p = semi_latus_rectum_a_e(a, e);
    arg_periapsis = argument_of_periapsis(nhat, ehat);
    
    true_anomaly1 = true_anomaly(e, p, rhat, vhat);

end
