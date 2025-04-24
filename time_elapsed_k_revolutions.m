function time_elapsed = time_elapsed_k_revolutions(mean_motion, E2, e, E1, k)
    time_elapsed = (1/mean_motion) * ((2 * pi * k) + (E2 - e * sin(E2)) - (E1 - e * sin(E1)));
    
    % Given time in seconds
    time_in_seconds = time_elapsed;

    % Conversion factors
    seconds_per_day = 86400;   % Seconds in a day
    seconds_per_hour = 3600;    % Seconds in an hour
    
    % Convert seconds to days and hours
    time_in_days = time_in_seconds / seconds_per_day;
    time_in_hours = time_in_seconds / seconds_per_hour;
    
    % Display the results
    fprintf('Time in days: %.6f days\n', time_in_days);
    fprintf('Time in hours: %.6f hours\n', time_in_hours);
end