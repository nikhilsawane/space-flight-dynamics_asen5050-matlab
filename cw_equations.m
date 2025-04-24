function [x_expr, y_expr, z_expr] = cw_equations(x0, y0, z0, x0_dot, y0_dot, z0_dot, n)
    % CW Equations for relative motion in symbolic form
    % Inputs:
    %   x0      - Initial x position
    %   y0      - Initial y position
    %   z0      - Initial z position
    %   x0_dot  - Initial velocity in x direction
    %   y0_dot  - Initial velocity in y direction
    %   z0_dot  - Initial velocity in z direction
    %   n       - Mean motion of the reference orbit
    %
    % Outputs:
    %   x_expr  - Symbolic expression for x(t)
    %   y_expr  - Symbolic expression for y(t)
    %   z_expr  - Symbolic expression for z(t)

    % Declare symbolic variables
    syms t

    % CW Equations
    x_expr = vpa(simplify(4*x0 + (2/n)*y0_dot + (x0_dot/n)*sin(n*t) - (3*x0 + (2/n)*y0_dot)*cos(n*t)), 6);
    y_expr = vpa(simplify(y0 - (2/n)*x0_dot - 3*(2*n*x0 + y0_dot)*t + 2*(3*x0 + (2/n)*y0_dot)*sin(n*t) + (2/n)*x0_dot*cos(n*t)), 6);
    z_expr = vpa(simplify((1/n)*z0_dot*sin(n*t) + z0*cos(n*t)), 6);
end
