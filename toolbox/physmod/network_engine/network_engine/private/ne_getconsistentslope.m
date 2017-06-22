function yp0 = ne_getconsistentslope(sys, t0, y0, probaux, indexReduce)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    u = ne_evalinputsandknownderivs(t0, probaux.u);
    udot = zeros(probaux.nu, 1.0);
    f0 = ne_dae_F_mi(sys, t0, y0, u);
    Mcol = ne_dae_M(sys, t0, y0, u);
    yp0 = zeros(probaux.n, 1.0);
    if not(indexReduce)
        yp0(1.0:probaux.nx) = ldivide(Mcol(1.0:probaux.nx), f0(1.0:probaux.nx));
    else
        M = spdiags(Mcol, 0.0, probaux.n, probaux.n);
        A = ne_tosparse(sys.A_P(t0, y0, u), sys.A(t0, y0, u));
        DXF2 = ne_tosparse(sys.DXF2_P(t0, y0, u), sys.DXF2(t0, y0, u));
        M(plus(probaux.nx, 1.0):probaux.n, :) = plus(A(plus(probaux.nx, 1.0):probaux.n, :), DXF2);
        rhs = f0;
        B = ne_tosparse(sys.B_P(t0, y0, u), sys.B(t0, y0, u));
        dgdt = sys.GDOT(t0, y0, u);
        rhs(plus(probaux.nx, 1.0):probaux.n) = minus(uminus(dgdt(plus(probaux.nx, 1.0):probaux.n)), mtimes(B(plus(probaux.nx, 1.0):probaux.n, :), udot));
        yp0 = mldivide(M, rhs);
        'yp0_diff_err = '
        max(abs(minus(yp0(1.0:probaux.nx), ldivide(Mcol(1.0:probaux.nx), f0(1.0:probaux.nx)))))
    end % if
end % function
