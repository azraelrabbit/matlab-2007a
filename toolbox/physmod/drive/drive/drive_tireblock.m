function varargout = drive_tireblock(Mode, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    switch lower(Mode)
    case 'mask'
        % 13 16
        % 14 16
        varargout{1.0} = tire_parameters(varargin{:});
        % 16 18
    end % switch
function tp = tire_parameters(r_e, F_z, F_x_max, kappa_max, sigma_k)
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    tp.r_e = r_e;
    % 26 29
    % 27 29
    tp.F_z_sf = mrdivide(F_z, 3139.2);
    tp.F_x_sf = mrdivide(F_x_max, 3381.3);
    tp.kappa_sf = mrdivide(kappa_max, 10.93);
    % 31 34
    % 32 34
    a1 = -21.3;
    a2 = 1144.0;
    a3 = 49.6;
    a4 = 226.0;
    a5 = .069;
    a6 = -.006;
    a7 = .056;
    a8 = .486;
    % 41 44
    % 42 44
    D_x = plus(mtimes(a1, mpower(mrdivide(F_z, 1000.0), 2.0)), mtimes(a2, mrdivide(F_z, 1000.0)));
    C_x = 1.65;
    B_x = mtimes(mrdivide(plus(mtimes(a3, mpower(mrdivide(F_z, 1000.0), 2.0)), mtimes(a4, mrdivide(F_z, 1000.0))), mtimes(mtimes(C_x, D_x), exp(mtimes(a5, mrdivide(F_z, 1000.0))))), 100.0);
    tp.C_fk = mrdivide(mtimes(mtimes(mtimes(B_x, C_x), D_x), tp.F_x_sf), tp.kappa_sf);
    tp.C_fx = mrdivide(tp.C_fk, sigma_k);
    % 48 51
    % 49 51
    tp.sigma_min = .02;
    tp.k_V_low0 = 770.0;
    tp.V_low = 2.5;
    % 53 56
    % 54 56
    tp.kappa_bp = [0.0 .01 .02 .03 .04 .05 .06 .07 .08 .09 .1 .11 .12 .13 .14 .15 .16 .17 .18 .19 .2 .21 .22 .23 .24 .25 .26 .27 .28 .29 .3 .31 .32 .33 .34 .35000000000000003 .36 .37 .38 .39 .4 .41000000000000003 .42 .43 .44 .45 .46 .47000000000000003 .48 .49 .5 .51 .52 .53 .54 .55 .56 .5700000000000001 .58 .59 .6 .61 .62 .63 .6399999999999999 .6499999999999999 .6599999999999999 .6699999999999999 .6799999999999999 .69 .7 .71 .72 .73 .74 .75 .76 .77 .78 .79 .8 .81 .82 .83 .84 .85 .86 .87 .88 .89 .9 .91 .9199999999999999 .9299999999999999 .94 .95 .96 .97 .98 .99 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0];
    tp.F_z_bp = linspace(0.0, mtimes(2.0, max(F_z(:))), 101.0);
    [kappa_grid, F_z_grid] = meshgrid(tp.kappa_bp, tp.F_z_bp);
    tp.F_x_grid = tyre_Fx(kappa_grid, F_z_grid, a1, a2, a3, a4, a5, a6, a7, a8);
    tp.dFx_dFz_grid = tyre_dFx_dFz(kappa_grid, F_z_grid, a1, a2, a3, a4, a5, a6, a7, a8);
    tp.dFx_dkappa_grid = tyre_dFx_dkappa(kappa_grid, F_z_grid, a1, a2, a3, a4, a5, a6, a7, a8);
function F_x = tyre_Fx(kappa, F_z, a1, a2, a3, a4, a5, a6, a7, a8)
    % 62 76
    % 63 76
    % 64 76
    % 65 76
    % 66 76
    % 67 76
    % 68 76
    % 69 76
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    if eq(numel(F_z), 1.0)
        F_z = repmat(F_z, size(kappa));
    end % if
    % 78 80
    C_x = 1.65;
    ws = warning('off', 'MATLAB:divideByZero');
    weState = drive_handleerror('save_flags');
    F_x = times(plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z)), sin(times(C_x, atan(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(plus(plus(times(mtimes(1e-06, a6), power(F_z, 2.0)), times(mtimes(.001, a7), F_z)), a8), minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), atan(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa)))))))));
    drive_handleerror('restore_flags', weState);
    warning(ws.state, 'MATLAB:divideByZero');
    % 85 87
    F_x(eq(F_z, 0.0)) = 0.0;
