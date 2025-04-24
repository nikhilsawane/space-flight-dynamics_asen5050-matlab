function e = eccentricity(specific_energy, h, u_planet)
    e = sqrt(1 + (2 * specific_energy * h^2) / u_planet^2);
end
