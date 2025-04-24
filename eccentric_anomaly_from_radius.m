function E = eccentric_anomaly_from_radius(eccentricity, semi_major_axis, radius)
    E = acos( (1/ eccentricity) * (1- (radius/semi_major_axis)) );
end