function dFx_dkappa = tyre_dFx_dkappa(kappa, F_z, a1, a2, a3, a4, a5, a6, a7, a8)
    % 88 103
    % 89 103
    % 90 103
    % 91 103
    % 92 103
    % 93 103
    % 94 103
    % 95 103
    % 96 103
    % 97 103
    % 98 103
    % 99 103
    % 100 103
    % 101 103
    if eq(numel(F_z), 1.0)
        F_z = repmat(F_z, size(kappa));
    end % if
    % 105 107
    C_x = 1.65;
    ws = warning('off', 'MATLAB:divideByZero');
    [lm, lid] = lastwarn('');
    dFx_dkappa = rdivide(times(times(times(plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z)), cos(times(C_x, atan(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(plus(plus(times(mtimes(1e-06, a6), power(F_z, 2.0)), times(mtimes(.001, a7), F_z)), a8), minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), atan(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa))))))))), C_x), minus(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), times(plus(plus(times(mtimes(1e-06, a6), power(F_z, 2.0)), times(mtimes(.001, a7), F_z)), a8), minus(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), rdivide(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), plus(1.0, times(rdivide(rdivide(rdivide(mtimes(10000.0, power(plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z)), 2.0)), power(C_x, 2.0)), power(plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z)), 2.0)), power(exp(times(mtimes(.001, a5), F_z)), 2.0)), power(kappa, 2.0)))))))), plus(1.0, power(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(plus(plus(times(mtimes(1e-06, a6), power(F_z, 2.0)), times(mtimes(.001, a7), F_z)), a8), minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), atan(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa))))), 2.0)));
    lastwarn(lm, lid);
    warning(ws.state, 'MATLAB:divideByZero');
    % 112 114
    dFx_dkappa(eq(F_z, 0.0)) = 0.0;
function dFx_dFz = tyre_dFx_dFz(kappa, F_z, a1, a2, a3, a4, a5, a6, a7, a8)
    % 115 130
    % 116 130
    % 117 130
    % 118 130
    % 119 130
    % 120 130
    % 121 130
    % 122 130
    % 123 130
    % 124 130
    % 125 130
    % 126 130
    % 127 130
    % 128 130
    if eq(numel(F_z), 1.0)
        F_z = repmat(F_z, size(kappa));
    end % if
    % 132 134
    C_x = 1.65;
    ws = warning('off', 'MATLAB:divideByZero');
    [lm, lid] = lastwarn('');
    dFx_dFz = plus(times(plus(times(mtimes(2e-06, a1), F_z), mtimes(.001, a2)), sin(times(C_x, atan(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(plus(plus(times(mtimes(1e-06, a6), power(F_z, 2.0)), times(mtimes(.001, a7), F_z)), a8), minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), atan(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa))))))))), rdivide(times(times(times(plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z)), cos(times(C_x, atan(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(plus(plus(times(mtimes(1e-06, a6), power(F_z, 2.0)), times(mtimes(.001, a7), F_z)), a8), minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), atan(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa))))))))), C_x), minus(minus(minus(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(2e-06, a3), F_z), mtimes(.001, a4))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), power(plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z)), 2.0)), exp(times(mtimes(.001, a5), F_z))), kappa), plus(times(mtimes(2e-06, a1), F_z), mtimes(.001, a2)))), times(times(rdivide(rdivide(rdivide(mtimes(.1, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), a5)), times(plus(times(mtimes(2e-06, a6), F_z), mtimes(.001, a7)), minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), atan(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa))))), times(plus(plus(times(mtimes(1e-06, a6), power(F_z, 2.0)), times(mtimes(.001, a7), F_z)), a8), minus(minus(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(2e-06, a3), F_z), mtimes(.001, a4))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), power(plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z)), 2.0)), exp(times(mtimes(.001, a5), F_z))), kappa), plus(times(mtimes(2e-06, a1), F_z), mtimes(.001, a2)))), times(times(rdivide(rdivide(rdivide(mtimes(.1, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), a5)), rdivide(minus(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(2e-06, a3), F_z), mtimes(.001, a4))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), power(plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z)), 2.0)), exp(times(mtimes(.001, a5), F_z))), kappa), plus(times(mtimes(2e-06, a1), F_z), mtimes(.001, a2)))), times(times(rdivide(rdivide(rdivide(mtimes(.1, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), a5)), plus(1.0, times(rdivide(rdivide(rdivide(mtimes(10000.0, power(plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z)), 2.0)), power(C_x, 2.0)), power(plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z)), 2.0)), power(exp(times(mtimes(.001, a5), F_z)), 2.0)), power(kappa, 2.0)))))))), plus(1.0, power(minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), times(plus(plus(times(mtimes(1e-06, a6), power(F_z, 2.0)), times(mtimes(.001, a7), F_z)), a8), minus(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa), atan(times(rdivide(rdivide(rdivide(mtimes(100.0, plus(times(mtimes(1e-06, a3), power(F_z, 2.0)), times(mtimes(.001, a4), F_z))), C_x), plus(times(mtimes(1e-06, a1), power(F_z, 2.0)), times(mtimes(.001, a2), F_z))), exp(times(mtimes(.001, a5), F_z))), kappa))))), 2.0))));
    lastwarn(lm, lid);
    warning(ws.state, 'MATLAB:divideByZero');
    % 139 141
    dFx_dFz(eq(F_z, 0.0)) = mtimes(mtimes(.001, a2), sin(mtimes(atan(mrdivide(mrdivide(minus(plus(mtimes(mtimes(mtimes(a8, atan(mrdivide(mrdivide(mtimes(mtimes(100.0, kappa(eq(F_z, 0.0))), a4), C_x), a2))), C_x), a2), mtimes(mtimes(100.0, kappa(eq(F_z, 0.0))), a4)), mtimes(mtimes(mtimes(100.0, a8), kappa(eq(F_z, 0.0))), a4)), C_x), a2)), C_x)));
