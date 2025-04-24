function TOF_min = time_of_flight_minimum_energy_transfer(semi_perimeter, chord_length, u_planet, transfer_angle, TOF_target)
    am = semi_perimeter / 2;
    nm = sqrt(u_planet/am ^3);
    alpha_m = pi;
    beta_m_0 = 2 * asin((semi_perimeter - chord_length)/semi_perimeter);

    if transfer_angle > 180
        beta_m = - beta_m_0;
    else
        beta_m = beta_m_0;
    end

    TOF_min = (1/nm) * ((alpha_m - beta_m) - (sin(alpha_m) - sin(beta_m)));
    fprintf('Time of Flight along minimum energy transfer (TOF_min): %.5f seconds (%.5f hours)(%.5f days)(%.5f years)\n', TOF_min, TOF_min/3600, TOF_min/86400, TOF_min/(365.25*86400));
    fprintf('Semi-major axis for min energy transfer: %.5f Km \n', am);
    fprintf('The value of Beta_m is %.5f \n', beta_m);
    

    if TOF_target > TOF_min
        fprintf('Longer TOF arcs: TOF > TOF_min \n');
    else
        fprintf('Shorter TOF arcs: TOF < TOF_min \n');
    end
end
