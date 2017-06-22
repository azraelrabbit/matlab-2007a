function fval = ne_dae_F(sys, t, x, u)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    A = ne_tosparse(sys.A_P(t, x, u), sys.A(t, x, u));
    B = ne_tosparse(sys.B_P(t, x, u), sys.B(t, x, u));
    f1 = sys.F1(t, x, u);
    f2 = sys.F2(t, x, u);
    g = sys.G(t, x, u);
    fval = plus(plus(plus(A * x', B * u'), vertcat(f1, f2)), g);
end
