function v_infinity = velocity_infinity_hyperbolic_orbit(semi_major_axis, u_planet)
    v_infinity = sqrt(u_planet/abs(semi_major_axis));
end