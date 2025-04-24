function b = semi_minor_axis(eccentricity, semi_major_axis)
    b = semi_major_axis * sqrt(1 - eccentricity^2);
end