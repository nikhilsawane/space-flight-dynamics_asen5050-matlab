function [delta_v1, delta_v2] = lamberts_problem(r1hat, r2hat, v1hat, v2hat, TOF_in_seconds, u_planet)
    print_with_hashes('Step 1: Calculate the transfer angle')
    transfer_ang = transfer_angle(r1hat, r2hat, 0);
    
    print_with_hashes('Step 2: Calculate Geometric Quantities c and s');
    c = chord_length(norm(r1hat), norm(r2hat), transfer_ang);
    s = semi_perimeter(norm(r1hat), norm(r2hat), c);
    
    print_with_hashes('Step 3: Determine type of Transfer Orbit');
    TOF_Parabolic_transfer = Time_Of_Flight_Parabolic_Transfer(s, c, u_planet, transfer_ang, TOF_in_seconds);
    
    print_with_hashes('Step 4: Determine if transfer requires shorter or longer TOF');
    TOF_minimum = time_of_flight_minimum_energy_transfer(s, c, u_planet, transfer_ang, TOF_in_seconds);
    
    print_with_hashes('Step 5: Iteratively solve the TOF equation to calculate a');
    [a, TOF_diff] = solve_lambert_problem(s, c, TOF_in_seconds, u_planet, transfer_ang, TOF_minimum);
    
    print_with_hashes('Step 6: Verification of TOF after iterating');
    [TOF, alpha, beta] = time_of_flight_a_s_c(a, s, c, TOF_in_seconds, u_planet, transfer_ang, TOF_minimum);
    
    print_with_hashes('Step 7: Find eccentricity via p');
    [e, p] = eccentricity_via_p_lamberts_problem(a, c, s, norm(r1hat), norm(r2hat), alpha, beta);
    
    print_with_hashes('Step 8: Find true anomaly at each location');
    [ta1, ta2] = true_anomaly_1_2_lamberts_problem(e, p, norm(r1hat), norm(r2hat), transfer_ang);
    
    print_with_hashes('Step 9: Calculate velocity vectors before and after maneuver in a common frame');
    [f, g, f_dot, g_dot, v1hat_f, v2hat_i] = velocity_vectors_lamberts_problem(p, r1hat, r2hat, ta1, ta2, u_planet);
    
    print_with_hashes('Step 10: Find the maneuvers required for the transfer');
    [delta_v1, delta_v2] = maneuvers_lamberts_problem(v1hat_f, v1hat, v2hat, v2hat_i);

end