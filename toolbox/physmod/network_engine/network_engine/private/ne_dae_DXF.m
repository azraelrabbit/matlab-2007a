function [J, is_linear] = ne_dae_DXF(sys, t, x, u)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    A = ne_tosparse(sys.A_P(t, x, u), sys.A(t, x, u));
    DXF1_P = sys.DXF1_P(t, x, u);
    DXF2_P = sys.DXF2_P(t, x, u);
    DXF1 = ne_tosparse(DXF1_P, sys.DXF1(t, x, u));
    DXF2 = ne_tosparse(DXF2_P, sys.DXF2(t, x, u));
    J = plus(A, vertcat(DXF1, DXF2));
    if gt(nargout, 1.0)
        % 18 20
        % 19 20
        DXF_nonlinear_pattern = vertcat(DXF1_P, DXF2_P);
        is_definitely_linear = ctranspose(not(any(DXF_nonlinear_pattern, 2.0)));
        % 22 25
        % 23 25
        % 24 25
        xfixed = x;
        xfixed(isnan(xfixed)) = 1.0;
        xfixed(isinf(xfixed)) = 1e+08;
        pertvec = max(abs(xfixed), 1e-08);
        xpert = plus(x, mtimes(1e+24, pertvec));
        oldmode = sys.ModeVector;
        sys.ModeVector = sys.MODE(t, xpert, u);
        DXF1pert = ne_tosparse(sys.DXF1_P(t, xpert, u), sys.DXF1(t, xpert, u));
        DXF2pert = ne_tosparse(sys.DXF2_P(t, xpert, u), sys.DXF2(t, xpert, u));
        Jdiff = minus(vertcat(DXF1pert, DXF2pert), vertcat(DXF1, DXF2));
        is_linear_from_perturbation = ctranspose(and(not(any(Jdiff, 2.0)), not(any(isnan(Jdiff), 2.0))));
        is_linear = or(is_definitely_linear, is_linear_from_perturbation);
        sys.ModeVector = oldmode;
    end % if
end % function
