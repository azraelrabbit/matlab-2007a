function orifice_cnst_area(root, schema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    schema.descriptor = 'Constant Area Orifice';
    % 17 20
    % 18 20
    A = schema.terminal('A');
    A.description = 'Orifice inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 23 25
    B = schema.terminal('B');
    B.description = 'Orifice outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 28 31
    % 29 31
    area = schema.parameter('area');
    area.description = 'Orifice area';
    area.type = ne_type('real', [1.0 1.0], 'm^2');
    area.default = .0001;
    % 34 36
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 39 41
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 44 47
    % 45 47
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the orifice (m^3/s)';
    % 48 50
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the orifice (Pa)';
    % 51 53
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 54 56
    schema.setup(@setup);
    % 56 58
end % function
function setup(root, or_fixed)
    % 59 62
    % 60 62
    or_fixed.branch_across('p', or_fixed.A.p, or_fixed.B.p);
    or_fixed.branch_through('q', or_fixed.A.q, or_fixed.B.q);
    % 63 66
    % 64 66
    or_fixed.parameter('x_area', or_fixed.area.check('>', 0.0));
    or_fixed.parameter('x_C_d', or_fixed.C_d.check('>', 0.0, or_fixed.C_d.default));
    % 67 69
    or_fixed.parameter('x_Re_cr', or_fixed.Re_cr.check('>', 0.0, or_fixed.Re_cr.default));
    % 69 72
    % 70 72
    or_fixed.parameter('C_d_lam', mrdivide(mpower(or_fixed.C_d, 2.0), or_fixed.Re_cr));
    or_fixed.parameter('D_h', mpower(mrdivide(mtimes(4.0, or_fixed.area), 3.141592653589793), .5));
    % 73 75
    or_fixed.parameter('density', or_fixed.A.density);
    or_fixed.parameter('viscosity_kin', or_fixed.A.viscosity_kin);
    % 76 78
    or_fixed.equation(@equation);
end % function
function e = equation(sys, or_fixed)
    % 80 83
    % 81 83
    e = sys.equation;
    % 83 86
    % 84 86
    area = or_fixed.x_area;
    C_d = or_fixed.x_C_d;
    Re_cr = or_fixed.x_Re_cr;
    C_d_lam = or_fixed.C_d_lam;
    % 89 91
    density = or_fixed.density;
    viscosity_kin = or_fixed.viscosity_kin;
    % 92 94
    D_h = sqrt(mrdivide(mtimes(4.0, area), 3.141592653589793));
    % 94 97
    % 95 97
    pr_drop = or_fixed.p;
    % 97 99
    flow_rate = ne_flow_rate(area, pr_drop, C_d, C_d_lam, D_h, viscosity_kin, density);
    % 99 102
    % 100 102
    power = mtimes(pr_drop, flow_rate);
    % 102 104
    e(1.0) = minus(or_fixed.q, flow_rate);
end % function
