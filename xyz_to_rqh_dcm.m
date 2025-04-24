function [rhat_rqh,vhat_rqh] = xyz_to_rqh_dcm(RAAN, i, true_anomaly, arg_periapsis, rhat, vhat)

    omega = RAAN;
    theta = true_anomaly + arg_periapsis;

    C11 = cosd(omega) * cosd(theta) - sind(omega) * cosd(i) * sind(theta);
    C12 = -cosd(omega) * sind(theta) - sind(omega) * cosd(i) * cosd(theta);
    C13 = sind(omega) * sind(i);
    C21 = sind(omega) * cosd(theta) + cosd(omega) * cosd(i) * sind(theta);
    C22 = -sind(omega) * sind(theta) + cosd(omega) * cosd(i) * cosd(theta);
    C23 = -cosd(omega) * sind(i);
    C31 = sind(i) * sind(theta);
    C32 = sind(i) * cosd(theta);
    C33 = cosd(i);
    
    C = [C11, C12, C13; C21, C22, C23; C31, C32, C33];

    rhat_rqh = (C) * rhat;
    vhat_rqh = (C) * vhat;
end
