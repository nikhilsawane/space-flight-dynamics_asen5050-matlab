function a = semi_major_axis_orbital_period(u_planet, orbital_period_seconds)
    a = (u_planet * (orbital_period_seconds/(2 * pi))^2)^(1/3);
end
