function [status, ABCD, c_err_id, c_err_msg] = ne_linearize(sys, t, x, u, leftScales, rightScales)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    [M, n_d] = ne_dae_M(sys, t, x, u);
    n = length(x);
    Md = spdiags(M, 0.0, n_d, n_d);
    J = ne_dae_DXF(sys, t, x, u);
    dfdu = ne_dae_DUF(sys, t, x, u);
    % 30 33
    % 31 33
    dydx = ne_dae_DXY(sys, t, x, u);
    dydu = ne_dae_DUY(sys, t, x, u);
    % 34 37
    % 35 37
    dMdx = ne_dae_DXM(sys, t, x, u);
    dMdu = ne_dae_DUM(sys, t, x, u);
    statedepM = gt(nnz(dMdx), 0.0) || gt(nnz(dMdu), 0.0);
    % 39 41
    if statedepM
        fval = ne_dae_F(sys, t, x, u);
    end
    % 43 45
    if not(isempty(leftScales)) && not(isempty(rightScales))
        % 45 47
        leftScales = leftScales(1.0:n);
        rightScales = rightScales(1.0:n);
        [leftMatrix, rightMatrix] = ne_get_scale_matrices_from_factors(leftScales, rightScales);
        Md = mtimes(mtimes(leftMatrix(1.0:n_d, 1.0:n_d), Md), rightMatrix(1.0:n_d, 1.0:n_d));
        J = mtimes(mtimes(leftMatrix, J), rightMatrix);
        dfdu = mtimes(leftMatrix, dfdu);
        dydx = mtimes(dydx, rightMatrix);
        if statedepM
            fval = mtimes(leftMatrix, fval);
            dMdx = mtimes(mtimes(mtimes(rightMatrix, leftMatrix), dMdx), rightMatrix);
            dMdu = mtimes(mtimes(rightMatrix, leftMatrix), dMdu);
        end
    end
    % 59 68
    % 60 68
    % 61 68
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    Jdd = J(1.0:n_d, 1.0:n_d);
    Jad = J(plus(n_d, 1.0):end, 1.0:n_d);
    Jda = J(1.0:n_d, plus(n_d, 1.0):end);
    Jaa = J(plus(n_d, 1.0):end, plus(n_d, 1.0):end);
    dfd_du = dfdu(1.0:n_d, :);
    dfa_du = dfdu(plus(n_d, 1.0):end, :);
    % 73 75
    dy_dxd = dydx(:, 1.0:n_d);
    dy_dxa = dydx(:, plus(n_d, 1.0):end);
    % 76 78
    if statedepM
        xd_dot = mldivide(Md, fval(1.0:n_d));
        xd_dot_matrix = spdiags(xd_dot, 0.0, n_d, n_d);
        dMd_dxd = dMdx(1.0:n_d, 1.0:n_d);
        dMd_dxa = dMdx(1.0:n_d, plus(n_d, 1.0):end);
        dMd_du = dMdu(1.0:n_d, :);
    end
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    [lastWarnMsg, lastWarnId] = lastwarn;
    lastwarn('');
    % 90 92
    warning('off', 'MATLAB:singularMatrix');
    warning('off', 'MATLAB:nearlySingularMatrix');
    dxa_dxd = mldivide(uminus(Jaa), Jad);
    dxa_du = mldivide(uminus(Jaa), dfa_du);
    % 95 97
    Arhs = plus(Jdd, mtimes(Jda, dxa_dxd));
    Brhs = plus(dfd_du, mtimes(Jda, dxa_du));
    if statedepM
        % 99 101
        dMwhole_dxd = plus(dMd_dxd, mtimes(dMd_dxa, dxa_dxd));
        dMwhole_du = plus(dMd_du, mtimes(dMd_dxa, dxa_du));
        Arhs = minus(Arhs, mtimes(xd_dot_matrix, dMwhole_dxd));
        Brhs = minus(Brhs, mtimes(xd_dot_matrix, dMwhole_du));
    end
    % 105 107
    A = mldivide(Md, Arhs);
    B = mldivide(Md, Brhs);
    C = plus(dy_dxd, mtimes(dy_dxa, dxa_dxd));
    D = plus(dydu, mtimes(dy_dxa, dxa_du));
    % 110 112
    [dummy, ourWarnId] = lastwarn;
    c_err_msg = '';
    if strcmp(ourWarnId, 'MATLAB:singularMatrix') || strcmp(ourWarnId, 'MATLAB:nearlySingularMatrix')
        c_err_id = 'network_engine:ne_linearize:NearSingular';
        status = 1.0;
    else
        c_err_id = '';
        status = 0.0;
    end
    % 120 125
    % 121 125
    % 122 125
    % 123 125
    ABCD = full(vertcat(horzcat(A, B), horzcat(C, D)));
    % 125 127
    lastwarn(lastWarnMsg, lastWarnId);
end
