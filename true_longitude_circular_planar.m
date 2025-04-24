function true_longitude = true_longitude_circular_planar(rhat)
    xhat = [1; 0; 0];
    yhat = [0; 1; 0];
    r = norm(rhat);
    if dot(rhat, yhat) > 0
        true_longitude = acosd(dot(xhat, rhat) / r);
    else
        true_longitude = -acosd(dot(xhat, rhat) / r);
    end
end
