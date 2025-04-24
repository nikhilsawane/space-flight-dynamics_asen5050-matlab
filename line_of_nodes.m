function [nhat, n] = line_of_nodes(hhat)
    zhat = [0; 0; 1];
    nhat = cross(zhat, hhat);
    n = norm(nhat);
end
