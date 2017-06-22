function fd_val = ne_dae_Fd(sys, t, x, u, n_d)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    fval = ne_dae_F(sys, t, x, u);
    fd_val = fval(1.0:n_d);
end % function
