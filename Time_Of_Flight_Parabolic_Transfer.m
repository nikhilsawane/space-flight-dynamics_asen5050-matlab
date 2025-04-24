function TOF_p = Time_Of_Flight_Parabolic_Transfer(semi_perimeter, chord_length, u_planet, transfer_angle, desired_TOF_in_seconds)
    if transfer_angle > 180
        TOF_p = (1/3) * (sqrt(2/u_planet)) * (semi_perimeter^1.5 + (semi_perimeter - chord_length)^1.5);
    else
        TOF_p = (1/3) * (sqrt(2/u_planet)) * (semi_perimeter^1.5 - (semi_perimeter - chord_length)^1.5);
    end
    fprintf('Time of Flight for Parabolic Transfer (TOF_p): %.5f seconds (%.5f hours)(%.5f days)(%.5f years)\n', TOF_p, TOF_p/3600, TOF_p/86400, TOF_p/(365.25*86400));
    
    if desired_TOF_in_seconds > TOF_p
        fprintf("Transfer Ellipse uses Elliptical Orbit. \n");
    else
        fprintf("Transfer Ellipse uses Hyperbolic Orbit. \n");
    end

end
