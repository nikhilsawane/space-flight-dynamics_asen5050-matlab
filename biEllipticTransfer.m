function [delta_v1, delta_v2, delta_v3, total_delta_v, TOF] = biEllipticTransfer(a_initial, a_final, rb, u_planet)
    % BI_ELLIPTIC_TRANSFER calculates the delta-v for a bi-elliptic transfer
    %
    % INPUTS:
    %   a_initial   - Radius of the initial circular orbit (m)
    %   a_final     - Radius of the final circular orbit (m)
    %   rb          - Apogee radius of the two transfer ellipses (m)
    %   u_planet    - Gravitational parameter of the central body (m^3/s^2)
    %
    % OUTPUTS:
    %   delta_v1       - Delta-v for the first prograde burn (m/s)
    %   delta_v2       - Delta-v for the second prograde burn (m/s)
    %   delta_v3       - Delta-v for the retrograde burn (m/s)
    %   total_delta_v  - Total delta-v for the bi-elliptic transfer (m/s)
    
    % Semimajor axes of the two elliptical transfer orbits
    a1 = (a_initial + rb) / 2;
    a2 = (a_final + rb) / 2;

    % Delta-v for the first burn (prograde burn at a_initial)
    delta_v1 = sqrt(2 * u_planet / a_initial - u_planet / a1) - sqrt(u_planet / a_initial);
    
    % Delta-v for the second burn (prograde burn at rb)
    delta_v2 = sqrt(2 * u_planet / rb - u_planet / a2) - sqrt(2 * u_planet / rb - u_planet / a1);
    
    % Delta-v for the third burn (retrograde burn at a_final)
    delta_v3 = sqrt(u_planet / a_final) - sqrt(2 * u_planet / a_final - u_planet / a2);
    
    % Total delta-v is the sum of all three burns
    total_delta_v = abs(delta_v1) + abs(delta_v2) + abs(delta_v3);

    % Time for the first half orbit (first transfer ellipse)
    t1 = pi * sqrt(a1^3 / u_planet);
    
    % Time for the second half orbit (second transfer ellipse)
    t2 = pi * sqrt(a2^3 / u_planet);
    
    % Total transfer time
    TOF = t1 + t2;

    % Display the results
    fprintf('\n');
    fprintf('##########################################################################################################\n');
    fprintf('Bi-elliptic Tranfer\n');
    fprintf('##########################################################################################################\n');
    fprintf('Delta-V1 (Initial Burn)    : %.5f Km/s\n', delta_v1);
    fprintf('Delta-V2 (Mid Burn)        : %.5f Km/s\n', delta_v2);
    fprintf('Delta-V3 (Final Burn)   : %.5f Km/s\n', delta_v3);
    fprintf('Total Delta -V          : %.5f Km/s\n', total_delta_v);
    fprintf('Time of Flight (TOF): %.5f seconds (%.5f hours)(%.5f days)(%.5f years)\n', TOF, TOF/3600, TOF/86400, TOF/(365.25*86400));
    fprintf('Initial orbit velocity: %.5f Km/s\n', sqrt(u_planet/a_initial));
    fprintf('Final orbit velocity: %.5f Km/s\n', sqrt(u_planet/a_final));

end
