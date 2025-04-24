function J2 = J2P(Omega_dot, e, a, i, u_planet, R)
    % Inputs:
    % Omega_dot: Nodal precession rate (rad/s)
    % e: Orbital eccentricity
    % a: Semi-major axis (in km)
    % i: Inclination (in degrees)
    % mu: Gravitational parameter of the planet (km^3/s^2)
    % R: Radius of the planet (in km)

    % Compute (1 - e^2)^2
    term1 = (1 - e^2)^2;

    % Compute a^(7/2)
    a_seven_half = a^(7/2);

    % Compute J2
    J2 = - (Omega_dot * term1 * a_seven_half) / ...
         ( (3/2) * cosd(i) * sqrt(u_planet) * R^2 );
end
