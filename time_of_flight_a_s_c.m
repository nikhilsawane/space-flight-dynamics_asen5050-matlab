function [TOF, alpha, beta] = time_of_flight_a_s_c(a, s, c, TOF_target, u_planet, transfer_angle, tof_min)
    % Calculate n
    n = sqrt(u_planet / a^3);
    
    % Quadrant check for alpha and beta based on transfer_angle and TOF
    if transfer_angle < 180  % turning_angle < 180 degrees
        if TOF_target < tof_min
            % Blue arc
            alpha = 2 * asin(sqrt(s / (2 * a)));
            beta = 2 * asin(sqrt((s - c) / (2 * a)));
        else
            % Red arc
            alpha = 2 * pi - 2 * asin(sqrt(s / (2 * a)));
            beta = 2 * asin(sqrt((s - c) / (2 * a)));
        end
    else  % transfer_angle > 180 degrees
        if TOF_target < tof_min
            % Purple arc
            alpha = 2 * asin(sqrt(s / (2 * a)));
            beta = -2 * asin(sqrt((s - c) / (2 * a)));
        else
            % Brown arc
            alpha = 2 * pi - 2 * asin(sqrt(s / (2 * a)));
            beta = -2 * asin(sqrt((s - c) / (2 * a)));
        end
    end
    
    % Compute the Time of Flight (TOF)
    TOF = (1/n) * (alpha - beta - (sin(alpha) - sin(beta)));
    fprintf('Time of Flight (TOF): %.5f seconds (%.5f hours)(%.5f days)(%.5f years)\n', TOF, TOF/3600, TOF/86400, TOF/(365.25*86400));

end