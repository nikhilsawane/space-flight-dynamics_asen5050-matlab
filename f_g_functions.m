function [f, g, f_dot, g_dot, rhat_final, vhat_final] = f_g_functions(p, r_initial, r_final, true_anomaly_initial, true_anomaly_final, u_planet, rhat_initial, vhat_initial)
    % Calculate the change in true anomaly
    delta_true_anomaly = true_anomaly_final - true_anomaly_initial;
    
    % Compute f, g, f_dot, and g_dot
    f = 1 - (r_final/p) * (1 - cosd(delta_true_anomaly)); % unitless
    g = (r_initial * r_final * sind(delta_true_anomaly)) / sqrt(u_planet * p); % in seconds
    calc = (((1 - cosd(delta_true_anomaly)) / p) - (1 / r_final) - (1 / r_initial));
    f_dot = (sqrt(u_planet / p) * tand(delta_true_anomaly / 2) * calc); % in s^-1 
    g_dot = 1 - ((r_initial / p) * (1 - cosd(delta_true_anomaly))); % unitless
    
    % Compute final position and velocity vectors
    rhat_final = f * rhat_initial + g * vhat_initial;
    vhat_final = f_dot * rhat_initial + g_dot * vhat_initial;
    
    % Display the results using fprintf
    fprintf('\n');
    fprintf('##########################################################################################################\n');
    fprintf('F and G Function Calculator: \n');
    fprintf('##########################################################################################################\n');
    fprintf('f = %.6f (unitless)\n', f);
    fprintf('g = %.6f seconds\n', g);
    fprintf('f_dot = %.6f s^-1\n', f_dot);
    fprintf('g_dot = %.6f (unitless)\n', g_dot);
    
    fprintf('\nPosition vector (rhat_final):\n');
    fprintf('rhat_final = [%.6e, %.6e, %.6e] km \n', rhat_final(1), rhat_final(2), rhat_final(3));
    
    fprintf('\nVelocity vector (vhat_final):\n');
    fprintf('vhat_final = [%.6e, %.6e, %.6e] km/s \n', vhat_final(1), vhat_final(2), vhat_final(3));

    
    % Optionally return all values to the caller
end
