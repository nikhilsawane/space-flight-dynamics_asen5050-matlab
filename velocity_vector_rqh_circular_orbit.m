function vhat_analytical = velocity_vector_rqh_circular_orbit(radius, u_planet)
    vc = sqrt(u_planet/radius);
    vhat_analytical = [0; vc; 0];
end