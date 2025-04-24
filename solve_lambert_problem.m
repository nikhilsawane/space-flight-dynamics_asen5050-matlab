function [a_solution, TOF_diff] = solve_lambert_problem(s, c, TOF_target, u_planet, transfer_angle, tof_min)
    % Lambert's Problem Solver as a Function
    
    % Define the function to solve for a using fsolve
    TOF_function = @(a) compute_TOF_diff(a, s, c, TOF_target, u_planet, transfer_angle, tof_min);
    
    % Set initial guess for a
    a_initial = (s + c) / 2; % Starting with average of s and c
    
    % Set options for fsolve using optimset
    options = optimset('Display', 'iter', 'TolFun', 1e-6, 'MaxIter', 1000);
    
    % Solve for a using fsolve
    [a_solution, fval, exitflag] = fsolve(TOF_function, a_initial, options);
    
    % Display the solution
    disp(['Converged semi-major axis a: ', num2str(a_solution), ' km']);
    disp(['Final TOF difference: ', num2str(fval)]);
    fprintf('\n');
    
    % Output the semi-major axis and TOF difference
    TOF_diff = fval;
end

% Nested function to compute TOF difference with quadrant check
function TOF_diff = compute_TOF_diff(a, s, c, TOF_target, u_planet, transfer_angle, tof_min)
    % Calculate n
    n = sqrt(u_planet / a^3);
    
    % Quadrant check for alpha and beta based on transfer_angle and TOF
    if transfer_angle < 180  % transfer_angle < 180 degrees
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
    
    % Compute the difference between target TOF and computed TOF
    TOF_diff = TOF_target - TOF;
end
