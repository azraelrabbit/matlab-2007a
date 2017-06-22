function dydx = ne_dae_DXY(sys, t, x, u)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    % 9 11
    % 10 11
    dydx = ne_tosparse(sys.DXY_P(t, x, u), sys.DXY(t, x, u));
end % function
