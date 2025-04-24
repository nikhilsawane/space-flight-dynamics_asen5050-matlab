function P = orbital_period(u_planet, semi_major_axis)
    P = 2 * pi * sqrt(semi_major_axis^3/u_planet);
    
    % Given time in seconds
    time_in_seconds = P;

    % Conversion factors
    seconds_per_day = 86400;   % Seconds in a day
    seconds_per_hour = 3600;    % Seconds in an hour
    
    % Convert seconds to days and hours
    time_in_days = time_in_seconds / seconds_per_day;
    time_in_hours = time_in_seconds / seconds_per_hour;
    
    % Display the results
%    fprintf('Time in days: %.6f days\n', time_in_days);
%    fprintf('Time in hours: %.6f hours\n', time_in_hours);
end

