function h = specific_angular_momentum_u_a_e(u_planet, a, e)
    h = sqrt (u_planet * a * (1 - e^2));
end
