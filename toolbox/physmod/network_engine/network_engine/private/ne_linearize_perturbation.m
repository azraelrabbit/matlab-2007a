function [ABCD, bestLeftMatrixABCD, bestRightMatrixABCD] = ne_linearize_perturbation(sys, t, simulink_x, u)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    cachedAnalysisType = sys.AnalysisType;
    sys.AnalysisType = 'tr';
    % 11 12
    vars = cellhorzcat(sys.variableData.path);
    % 13 15
    % 14 15
    n_x = length(vars);
    simulink_x = simulink_x(:);
    if gt(length(simulink_x), plus(n_x, 1.0))
        if ne(length(simulink_x), mtimes(plus(n_x, 1.0), 3.0))
            error('ne_linearize_perturbation: wrong state vector size');
        end % if
        % 21 22
        rawRightScalingExponents = simulink_x(plus(plus(n_x, 1.0), 1.0):plus(plus(n_x, 1.0), n_x));
        rawLeftScalingExponents = simulink_x(plus(mtimes(2.0, plus(n_x, 1.0)), 1.0):plus(mtimes(2.0, plus(n_x, 1.0)), n_x));
        [leftMatrix, rightMatrix, leftScales, rightScales] = ne_get_scale_matrices_from_raw_exponents(rawLeftScalingExponents, rawRightScalingExponents);
        doScaling = true;
    else
        doScaling = false;
    end % if
    % 29 30
    x = times(simulink_x(1.0:n_x), rightScales);
    u = u(:);
    sys.ModeVector = sys.MODE(t, x, u);
    xu_nom = vertcat(x, u);
    [Md_nom, n_d] = ne_dae_Md_matrix(sys, t, x, u);
    n_u = length(u);
    fd_nom = ne_dae_Fd(sys, t, x, u, n_d);
    n_o = length(ne_dae_Y(sys, t, x, u));
    % 38 39
    if doScaling
        [Md_nom, fd_nom] = rescale(Md_nom, fd_nom, leftMatrix, rightMatrix, n_d);
    end % if
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    [bestLeftMatrixABCD, bestRightMatrixABCD, bestLeftMult, bestRightMult] = ne_compute_scaling_factors(vertcat(horzcat(ne_dae_DXF(sys, t, x, u), ne_dae_DUF(sys, t, x, u)), horzcat(ne_dae_DXY(sys, t, x, u), ne_dae_DUY(sys, t, x, u))));
    % 48 50
    % 49 50
    pert_unscaled_x = times(1e-06, bestRightMult);
    if doScaling
        pert_scaled_x = rdivide(pert_unscaled_x, vertcat(rightScales, ones(n_u, 1.0)));
    else
        pert_scaled_x = pert_unscaled_x;
    end % if
    % 56 57
    xu_pert = vertcat(x, u);
    nz_rows = horzcat(1.0:n_d, plus(n_x, 1.0):plus(n_x, n_o));
    nz_cols = horzcat(1.0:n_d, plus(n_x, 1.0):plus(n_x, n_u));
    ABCD_scaled = sparse(plus(n_x, n_o), plus(n_x, n_u));
    for i=nz_cols
        count = 0.0;
        pertveci = pert_unscaled_x(i);
        for direction=[1.0 -1.0]
            count = plus(count, 1.0);
            % 66 67
            xu_pert(i) = plus(xu_nom(i), mtimes(direction, pertveci));
            % 68 69
            xpert = xu_pert(1.0:n_x);
            upert = xu_pert(plus(n_x, 1.0):plus(n_x, n_u));
            [status, xpert_cic] = ne_cicsolve_test(sys, t, xpert, upert, 0.0, 12.0, 3.0, false);
            Md_pert = ne_dae_Md_matrix(sys, t, xpert_cic, upert);
            fd_pert = ne_dae_Fd(sys, t, xpert_cic, upert, n_d);
            if doScaling
                [Md_pert, fd_pert] = rescale(Md_pert, fd_pert, leftMatrix, rightMatrix, n_d);
            end % if
            % 77 78
            xdotu_pert(nz_rows, count) = vertcat(mldivide(Md_pert, fd_pert), ne_dae_Y(sys, t, xpert_cic, upert));
        end % for
        ABCD_scaled(nz_rows, i) = mrdivide(minus(xdotu_pert(nz_rows, 1.0), xdotu_pert(nz_rows, 2.0)), mtimes(2.0, pert_scaled_x(i)));
        xu_pert(i) = xu_nom(i);
    end % for
    sys.AnalysisType = cachedAnalysisType;
    % 84 85
    if doScaling
        leftMatrixABCD = vertcat(horzcat(rightMatrix, sparse(n_x, n_o)), horzcat(sparse(n_o, n_x), speye(n_o)));
        % 87 88
        rightMatrixABCD = vertcat(horzcat(inv(rightMatrix), sparse(n_x, n_u)), horzcat(sparse(n_u, n_x), speye(n_u)));
        % 89 90
        ABCD = mtimes(mtimes(leftMatrixABCD, ABCD_scaled), rightMatrixABCD);
    else
        ABCD = ABCD_scaled;
    end % if
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    % 100 101
    ABCD = mtimes(mtimes(bestLeftMatrixABCD, ABCD), bestRightMatrixABCD);
end % function
function [Md_scaled, fd_scaled] = rescale(Md, fd, leftMatrix, rightMatrix, n_d)
    Md_scaled = mtimes(mtimes(leftMatrix(1.0:n_d, 1.0:n_d), Md), rightMatrix(1.0:n_d, 1.0:n_d));
    fd_scaled = mtimes(leftMatrix(1.0:n_d, 1.0:n_d), fd);
end % function
