function r = radius_from_specific_energy(v, u_planet, specific_energy)
    r = u_planet / ((v^2/2) - specific_energy);
end
