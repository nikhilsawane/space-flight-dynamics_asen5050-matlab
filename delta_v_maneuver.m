function delta_v = delta_v_maneuver(v2hat_rqh, v1hat_rqh)
    delta_v = abs(v2hat_rqh - v1hat_rqh);
end