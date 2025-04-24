function [true_anomaly_prograde, true_anomaly_retrograde] = true_anomaly_at_semi_minor_axis(eccentricity)
        true_anomaly_prograde = acosd((1/eccentricity));
        true_anomaly_retrograde = -acosd((1/eccentricity));
end
