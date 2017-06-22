function reservoir(root, schema)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    schema.descriptor = 'Reservoir';
    % 20 23
    % 21 23
    V = schema.output('V');
    V.description = 'Fluid volume';
    V.location = {'Top';[0.25]};
    V.type = ne_type('real', [1.0 1.0], 'm^3');
    % 26 28
    P = schema.terminal('P');
    P.description = 'Pump inlet';
    P.domain = root.fl.hydraulic.hydraulic;
    P.location = {'Top';[0.5]};
    % 31 33
    R = schema.terminal('R');
    R.description = 'Return line';
    R.domain = root.fl.hydraulic.hydraulic;
    R.location = {'Top';[0.75]};
    % 36 39
    % 37 39
    pres = schema.parameter('press');
    pres.description = 'Pressurization level';
    pres.type = ne_type('real', [1.0 1.0], 'Pa');
    pres.default = 0.0;
    % 42 44
    vol = schema.parameter('init_volume');
    vol.description = 'Initial fluid volume';
    vol.type = ne_type('real', [1.0 1.0], 'm^3');
    vol.default = .02;
    % 47 49
    rd = schema.parameter('ret_diam');
    rd.description = 'Return line diameter';
    rd.type = ne_type('real', [1.0 1.0], 'm');
    rd.default = .02;
    % 52 54
    loss_coef = schema.parameter('loss_coeff');
    loss_coef.description = 'Pressure loss coefficient in return line';
    loss_coef.type = ne_type('real', [1.0 1.0], '1');
    loss_coef.default = 1.0;
    % 57 60
    % 58 60
    var_int_V = schema.local_variable('fluid_volume');
    var_int_V.description = 'Fluid volume (m^3)';
    % 61 63
    var_int_qp = schema.local_variable('flow_rate_ret');
    var_int_qp.description = 'Flow rate in return line (m^3/s)';
    % 64 66
    var_int_q = schema.local_variable('flow_rate_tank');
    var_int_q.description = 'Flow rate into tank (m^3/s)';
    % 67 69
    var_int_pr = schema.local_variable('pr_loss_ret');
    var_int_pr.description = 'Pressure loss in return line (Pa)';
    % 70 72
    var_int_p = schema.local_variable('power_loss');
    var_int_p.description = 'Power loss in return line (Pa)';
    % 73 75
    schema.setup(@setup);
    % 75 77
end % function
function setup(root, resrv)
    % 78 81
    % 79 81
    resrv.branch_across('p', resrv.P.p, []);
    resrv.branch_through('q', resrv.P.q, []);
    % 82 84
    resrv.branch_across('pr', resrv.R.p, resrv.P.p);
    resrv.branch_through('qr', resrv.R.q, resrv.P.q);
    % 85 88
    % 86 88
    resrv.parameter('x_press', resrv.press.check('>=', 0.0));
    resrv.parameter('x_init_volume', resrv.init_volume.check('>', 0.0));
    % 89 91
    resrv.parameter('x_ret_diam', resrv.ret_diam.check('>', 0.0, resrv.ret_diam.default));
    % 91 93
    resrv.parameter('x_loss_coeff', resrv.loss_coeff.check('>', 0.0, resrv.loss_coeff.default));
    % 93 96
    % 94 96
    resrv.parameter('density', resrv.P.density);
    resrv.parameter('viscosity_kin', resrv.P.viscosity_kin);
    % 97 100
    % 98 100
    area = mrdivide(mtimes(mtimes(3.141592653589793, resrv.ret_diam), resrv.ret_diam), 4.0);
    C_d = mpower(resrv.loss_coeff, .5);
    C_d_lam = mrdivide(mtimes(C_d, C_d), 15.0);
    % 102 104
    resrv.parameter('x_area', area);
    resrv.parameter('x_C_d', C_d);
    resrv.parameter('x_C_d_lam', C_d_lam);
    % 106 109
    % 107 109
    resrv.variable('volume', [1.0 1.0], 'm^3');
    % 109 111
    resrv.equation(@equation);
end % function
function e = equation(sys, resrv)
    % 113 116
    % 114 116
    e = sys.equation;
    % 116 119
    % 117 119
    press = resrv.x_press;
    area = resrv.x_area;
    ret_diam = resrv.x_ret_diam;
    init_volume = resrv.x_init_volume;
    density = resrv.density;
    viscosity_kin = resrv.viscosity_kin;
    C_d = resrv.x_C_d;
    C_d_lam = resrv.x_C_d_lam;
    % 126 128
    pr_loss_return = resrv.pr;
    fluid_volume = resrv.volume;
    % 129 132
    % 130 132
    flow_rate_ret = ne_flow_rate(area, pr_loss_return, C_d, C_d_lam, ret_diam, viscosity_kin, density);
    % 132 135
    % 133 135
    flow_rate_tank = resrv.q;
    % 135 138
    % 136 138
    power_loss = mtimes(resrv.pr, flow_rate_ret);
    % 138 140
    e(1.0) = minus(resrv.p, press);
    e(2.0) = minus(resrv.qr, flow_rate_ret);
    if sys.dc
        e(3.0) = minus(resrv.volume, resrv.init_volume);
    else
        e(3.0) = minus(resrv.volume.der, flow_rate_tank);
    end % if
    e(4.0) = minus(resrv.V, resrv.volume);
    % 147 149
end % function
