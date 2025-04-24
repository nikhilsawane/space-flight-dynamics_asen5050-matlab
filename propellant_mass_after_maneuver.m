function mp = propellant_mass_after_maneuver(initial_mass, delta_v, Isp, g)
    mp = initial_mass * (1 - exp(-delta_v/(Isp * g)));
end