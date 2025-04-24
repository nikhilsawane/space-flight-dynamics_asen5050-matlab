function chord_length = chord_length(r1, r2, transfer_angle)
    chord_length = sqrt(r1^2 + r2^2 - 2 * r1 * r2 * cosd(transfer_angle));
    fprintf("The Chord length is %.5f Km \n", chord_length);
end
