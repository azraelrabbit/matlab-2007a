function dydx = ne_dae_DUM(sys, t, x, u)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    sparsity_DUM2 = sys.DUM2_P(t, x, u);
    n_inputs = size(sparsity_DUM2, 2.0);
    n_eqns = size(sparsity_DUM2, 1.0);
    n_x = length(x);
    sparsity_DUM2(plus(n_eqns, 1.0):n_x, 1.0:n_inputs) = 0.0;
    dydx = ne_tosparse(sparsity_DUM2, sys.DUM2(t, x, u));
end % function
