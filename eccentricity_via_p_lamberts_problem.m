function [e, p] = eccentricity_via_p_lamberts_problem(a, c, s, r1, r2, alpha, beta)

    p = (4 * a * (s - r1) * (s - r2) / c^2) * (sin((alpha + beta) / 2)^2);

    e = sqrt(1 - (p/a));
    fprintf("Semi Latus Rectum (p) is %5f Km\n", p);
    fprintf("Eccentricity is %5f \n", e);
end
