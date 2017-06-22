function hyd_valve_act_da(root, schema)
    % 1 30
    % 2 30
    % 3 30
    % 4 30
    % 5 30
    % 6 30
    % 7 30
    % 8 30
    % 9 30
    % 10 30
    % 11 30
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    schema.descriptor = 'Hydraulic Double-Acting Valve Actuator';
    % 30 34
    % 31 34
    % 32 34
    X = schema.terminal('X');
    X.description = 'Hydraulic Inlet X';
    X.domain = root.fl.hydraulic.hydraulic;
    X.label = 'X';
    X.location = {'Left',[0.25]};
    % 38 40
    Y = schema.terminal('Y');
    Y.description = 'Hydraulic Inlet Y';
    Y.domain = root.fl.hydraulic.hydraulic;
    Y.label = 'Y';
    Y.location = {'Left',[0.75]};
    % 44 46
    P = schema.output('P');
    P.description = 'Piston displacement';
    P.type = ne_type('real', [1.0 1.0], 'm');
    P.label = 'P';
    P.location = {'right',[0.5]};
    % 50 54
    % 51 54
    % 52 54
    ar_ax = schema.parameter('area_x');
    ar_ax.description = 'Piston area at port X';
    ar_ax.type = ne_type('real', [1.0 1.0], 'm^2');
    ar_ax.default = {[0.0002],'m^2'};
    % 57 59
    ar_ay = schema.parameter('area_y');
    ar_ay.description = 'Piston area at port Y';
    ar_ay.type = ne_type('real', [1.0 1.0], 'm^2');
    ar_ay.default = {[0.0002],'m^2'};
    % 62 64
    frc_pr_x = schema.parameter('frc_preload_x');
    frc_pr_x.description = 'Preload force at port X';
    frc_pr_x.type = ne_type('real', [1.0 1.0], 'N');
    frc_pr_x.default = 0.0;
    % 67 69
    frc_pr_y = schema.parameter('frc_preload_y');
    frc_pr_y.description = 'Preload force at port Y';
    frc_pr_y.type = ne_type('real', [1.0 1.0], 'N');
    frc_pr_y.default = 0.0;
    % 72 74
    frc_max_x = schema.parameter('frc_max_x');
    frc_max_x.description = 'Spring maximum force at port X';
    frc_max_x.type = ne_type('real', [1.0 1.0], 'N');
    frc_max_x.default = 50.0;
    % 77 79
    frc_max_y = schema.parameter('frc_max_y');
    frc_max_y.description = 'Spring maximum force at port Y';
    frc_max_y.type = ne_type('real', [1.0 1.0], 'N');
    frc_max_y.default = 50.0;
    % 82 84
    str_x = schema.parameter('piston_str_x');
    str_x.description = 'Piston stroke at port X';
    str_x.type = ne_type('real', [1.0 1.0], 'm');
    str_x.default = .005;
    % 87 89
    str_y = schema.parameter('piston_str_y');
    str_y.description = 'Piston stroke at port Y';
    str_y.type = ne_type('real', [1.0 1.0], 'm');
    str_y.default = .005;
    % 92 94
    act = schema.parameter('act_orientation');
    act.description = 'Actuator orientation';
    act.type = ne_type('real', [1.0 1.0], '1');
    act.default = 1.0;
    % 97 101
    % 98 101
    % 99 101
    var_int_px = schema.local_variable('pr_pilot_x');
    var_int_px.description = 'Pilot pressure at port X (Pa)';
    % 102 104
    var_int_py = schema.local_variable('pr_pilot_y');
    var_int_py.description = 'Pilot pressure at port Y (Pa)';
    % 105 107
    var_int_pd = schema.local_variable('pist_displacement');
    var_int_pd.description = 'Spool displacement (m)';
    % 108 110
    schema.setup(@setup);
    % 110 112
