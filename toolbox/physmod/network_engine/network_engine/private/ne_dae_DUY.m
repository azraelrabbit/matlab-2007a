function dydu = ne_dae_DUY(sys, t, x, u)
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
    dydu = ne_tosparse(sys.DUY_P(t, x, u), sys.DUY(t, x, u));
end % function
