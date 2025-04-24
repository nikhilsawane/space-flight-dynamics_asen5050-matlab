function arg_periapsis = argument_of_periapsis(line_of_nodes_vector, eccentricity_vector)
    zhat = [0 0 1];
    e = norm(eccentricity_vector);
    n = norm(line_of_nodes_vector);

    if dot(eccentricity_vector, zhat) > 0
        arg_periapsis = acosd(dot(line_of_nodes_vector, eccentricity_vector) / (n * e));
    else
        arg_periapsis = -acosd(dot(line_of_nodes_vector, eccentricity_vector) / (n * e));
    end
end
