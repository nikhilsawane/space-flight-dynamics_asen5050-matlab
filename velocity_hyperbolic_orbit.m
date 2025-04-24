function velocity = velocity_hyperbolic_orbit(v_infinity, escape_velocity)
    velocity = sqrt(escape_velocity^2 + v_infinity^2);
end