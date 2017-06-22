function spool_valve_hydr_force(root, schema)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    schema.descriptor = 'Spool Orifice Hydraulic Force';
    % 18 22
    % 19 22
    % 20 22
    A = schema.terminal('A');
    A.description = 'Orifice inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.label = 'A';
    A.location = {'Left',[0.25]};
    % 26 28
    S = schema.input('S');
    S.description = 'Spool displacement';
    S.location = {'Left';[0.75]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 31 33
    B = schema.terminal('B');
    B.description = 'Orifice outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.25]};
    % 36 38
    F = schema.output('F');
    F.description = 'Axial hydraulic force';
    F.type = ne_type('real', [1.0 1.0], 'N');
    F.label = 'F';
    F.location = {'right',[0.75]};
    % 42 46
    % 43 46
    % 44 46
    w = schema.parameter('w');
    w.description = 'Orifice width';
    w.type = ne_type('real', [1.0 1.0], 'm');
    w.default = .01;
    % 49 51
    Cl = schema.parameter('rad_clear');
    Cl.description = 'Radial clearance';
    Cl.type = ne_type('real', [1.0 1.0], 'm');
    Cl.default = 1e-05;
    % 54 56
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 59 61
    or = schema.parameter('or');
    or.description = 'Orifice orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 64 68
    % 65 68
    % 66 68
    var_int_px = schema.local_variable('flow_rate');
    var_int_px.description = 'Flow rate thrpugh the orifice (m^3/s)';
    % 69 71
    var_int_py = schema.local_variable('opening');
    var_int_py.description = 'Orifice opening (m)';
    % 72 74
    var_int_ang = schema.local_variable('jet_angle');
    var_int_ang.description = 'Jet angle (deg)';
    % 75 77
    var_int_pd = schema.local_variable('axial_force');
    var_int_pd.description = 'Hydraulic axial force (N)';
    % 78 80
    schema.setup(@setup);
    % 80 82
end % function
function setup(root, vlv_hydr_frc)
    % 83 86
    % 84 86
    vlv_hydr_frc.branch_across('p', vlv_hydr_frc.A.p, vlv_hydr_frc.B.p);
    vlv_hydr_frc.branch_through('q', vlv_hydr_frc.A.q, vlv_hydr_frc.B.q);
    % 87 90
    % 88 90
    vlv_hydr_frc.parameter('x_w', vlv_hydr_frc.w.check('>', 0.0));
    vlv_hydr_frc.parameter('x_rad_clear', vlv_hydr_frc.rad_clear.check('>', 0.0));
    % 91 94
    % 92 94
    x_or = vlv_hydr_frc.or;
    if eq(x_or, 2.0)
        x_or = -1.0;
    end % if
    vlv_hydr_frc.parameter('x_or', x_or);
    vlv_hydr_frc.parameter('density', vlv_hydr_frc.A.density);
    % 99 101
    vlv_hydr_frc.variable('theta', [1.0 1.0], 'rad');
    % 101 103
    vlv_hydr_frc.equation(@equation);
end % function
function e = equation(sys, vlv_hydr_frc)
    % 105 108
    % 106 108
    e = sys.equation;
    % 108 111
    % 109 111
    w = vlv_hydr_frc.x_w;
    rad_clear = vlv_hydr_frc.x_rad_clear;
    x_0 = vlv_hydr_frc.x_0;
    or = vlv_hydr_frc.x_or;
    density = vlv_hydr_frc.density;
    % 115 117
    flow_rate = vlv_hydr_frc.q;
    % 117 119
    ang = vlv_hydr_frc.theta;
    jet_angle = mrdivide(mtimes(ang, 180.0), 3.141592653589793);
    % 120 122
    opening = plus(x_0, mtimes(vlv_hydr_frc.S, or));
    if ge(opening, 0.0)
        area = mtimes(w, sqrt(plus(mpower(opening, 2.0), mpower(rad_clear, 2.0))));
        rel_opening = mrdivide(opening, rad_clear);
    else
        area = mtimes(w, rad_clear);
        rel_opening = 0.0;
    end % if
    % 129 131
    axial_force = mtimes(mtimes(mrdivide(mtimes(uminus(density), mpower(flow_rate, 2.0)), area), cos(ang)), or);
    % 131 140
    % 132 140
    % 133 140
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    e(1.0) = minus(vlv_hydr_frc.theta, plus(.3663, mtimes(.8373, minus(1.0, exp(mrdivide(uminus(rel_opening), 1.848))))));
    % 140 142
    e(2.0) = minus(vlv_hydr_frc.F, axial_force);
    e(3.0) = vlv_hydr_frc.p;
    % 143 145
end % function
