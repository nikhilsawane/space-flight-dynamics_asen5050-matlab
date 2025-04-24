% Lambert's Problem Solver using fsolve 

% Define constants (example values)
mu = 398600; % Gravitational parameter of Earth (km^3/s^2)
s = 3.4492 * 10^4; % Sum of distances r1 + r2 (km)
c = 3.4295 * 10^4; % Distance between r1 and r2 (km)
TOF_target = 5 * 60 * 60; % Target Time of Flight (in seconds)

% Define the function to solve for a using fsolve
TOF_function = @(a) compute_TOF_diff(a, s, c, TOF_target, mu);

% Set initial guess for a
a_initial = (s + c) / 2; % Starting with average of s and c

% Set options for fsolve using optimset
options = optimset('Display', 'iter', 'TolFun', 1e-6, 'MaxIter', 1000);

% Solve for a using fsolve
[a_solution, fval, exitflag] = fsolve(TOF_function, a_initial, options);

% Display the solution
disp(['Converged semi-major axis a: ', num2str(a_solution), ' km']);
disp(['Final TOF difference: ', num2str(fval)]);

% Nested function to compute TOF difference
function TOF_diff = compute_TOF_diff(a, s, c, TOF_target, mu)
    % Calculate n
    n = sqrt(mu / a^3);
    
    % Calculate alpha and beta
    alpha = 2 * asin(sqrt(s / (2 * a)));
    beta = 2 * asin(sqrt((s - c) / (2 * a)));
    
    % Adjust alpha and beta for this transfer type
    alpha = 2 * pi - alpha;
    beta = -beta;
    
    % Compute the Time of Flight (TOF)
    TOF = (1/n) * (alpha - beta - (sin(alpha) - sin(beta)));
    
    % Compute the difference between target TOF and computed TOF
    TOF_diff = TOF_target - TOF;
end
