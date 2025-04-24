function RAAN = RAAN(hhat)
    xhat = [1; 0; 0];
    yhat = [0; 1; 0];
    zhat = [0; 0; 1];
    nhat = cross(zhat,hhat);
    n = norm(nhat);
    if dot(nhat, yhat) > 0
        RAAN = acosd(dot(nhat, xhat) / n);
    else
        RAAN = -acosd(dot(nhat, xhat) / n);
    end
end
