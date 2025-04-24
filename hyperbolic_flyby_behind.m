function v_out = hyperbolic_flyby_behind(u_planet, vhat_in_rqh, v_planet_rqh, r_periapsis_flyby)
    
    vhat_infinity_in = vhat_in_rqh - v_planet_rqh;
    v_infinity_in = norm(vhat_infinity_in);
    ah = semi_major_axis_hyperbolic_flyby(v_infinity_in, u_planet);
    eh = eccentricity_from_rp_a(ah, r_periapsis_flyby);
    turn_ang = turning_angle(eh);
    beta1 = 180 - acosd(dot(vhat_infinity_in, v_planet_rqh)/ (v_infinity_in * norm(v_planet_rqh)));    
    beta2 = beta1 + turn_ang;    
    v_out = sqrt(v_infinity_in^2 + norm(v_planet_rqh)^2 - 2 * v_infinity_in * norm(v_planet_rqh) * cosd(beta2));

    print_with_hashes('Hyperbolic Flyby');
    fprintf('Vhat_infinity_in = [%.6f, %.6f, %.6f] km/s\n', vhat_infinity_in(1), vhat_infinity_in(2), vhat_infinity_in(3));
    fprintf('V_infinity_in = %.6f km/s\n', v_infinity_in);
    fprintf('V_infinity_out = %.6f km/s\n', v_infinity_in);
    fprintf('Semi Major axis hyperbola flyby (ah) = %.5f km \n', ah);
    fprintf('Eccentricity hyperbola flyby (eh) = %.5f  \n', eh);
    fprintf('Turning angle = %.5f degrees \n', turn_ang);
    fprintf('Beta1 = %.5f degrees \n', beta1);
    fprintf('Beta2 = %.5f degrees \n', beta2);
    fprintf('V_out = %.6f km/s\n', v_out);

end