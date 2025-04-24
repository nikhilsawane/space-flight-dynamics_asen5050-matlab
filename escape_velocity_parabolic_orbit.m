function escape_velocity = escape_velocity_parabolic_orbit(radius, u_planet)
    vc = sqrt(u_planet/radius);
    escape_velocity = sqrt(2) * vc;
end