function v_eq = equivalent_impulsive_maneuver(v_infinity, turning_angle)
    v_eq = abs(2 * v_infinity * sind(turning_angle / 2));
end

    