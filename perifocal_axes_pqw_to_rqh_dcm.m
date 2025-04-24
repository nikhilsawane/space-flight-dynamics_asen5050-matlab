function [rhat_rqh,vhat_rqh] = perifocal_axes_pqw_to_rqh_dcm(true_anomaly, rhat_pqw, vhat_pqw)


    C11 = cosd(true_anomaly);
    C12 = -sind(true_anomaly);
    C13 = 0;
    C21 = -sind(true_anomaly);
    C22 = cosd(true_anomaly);
    C23 = 0;
    C31 = 0;
    C32 = 0;
    C33 = 1;
    
    C = [C11, C12, C13; C21, C22, C23; C31, C32, C33];

    rhat_rqh = (C) * rhat_pqw;
    vhat_rqh = (C) * vhat_pqw;
end
