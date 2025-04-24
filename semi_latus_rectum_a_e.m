function p = semi_latus_rectum_a_e(semi_major_axis, eccentricity)
    p = semi_major_axis * (1 - (eccentricity^2));
end