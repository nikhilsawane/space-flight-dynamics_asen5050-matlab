function [vhat_out, vhat_infinity_in, vhat_infinity_out, turn_ang] = hyperbolic_flyby_ahead(u_planet, vhat_in_rqh, v_planet_rqh, r_periapsis_flyby)
    
    vhat_infinity_in = vhat_in_rqh - v_planet_rqh;
    v_infinity_in = norm(vhat_infinity_in);
    ah = semi_major_axis_hyperbolic_flyby(v_infinity_in, u_planet);
    eh = eccentricity_from_rp_a(ah, r_periapsis_flyby);
    turn_ang = turning_angle(eh);
    beta1 = 180 - acosd(dot(vhat_infinity_in, v_planet_rqh)/ (v_infinity_in * norm(v_planet_rqh)));    
    beta2 = beta1 - turn_ang;
    rotation_matrix = [cosd(turn_ang), -sind(turn_ang), 0; sind(turn_ang), cosd(turn_ang), 0; 0, 0, 1];
    vhat_infinity_out = rotation_matrix * vhat_infinity_in;
    vhat_out = v_planet_rqh + vhat_infinity_out;
    v_out_verify = sqrt(v_infinity_in^2 + norm(v_planet_rqh)^2 - 2 * v_infinity_in * norm(v_planet_rqh) * cosd(beta2));

    print_with_hashes('Hyperbolic Flyby');
    fprintf('Vhat_infinity_in = [%.6f, %.6f, %.6f] km/s\n', vhat_infinity_in(1), vhat_infinity_in(2), vhat_infinity_in(3));
    fprintf('V_infinity_in = %.6f km/s\n', v_infinity_in);
    fprintf('V_infinity_out = %.6f km/s\n', v_infinity_in);
    fprintf('Semi Major axis hyperbola flyby (ah) = %.5f km \n', ah);
    fprintf('Eccentricity hyperbola flyby (eh) = %.5f  \n', eh);
    fprintf('Turning angle = %.5f degrees \n', turn_ang);
    fprintf('Beta1 = %.5f degrees \n', beta1);
    fprintf('Beta2 = %.5f degrees \n', beta2);
    fprintf('Rotation Matrix\n');
    fprintf('[%.6f, %.6f, %.6f]\n', rotation_matrix(1), rotation_matrix(4), rotation_matrix(7));
    fprintf('[%.6f, %.6f, %.6f]\n', rotation_matrix(2), rotation_matrix(5), rotation_matrix(8));
    fprintf('[%.6f, %.6f, %.6f]\n', rotation_matrix(3), rotation_matrix(6), rotation_matrix(9));
    fprintf('Vhat_infinity_out = [%.6f, %.6f, %.6f] km/s\n', vhat_infinity_out(1), vhat_infinity_out(2), vhat_infinity_out(3));
    fprintf('Vhat_out = [%.6f, %.6f, %.6f] km/s\n', vhat_out(1), vhat_out(2), vhat_out(3));
    fprintf('V_out = %.6f km/s\n', norm(vhat_out));
    fprintf('V_out_verify = %.6f km/s\n', v_out_verify);

end