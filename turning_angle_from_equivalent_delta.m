function turning_angle = turning_angle_from_equivalent_delta(v_eq, v_infinity)
    turning_angle = 2 * asind(v_eq/ (2 * v_infinity));
end

