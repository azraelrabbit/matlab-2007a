function hyd_valve_act_sa(root, schema)
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
    schema.descriptor = 'Hydraulic Single-Acting Valve Actuator';
    % 22 26
    % 23 26
    % 24 26
    X = schema.terminal('X');
    X.description = 'Hydraulic Inlet X';
    X.domain = root.fl.hydraulic.hydraulic;
    X.label = 'X';
    X.location = {'Left',[0.5]};
    % 30 32
    P = schema.output('P');
    P.description = 'Piston displacement';
    P.type = ne_type('real', [1.0 1.0], 'm');
    P.label = 'P';
    P.location = {'right',[0.5]};
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    ar_a = schema.parameter('area');
    ar_a.description = 'Piston area';
    ar_a.type = ne_type('real', [1.0 1.0], 'm^2');
    ar_a.default = {[0.0002],'m^2'};
    % 45 47
    frc_pr = schema.parameter('frc_preload');
    frc_pr.description = 'Preload force';
    frc_pr.type = ne_type('real', [1.0 1.0], 'N');
    frc_pr.default = 20.0;
    % 50 52
    frc_max = schema.parameter('frc_max');
    frc_max.description = 'Full stroke force';
    frc_max.type = ne_type('real', [1.0 1.0], 'N');
    frc_max.default = 70.0;
    % 55 57
    str = schema.parameter('piston_str');
    str.description = 'Piston stroke';
    str.type = ne_type('real', [1.0 1.0], 'm');
    str.default = .005;
    % 60 62
    act_orientation = schema.parameter('act_orientation');
    act_orientation.description = 'Actuator orientation';
    act_orientation.type = ne_type('real', [1.0 1.0], '1');
    act_orientation.default = 1.0;
    % 65 69
    % 66 69
    % 67 69
    var_int_pl = schema.local_variable('pr_pilot');
    var_int_pl.description = 'Pilot pressure (Pa)';
    % 70 72
    var_int_d = schema.local_variable('pist_displacement');
    var_int_d.description = 'Piston displacement (m)';
    % 73 75
    schema.setup(@setup);
    % 75 77
end % function
function setup(root, vlv_act_sa)
    % 78 81
    % 79 81
    vlv_act_sa.branch_across('p_x', vlv_act_sa.X.p, []);
    vlv_act_sa.branch_through('q_x', vlv_act_sa.X.q, []);
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    vlv_act_sa.parameter('x_area', vlv_act_sa.area.check('>', 0.0));
    vlv_act_sa.parameter('x_frc_preload', vlv_act_sa.frc_preload.check('>=', 0.0));
    vlv_act_sa.parameter('x_frc_max', vlv_act_sa.frc_max.check('>=', vlv_act_sa.frc_preload));
    % 89 91
    vlv_act_sa.parameter('x_piston_str', vlv_act_sa.piston_str.check('>', 0.0));
    vlv_act_sa.parameter('x_gain', mrdivide(vlv_act_sa.piston_str, minus(vlv_act_sa.frc_max, vlv_act_sa.frc_preload)));
    % 92 95
    % 93 95
    if eq(vlv_act_sa.act_orientation, 2.0)
        x_or = -1.0;
    else
        x_or = 1.0;
    end % if
    vlv_act_sa.parameter('x_or', x_or);
    % 100 102
    vlv_act_sa.parameter('x_init', {[0.0],'m'});
    % 102 104
    vlv_act_sa.equation(@equation);
end % function
function e = equation(sys, vlv_act_sa)
    % 106 109
    % 107 109
    e = sys.equation;
    % 109 112
    % 110 112
    area = vlv_act_sa.x_area;
    % 112 114
    frc_preload = vlv_act_sa.x_frc_preload;
    frc_max = vlv_act_sa.x_frc_max;
    piston_str = vlv_act_sa.x_piston_str;
    gain = vlv_act_sa.x_gain;
    or = vlv_act_sa.x_or;
    % 118 121
    % 119 121
    frc_piston = mtimes(vlv_act_sa.p_x, area);
    % 121 123
    if le(frc_piston, frc_preload)
        piston_displacement = vlv_act_sa.x_init;
    else
        if ge(frc_piston, frc_max)
            piston_displacement = mtimes(piston_str, or);
        else
            % 128 130
            piston_displacement = mtimes(mtimes(minus(frc_piston, frc_preload), gain), or);
            % 130 132
        end % if
        % 132 134
    end % if
    e(1.0) = minus(vlv_act_sa.P, piston_displacement);
    e(2.0) = vlv_act_sa.q_x;
end % function
