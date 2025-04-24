function [ta1, ta2] = true_anomaly_1_2_lamberts_problem(e, p, r1, r2, transfer_angle)
    ta1_plus = true_anomaly_without_qc(e, p, r1);
    ta1_minus = 360 - true_anomaly_without_qc(e, p, r1);
 
    ta2_plus = true_anomaly_without_qc(e, p, r2);
    ta2_minus = 360 - true_anomaly_without_qc(e, p, r2);

        % All possible combinations of ta1 and ta2
    ta1_options = [ta1_plus, ta1_minus];
    ta2_options = [ta2_plus, ta2_minus];
    
    % Initialize variables to store the best match
    closest_diff = inf;  % Start with a large number
    best_ta1 = 0;
    best_ta2 = 0;
    
    % Iterate through all combinations of ta1 and ta2
    for i = 1:length(ta1_options)
        for j = 1:length(ta2_options)
            % Calculate the difference ta2 - ta1
            diff = ta2_options(j) - ta1_options(i);
            
            % If the absolute difference is smaller than the closest_diff, update the best values
            if abs(diff - transfer_angle) < abs(closest_diff - transfer_angle)
                closest_diff = diff;
                best_ta1 = ta1_options(i);
                best_ta2 = ta2_options(j);
            end
        end
    end
    
    % Display the best results
    fprintf('TA1_plus_minus: %.5f \n', ta1_plus);
    fprintf('TA2_plus_minus: %.5f \n', ta2_plus);
    disp(['Best ta1: ', num2str(best_ta1)]);
    disp(['Best ta2: ', num2str(best_ta2)]);
    disp(['Closest difference (ta2 - ta1): ', num2str(closest_diff)]);
    ta1 = best_ta1;
    ta2 = best_ta2;
end