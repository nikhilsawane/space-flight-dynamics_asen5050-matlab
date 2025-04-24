function [delta_V1, delta_V2] = maneuvers_lamberts_problem(v1hat_final, v1hat_initial, v2hat_final, v2hat_initial)
    delta_V1 = (v1hat_final - v1hat_initial); 
    delta_V2 = (v2hat_final - v2hat_initial);

    fprintf('\nDelta_V1 vector: \n');
    fprintf('Delta V1 = [%.6f, %.6f, %.6f] km/s \n', delta_V1(1), delta_V1(2), delta_V1(3));
    
    fprintf('\nDelta_V1 vector: \n');
    fprintf('Delta V2 = [%.6f, %.6f, %.6f] km/s\n', delta_V2(1), delta_V2(2), delta_V2(3));

    fprintf("\nDelta V1: %5f Km/s \n", norm(delta_V1));
    fprintf("Delta V2: %5f Km/s \n", norm(delta_V2));
end