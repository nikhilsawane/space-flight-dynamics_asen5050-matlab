function [f, g, f_dot, g_dot, v1hat_final, v2hat_initial] = velocity_vectors_lamberts_problem(p, rhat_initial, rhat_final, true_anomaly_initial, true_anomaly_final, u_planet)
    % Calculate the change in true anomaly
    delta_true_anomaly = true_anomaly_final - true_anomaly_initial;
    r_final = norm(rhat_final);
    r_initial = norm(rhat_initial);

    % Compute f, g, f_dot, and g_dot
    f = 1 - (r_final/p) * (1 - cosd(delta_true_anomaly)); % unitless
    g = (r_initial * r_final * sind(delta_true_anomaly)) / sqrt(u_planet * p); % in seconds
    calc = (((1 - cosd(delta_true_anomaly)) / p) - (1 / r_final) - (1 / r_initial));
    f_dot = (sqrt(u_planet / p) * tand(delta_true_anomaly / 2) * calc); % in s^-1 
    g_dot = 1 - ((r_initial / p) * (1 - cosd(delta_true_anomaly))); % unitless
    
    % Compute final position and velocity vectors
    v1hat_final = (1/g) * (rhat_final - f * rhat_initial);
    v2hat_initial = f_dot * rhat_initial + g_dot * v1hat_final;
    
    % Display the results using fprintf
    fprintf('\n');
    fprintf('##########################################################################################################\n');
    fprintf('F and G Function Calculator: \n');
    fprintf('##########################################################################################################\n');
    fprintf('f = %.6f (unitless)\n', f);
    fprintf('g = %.6f seconds\n', g);
    fprintf('f_dot = %.6f s^-1\n', f_dot);
    fprintf('g_dot = %.6f (unitless)\n', g_dot);
    
    fprintf('\nVelocity vector (v1_final):\n');
    fprintf('v1_final = [%.6f, %.6f, %.6f] km/s \n', v1hat_final(1), v1hat_final(2), v1hat_final(3));
    
    fprintf('\nVelocity vector (v2_initial):\n');
    fprintf('v2_intial = [%.6f, %.6f, %.6f] km/s\n', v2hat_initial(1), v2hat_initial(2), v2hat_initial(3));

    
    % Optionally return all values to the caller
end
