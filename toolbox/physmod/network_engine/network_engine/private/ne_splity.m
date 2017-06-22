function [x, z] = ne_splity(y, nx)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    x = y(1.0:nx);
    z = y(plus(nx, 1.0):end);
end % function
