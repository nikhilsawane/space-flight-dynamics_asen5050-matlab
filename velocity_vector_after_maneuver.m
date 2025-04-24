function vhat_rqh = velocity_vector_after_maneuver(v2, flight_path_angle)
    vhat_rqh = [v2 * sind(flight_path_angle); v2 * cosd(flight_path_angle); 0];
end