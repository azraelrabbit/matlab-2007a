function dfdu = ne_dae_DUF(sys, t, x, u)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    B = ne_tosparse(sys.B_P(t, x, u), sys.B(t, x, u));
    DUF1 = ne_tosparse(sys.DUF1_P(t, x, u), sys.DUF1(t, x, u));
    DUF2 = ne_tosparse(sys.DUF2_P(t, x, u), sys.DUF2(t, x, u));
    dfdu = plus(B, vertcat(DUF1, DUF2));
end % function
