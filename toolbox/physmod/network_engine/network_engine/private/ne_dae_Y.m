function yval = ne_dae_Y(sys, t, x, u)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    yval = sys.Y(t, x, u);
end % function
