function a = semi_major_axis_at_ascending_node(arg_periapsis, r_ascending_node, eccentricity)
    true_anomaly = - arg_periapsis;
    a = (r_ascending_node * (1+ (eccentricity * cosd(true_anomaly)))) / (1-eccentricity^2)
end
