function transfer_angle = transfer_angle(r1hat, r2hat, design_choice)
    % design_choice == 1 meaning transfer angle greater than 180 degrees
    % else less than 180 degrees
    if design_choice == 1
        transfer_angle = 360 - acosd(dot(r1hat, r2hat) / (norm(r1hat) * norm(r2hat)));
    else
        transfer_angle = acosd(dot(r1hat, r2hat) / (norm(r1hat) * norm(r2hat)));
    end
    fprintf("The Transfer Angle is %.5f degrees \n", transfer_angle);
end
