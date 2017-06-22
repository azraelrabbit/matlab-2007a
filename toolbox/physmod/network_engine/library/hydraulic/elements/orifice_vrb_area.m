function orifice_vrb_area(root, schema)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    schema.descriptor = 'Variable Area Orifice';
    % 22 25
    % 23 25
    AR = schema.input('AR');
    AR.description = 'Orifice Area';
    AR.location = {'Left';[0.25]};
    AR.type = ne_type('real', [1.0 1.0], 'm^2');
    % 28 30
    A = schema.terminal('A');
    A.description = 'Orifice inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 33 35
    B = schema.terminal('B');
    B.description = 'Orifice outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 38 42
    % 39 42
    % 40 42
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 45 47
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 50 53
    % 51 53
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the orifice (m^3)';
    % 54 56
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the orifice (Pa)';
    % 57 59
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the orifice (W)';
    % 60 62
    schema.setup(@setup);
    % 62 64
end % function
function setup(root, or_v_area)
    % 65 68
    % 66 68
    or_v_area.branch_across('p', or_v_area.A.p, or_v_area.B.p);
    or_v_area.branch_through('q', or_v_area.A.q, or_v_area.B.q);
    % 69 72
    % 70 72
    or_v_area.parameter('x_C_d', or_v_area.C_d.check('>', 0.0, or_v_area.C_d.default));
    % 72 74
    or_v_area.parameter('x_Re_cr', or_v_area.Re_cr.check('>', 0.0, or_v_area.Re_cr.default));
    % 74 76
    or_v_area.parameter('C_d_lam', mrdivide(mpower(or_v_area.C_d, 2.0), or_v_area.Re_cr));
    % 76 78
    or_v_area.parameter('density', or_v_area.A.density);
    or_v_area.parameter('viscosity_kin', or_v_area.A.viscosity_kin);
    % 79 81
    or_v_area.equation(@equation);
end % function
function e = equation(sys, or_v_area)
    % 83 86
    % 84 86
    e = sys.equation;
    % 86 89
    % 87 89
    C_d = or_v_area.x_C_d;
    Re_cr = or_v_area.x_Re_cr;
    C_d_lam = or_v_area.C_d_lam;
    density = or_v_area.density;
    viscosity_kin = or_v_area.viscosity_kin;
    % 93 97
    % 94 97
    % 95 97
    pr_drop = or_v_area.p;
    area = or_v_area.AR;
    % 98 101
    % 99 101
    D_h = sqrt(mrdivide(mtimes(4.0, area), 3.141592653589793));
    % 101 104
    % 102 104
    flow_rate = ne_flow_rate(area, pr_drop, C_d, C_d_lam, D_h, viscosity_kin, density);
    % 104 107
    % 105 107
    power = mtimes(pr_drop, flow_rate);
    % 107 109
    e(1.0) = minus(or_v_area.q, flow_rate);
end % function
