function i = calculate_inclination_from_RAAN_Omega_dot(RAAN_dot, u_planet, J2, radius_central_body, e, a)
    % Calculate the inclination (i) based on the provided formula.
    %
    % Inputs:
    %   RAAN_dot - Rate of change of RAAN (rad/s)
    %   u_planet        - Gravitational parameter (km^3/s^2)
    %   J2        - Second zonal harmonic (dimensionless)
    %   radius_central_body         - Radius of the central body (km)
    %   e         - Orbital eccentricity (dimensionless)
    %   a         - Semi-major axis (km)
    %
    % Output:
    %   i         - Orbital inclination (radians)

    % Calculate cos(i)
    cos_i = (RAAN_dot * 2 * (1 - e^2)^2 * a^(7/2)) / (-3 * sqrt(u_planet) * J2 * radius_central_body^2);
    
    % Calculate inclination in degrees
    i = acosd(cos_i);
end
