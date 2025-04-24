function ah = semi_major_axis_hyperbolic_flyby(v_infinity_in, u_planet)
    ah = -u_planet/v_infinity_in^2;
end