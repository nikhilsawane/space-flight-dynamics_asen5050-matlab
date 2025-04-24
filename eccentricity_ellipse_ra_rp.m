function e = eccentricity_ellipse_ra_rp(periapsis_radius, apoapsis_radius)
    e = (apoapsis_radius - periapsis_radius) / (apoapsis_radius + periapsis_radius);
end