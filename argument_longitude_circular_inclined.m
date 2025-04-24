function argument_longitude = argument_longitude_circular_inclined(line_of_nodes_vector, rhat)
    zhat = [0; 0; 1];
    r = norm(rhat);
    n = norm(line_of_nodes_vector);
    if dot(rhat, zhat) > 0
        argument_longitude = acosd(dot(line_of_nodes_vector, rhat) / n * r);
    else
        argument_longitude = -acosd(dot(line_of_nodes_vector, rhat) / n * r);
    end
end
