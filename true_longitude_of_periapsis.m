function true_longitude_of_periapsis = true_longitude_of_periapsis(eccentricity_vector)
    xhat = [1; 0; 0];
    yhat = [0; 1; 0];
    e = norm(eccentricity_vector);
    if dot(eccentricity_vector, yhat) > 0
        true_longitude_of_periapsis = acosd(dot(xhat, ehat) / e);
    else
        true_longitude_of_periapsis = -acosd(dot(xhat, ehat) / e);
    end
end
