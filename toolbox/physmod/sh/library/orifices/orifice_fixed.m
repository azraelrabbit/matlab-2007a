function orifice_fixed(root, schema)
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
    schema.descriptor = 'Fixed Orifice';
    % 20 23
    % 21 23
    A = schema.terminal('A');
    A.description = 'Orifice inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 26 28
    B = schema.terminal('B');
    B.description = 'Orifice outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 31 34
    % 32 34
    area = schema.parameter('area');
    area.description = 'Orifice area';
    area.type = ne_type('real', [1.0 1.0], 'm^2');
    area.default = .0001;
    % 37 39
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 42 44
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 47 50
    % 48 50
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the orifice (m^3/s)';
    % 51 53
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the orifice (Pa)';
    % 54 56
    var_int_Re = schema.local_variable('Re');
    var_int_Re.description = 'Reynolds number';
    % 57 59
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 60 62
    schema.setup(@setup);
    % 62 64
end % function
function setup(root, or_fixed)
    % 65 68
    % 66 68
    or_fixed.branch_across('p', or_fixed.A.p, or_fixed.B.p);
    or_fixed.branch_through('q', or_fixed.A.q, or_fixed.B.q);
    % 69 72
    % 70 72
    or_fixed.parameter('x_area', or_fixed.area.check('>', 0.0));
    or_fixed.parameter('x_C_d', or_fixed.C_d.check('>', 0.0, or_fixed.C_d.default));
    or_fixed.parameter('x_Re_cr', or_fixed.Re_cr.check('>', 0.0, or_fixed.Re_cr.default));
    % 74 76
    or_fixed.parameter('density', or_fixed.A.density);
    or_fixed.parameter('viscosity_kin', or_fixed.A.viscosity_kin);
    % 77 79
    or_fixed.equation(@equation);
end % function
function e = equation(sys, or_fixed)
    % 81 84
    % 82 84
    e = sys.equation;
    % 84 87
    % 85 87
    area = or_fixed.x_area;
    C_d = or_fixed.x_C_d;
    Re_cr = or_fixed.x_Re_cr;
    density = or_fixed.density;
    viscosity_kin = or_fixed.viscosity_kin;
    % 91 95
    % 92 95
    % 93 95
    C_d_lam = mrdivide(mtimes(C_d, C_d), Re_cr);
    D_h = sqrt(mrdivide(mtimes(4.0, area), 3.141592653589793));
    % 96 99
    % 97 99
    pr_drop = or_fixed.p;
    % 99 101
    flow_rate = ne_flow_rate(area, pr_drop, C_d, C_d_lam, D_h, viscosity_kin, density);
    % 101 104
    % 102 104
    power = mtimes(pr_drop, flow_rate);
    % 104 106
    e(1.0) = minus(or_fixed.q, flow_rate);
    % 106 108
end % function
