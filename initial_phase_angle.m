function initial_phase_angle = initial_phase_angle(u_central_body, semi_major_axis_destination, TOF)
    % Angular velocity of Saturn in radians per second
    n2 = sqrt(u_central_body / (semi_major_axis_destination^3));
    
    % Total phase angle Saturn travels during the transfer (in degrees)
    alpha_saturn = rad2deg(n2 * TOF);
    
    % Required initial relative phase angle (in degrees)
    initial_phase_angle = 180 - alpha_saturn;
    
    fprintf('Initial phase angle required for rendezvous is %.2f degrees\n', initial_phase_angle);
end