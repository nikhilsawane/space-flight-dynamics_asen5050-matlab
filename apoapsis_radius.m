function ra = apoapsis_radius(eccentricity, semi_major_axis)
    ra = semi_major_axis * (1 + eccentricity);
end