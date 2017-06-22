function gear_box(root, schema)
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
    % 17 18
    schema.descriptor = 'Gear Box';
    % 19 21
    % 20 21
    S = schema.terminal('S');
    S.description = 'Input shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.location = {'Left';[0.5]};
    % 25 26
    O = schema.terminal('O');
    O.description = 'Output shaft';
    O.domain = root.fl.mechanical.rotational.rotational;
    O.location = {'Right';[0.5]};
    % 30 32
    % 31 32
    R = schema.parameter('ratio');
    R.description = 'Gear ratio';
    R.type = ne_type('real', [1.0 1.0], '1');
    R.default = 5.0;
    % 36 38
    % 37 38
    var_int_T = schema.local_variable('torque_inp');
    var_int_T.description = 'Input shaft torque (N*m)';
    % 40 41
    var_int_v = schema.local_variable('ang_velocity_inp');
    var_int_v.description = 'Input shaft angular velocity (rad/s)';
    % 43 44
    var_int_P = schema.local_variable('power');
    var_int_P.description = 'Power transmitted by the box (W)';
    % 46 47
    schema.setup(@setup);
end % function
function setup(root, gear_box)
    % 50 52
    % 51 52
    gear_box.branch_across('w_in', gear_box.S.w, []);
    gear_box.branch_through('t_in', gear_box.S.t, []);
    % 54 55
    gear_box.branch_across('w_out', gear_box.O.w, []);
    gear_box.branch_through('t_out', gear_box.O.t, []);
    % 57 59
    % 58 59
    gear_box.parameter('x_ratio', gear_box.ratio.check('~=', 0.0));
    % 60 62
    % 61 62
    gear_box.equation(@equation);
end % function
function e = equation(sys, gear_box)
    % 65 67
    % 66 67
    e = sys.equation;
    % 68 70
    % 69 70
    ratio = gear_box.x_ratio;
    % 71 72
    torque_inp = gear_box.t_in;
    ang_velocity_inp = gear_box.w_in;
    % 74 75
    e(1.0) = plus(gear_box.t_out, mtimes(ratio, gear_box.t_in));
    e(2.0) = minus(gear_box.w_in, mtimes(ratio, gear_box.w_out));
    % 77 78
end % function
