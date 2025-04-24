function [deltaV1, deltaV2, delta_v_total, TOF] = hohmannTransfer(a_initial, a_final, u_planet)

    % Input:
    % a_initial - semi-major axis of the initial orbit (km)
    % a_final - semi-major axis of the final orbit (km)
    % u_planet - gravitational parameter (GM) of the planet

    r1i = a_initial;
    r2f = a_final;
    rpt = a_initial;
    rat = a_final;

    % Step 1: Calculate the velocity in the initial and final orbits
    vi = sqrt(u_planet / r1i);  % Initial orbit velocity
    vf = sqrt(u_planet / r2f);      % Final orbit velocity
    
    % Step 2: Calculate the semi-major axis and eccentricity of the transfer orbit
    at = (rpt + rat) / 2;  % Semi-major axis of the transfer orbit
    et = (rat - rpt) / (rat + rpt); % Ecentricity of the transfer orbit

    % Step 3: Calculate the delta-v for the transfer
    deltaV1 = sqrt((2 * u_planet/a_initial) - (u_planet/at)) - sqrt(u_planet/a_initial);  % Delta-v for the first burn (initial orbit to transfer)
    deltaV2 = sqrt(u_planet/a_final) - sqrt((2 * u_planet/a_final) - (u_planet/at));   % Delta-v for the second burn (transfer to final orbit)

    % Step 4: Calculating Vtotal
    delta_v_total = abs(deltaV1) + abs(deltaV2);

    % Step 5: Calculate the transfer time (half the period of the elliptical transfer orbit)
    TOF = pi * sqrt(at^3 / u_planet);  % Transfer time (in seconds)

    % Display the results
    fprintf('');
    fprintf('##########################################################################################################\n');
    fprintf('Hohmann Tranfer\n');
    fprintf('##########################################################################################################\n');
    fprintf('Delta-V1 (Initial Burn)    : %.5f Km/s\n', deltaV1);
    fprintf('Delta-V2 (Final Burn)   : %.5f Km/s\n', deltaV2);
    fprintf('Total Delta -V          : %.5f Km/s\n', delta_v_total);
    fprintf('Time of Flight (TOF): %.5f seconds (%.5f hours)(%.5f days)(%.5f years)\n', TOF, TOF/3600, TOF/86400, TOF/(365.25*86400));
    fprintf('Transfer orbit semi-major axis: %.5f Km\n', at);
    fprintf('Transfer orbit eccentricity: %.5f \n', et);
    fprintf('Initial orbit velocity: %.5f Km/s\n', vi);
    fprintf('Final orbit velocity: %.5f Km/s\n', vf);
    fprintf('\n');
end
