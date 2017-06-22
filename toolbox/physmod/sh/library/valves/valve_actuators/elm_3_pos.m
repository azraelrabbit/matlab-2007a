function elm_3_pos(root, schema)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    schema.descriptor = '3-Position Valve Actuator';
    % 21 23
    A = schema.input('A');
    A.description = 'Control Signal A';
    A.type = ne_type('real', [1.0 1.0], '1');
    A.label = 'A';
    A.location = {'left',[0.25]};
    % 27 29
    B = schema.input('B');
    B.description = 'Control Signal B';
    B.type = ne_type('real', [1.0 1.0], '1');
    B.label = 'B';
    B.location = {'left',[0.75]};
    % 33 35
    P = schema.output('P');
    P.description = 'Push-pin';
    P.type = ne_type('real', [1.0 1.0], 'm');
    P.label = '';
    P.location = {'right',[0.5]};
    % 39 42
    % 40 42
    stroke = schema.parameter('stroke');
    stroke.description = 'Push-pin stroke';
    stroke.type = ne_type('real', [1.0 1.0], 'm');
    stroke.default = .01;
    % 45 47
    t_on = schema.parameter('t_on');
    t_on.description = 'Switching-on time';
    t_on.type = ne_type('real', [1.0 1.0], 's');
    t_on.default = .1;
    % 50 52
    t_off = schema.parameter('t_off');
    t_off.description = 'Switching-off time';
    t_off.type = ne_type('real', [1.0 1.0], 's');
    t_off.default = .1;
    % 55 57
    act_signal = schema.parameter('act_signal');
    act_signal.description = 'Nominal signal value';
    act_signal.type = ne_type('real', [1.0 1.0], '1');
    act_signal.default = 24.0;
    % 60 62
    init_position = schema.parameter('init_position');
    init_position.description = 'Initial position';
    init_position.type = ne_type('real', [1.0 1.0], '1');
    init_position.default = 1.0;
    % 65 67
    schema.setup(@setup);
end % function
function setup(root, elm_3_pos)
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    x_stroke = elm_3_pos.stroke.check('>', 0.0);
    x_t_on = elm_3_pos.t_on.check('>', 0.0);
    x_t_off = elm_3_pos.t_off.check('>', 0.0);
    x_act_signal = elm_3_pos.act_signal.check('>', 0.0);
    % 77 79
    if eq(elm_3_pos.init_position, 1.0)
        % 79 81
        x_init_A = 0.0;
        x_init_B = 0.0;
    else
        if eq(elm_3_pos.init_position, 2.0)
            x_init_A = 1.0;
            x_init_B = 0.0;
        else
            % 87 89
            x_init_A = 0.0;
            x_init_B = 1.0;
        end % if
        % 91 95
        % 92 95
        % 93 95
    end % if
    elm_2_A = elm_3_pos.element('elm_2_A', root.sh.valves.valve_actuators.elm_2_pos);
    elm_2_A.stroke = x_stroke;
    elm_2_A.t_on = x_t_on;
    elm_2_A.t_off = x_t_off;
    elm_2_A.act_signal = x_act_signal;
    elm_2_A.act_orientation = 1.0;
    elm_2_A.init_position = x_init_A;
    % 102 104
    elm_2_B = elm_3_pos.element('elm_2_B', root.sh.valves.valve_actuators.elm_2_pos);
    % 104 106
    elm_2_B.stroke = x_stroke;
    elm_2_B.t_on = x_t_on;
    elm_2_B.t_off = x_t_off;
    elm_2_B.act_signal = x_act_signal;
    elm_2_B.act_orientation = 0.0;
    elm_2_B.init_position = x_init_B;
    % 111 113
    add = elm_3_pos.element('add', root.fl.physical_signal.functions.ps_add);
    % 113 117
    % 114 117
    % 115 117
    s1 = elm_3_pos.signal('s1', elm_2_A.P);
    s2 = elm_3_pos.signal('s2', elm_2_B.P);
    % 118 120
    elm_3_pos.connect(elm_2_A.C, elm_3_pos.A);
    elm_3_pos.connect(add.I1, s1);
    % 121 123
    elm_3_pos.connect(elm_2_B.C, elm_3_pos.B);
    elm_3_pos.connect(add.I2, s2);
    % 124 126
    elm_3_pos.connect(add.O, elm_3_pos.P);
    % 126 128
end % function
