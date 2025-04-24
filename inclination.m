function i = inclination(hhat)
    h = norm(hhat);
    i = acosd(hhat(3) / h);
end
