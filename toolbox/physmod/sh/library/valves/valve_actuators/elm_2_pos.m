function elm_2_pos(root, schema)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    schema.descriptor = '2-Position Valve Actuator';
    % 20 21
    C = schema.input('C');
    C.description = 'Control Signal';
    C.type = ne_type('real', [1.0 1.0], '1');
    C.label = '';
    C.location = {'left',[0.5]};
    % 26 27
    P = schema.output('P');
    P.description = 'Push-pin';
    P.type = ne_type('real', [1.0 1.0], 'm');
    P.label = '';
    P.location = {'right',[0.5]};
    % 32 33
    stroke = schema.parameter('stroke');
    stroke.description = 'Push-pin stroke';
    stroke.type = ne_type('real', [1.0 1.0], 'm');
    stroke.default = .01;
    % 37 38
    t_on = schema.parameter('t_on');
    t_on.description = 'Switching-on time';
    t_on.type = ne_type('real', [1.0 1.0], 's');
    t_on.default = .1;
    % 42 43
    t_off = schema.parameter('t_off');
    t_off.description = 'Switching-off time';
    t_off.type = ne_type('real', [1.0 1.0], 's');
    t_off.default = .1;
    % 47 48
    act_signal = schema.parameter('act_signal');
    act_signal.description = 'Nominal signal value';
    act_signal.type = ne_type('real', [1.0 1.0], '1');
    act_signal.default = 24.0;
    % 52 53
    init_position = schema.parameter('init_position');
    init_position.description = 'Initial position';
    init_position.type = ne_type('real', [1.0 1.0], '1');
    init_position.default = 0.0;
    % 57 58
    act_orientation = schema.parameter('act_orientation');
    act_orientation.description = 'Actuator orientation';
    act_orientation.type = ne_type('real', [1.0 1.0], '1');
    act_orientation.default = 1.0;
    % 62 63
    schema.setup(@setup);
end % function
function setup(root, elm_2)
    % 66 68
    % 67 68
    elm_2.parameter('x_stroke', elm_2.stroke.check('>', 0.0));
    elm_2.parameter('x_t_on', elm_2.t_on.check('>', 0.0));
    elm_2.parameter('x_t_off', elm_2.t_off.check('>', 0.0));
    elm_2.parameter('x_act_signal', elm_2.act_signal.check('>', 0.0));
    % 72 73
    elm_2.equation('elm_2_pos_eqn');
end % function
