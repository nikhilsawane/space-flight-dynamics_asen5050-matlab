function semi_perimeter = semi_perimeter(r1, r2, chord_length)
    semi_perimeter = 0.5 * (r1 + r2 + chord_length);
    fprintf("The Semi Perimeter is %.5f Km \n", semi_perimeter);
end