end
function setup(root, vlv_act_da)
    % 113 116
    % 114 116
    vlv_act_da.branch_across('p_x', vlv_act_da.X.p, []);
    vlv_act_da.branch_through('q_x', vlv_act_da.X.q, []);
    % 117 119
    vlv_act_da.branch_across('p_y', vlv_act_da.Y.p, []);
    vlv_act_da.branch_through('q_y', vlv_act_da.Y.q, []);
    % 120 124
    % 121 124
    % 122 124
    vlv_act_da.parameter('x_area_x', vlv_act_da.area_x.check('>', 0.0));
    vlv_act_da.parameter('x_frc_preload_x', vlv_act_da.frc_preload_x.check('>=', 0.0));
    % 125 127
    vlv_act_da.parameter('x_frc_max_x', vlv_act_da.frc_max_x.check('>', vlv_act_da.frc_preload_x));
    % 127 129
    vlv_act_da.parameter('x_piston_str_x', vlv_act_da.piston_str_x.check('>=', 0.0));
    % 129 131
    vlv_act_da.parameter('x_gain_x', mrdivide(vlv_act_da.piston_str_x, minus(vlv_act_da.frc_max_x, vlv_act_da.frc_preload_x)));
    % 131 134
    % 132 134
    vlv_act_da.parameter('x_area_y', vlv_act_da.area_y.check('>', 0.0));
    vlv_act_da.parameter('x_frc_preload_y', vlv_act_da.frc_preload_y.check('>=', 0.0));
    % 135 137
    vlv_act_da.parameter('x_frc_max_y', vlv_act_da.frc_max_y.check('>', vlv_act_da.frc_preload_y));
    % 137 139
    vlv_act_da.parameter('x_piston_str_y', vlv_act_da.piston_str_y.check('>=', 0.0));
    % 139 141
    vlv_act_da.parameter('x_gain_y', mrdivide(vlv_act_da.piston_str_y, minus(vlv_act_da.frc_max_y, vlv_act_da.frc_preload_y)));
    % 141 144
    % 142 144
    if eq(vlv_act_da.act_orientation, 2.0)
        x_or = -1.0;
    else
        x_or = 1.0;
    end
    vlv_act_da.parameter('x_or', x_or);
    vlv_act_da.parameter('x_init', {[0.0],'m'});
    % 150 153
    % 151 153
    vlv_act_da.equation(@equation);
end
function e = equation(sys, vlv_act_da)
    % 155 158
    % 156 158
    e = sys.equation;
    % 158 161
    % 159 161
    area_x = vlv_act_da.x_area_x;
    frc_preload_x = vlv_act_da.x_frc_preload_x;
    frc_max_x = vlv_act_da.x_frc_max_x;
    piston_str_x = vlv_act_da.x_piston_str_x;
    gain_x = vlv_act_da.x_gain_x;
    % 165 167
    area_y = vlv_act_da.x_area_y;
    frc_preload_y = vlv_act_da.x_frc_preload_y;
    frc_max_y = vlv_act_da.x_frc_max_y;
    piston_str_y = vlv_act_da.x_piston_str_y;
    gain_y = vlv_act_da.x_gain_y;
    % 171 173
    or = vlv_act_da.x_or;
    pr_pilot_x = vlv_act_da.p_x;
    pr_pilot_y = vlv_act_da.p_y;
    % 175 180
    % 176 180
    % 177 180
    % 178 180
    frc_spool = minus(mtimes(vlv_act_da.p_x, area_x), mtimes(vlv_act_da.p_y, area_y));
    % 180 182
    if gt(frc_spool, 0.0)
        if le(frc_spool, frc_preload_y)
            spool_displacement = vlv_act_da.x_init;
        else
            if ge(frc_spool, frc_max_y)
                spool_displacement = mtimes(piston_str_y, or);
            else
                spool_displacement = mtimes(mtimes(minus(frc_spool, frc_preload_y), gain_y), or);
            end
        end
    else
        if lt(frc_spool, 0.0)
            if le(neabs(frc_spool), frc_preload_x)
                spool_displacement = vlv_act_da.x_init;
            else
                if ge(neabs(frc_spool), frc_max_x)
                    spool_displacement = mtimes(uminus(piston_str_x), or);
                else
                    spool_displacement = mtimes(mtimes(uminus(minus(neabs(frc_spool), frc_preload_x)), gain_x), or);
                end
            end
        else
            spool_displacement = vlv_act_da.x_init;
        end
    end
    e(1.0) = minus(vlv_act_da.P, spool_displacement);
    e(2.0) = vlv_act_da.q_x;
    e(3.0) = vlv_act_da.q_y;
end
