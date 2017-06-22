function dmdx = ne_dae_DXM(sys, t, x, u)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    % 9 10
    sparsity_DXM2 = sys.DXM2_P(t, x, u);
    n_vars = size(sparsity_DXM2, 2.0);
    n_eqns = size(sparsity_DXM2, 1.0);
    sparsity_DXM2(plus(n_eqns, 1.0):n_vars, 1.0:n_vars) = 0.0;
    dmdx = ne_tosparse(sparsity_DXM2, sys.DXM2(t, x, u));
end % function
