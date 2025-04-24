function escape_velocity = escape_velocity_hyperbolic_orbit(radius, u_planet)
    escape_velocity = sqrt(2 * u_planet / radius);
end