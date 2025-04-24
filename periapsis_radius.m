function rp = periapsis_radius(eccentricity, semi_major_axis)
    rp = semi_major_axis * (1 - eccentricity);
end