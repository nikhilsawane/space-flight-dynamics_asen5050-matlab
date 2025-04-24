function delta_v = delta_v_from_rocket_equation(Isp, g, initial_mass, propellant_mass)
    delta_v = -Isp * g * log(1 - propellant_mass/initial_mass);
end








