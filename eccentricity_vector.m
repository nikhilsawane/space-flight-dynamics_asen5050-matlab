function ehat = eccentricity_vector(vhat, hhat, u_planet, rhat)
    r = norm(rhat);
    ehat = ((cross(vhat, hhat) / u_planet) - (rhat / r));
end
