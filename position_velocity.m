function [r2hat, v2hat] = position_velocity(f, g, f_dot, g_dot, rhat, vhat)
    r2hat = f * rhat + g * vhat;
    v2hat = f_dot * rhat + g_dot * vhat;
end
