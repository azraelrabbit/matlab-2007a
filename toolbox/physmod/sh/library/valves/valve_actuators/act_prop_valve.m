function act_prop_valve(root, schema)
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
    schema.descriptor = 'Proportional and Servo-Valve Actuator';
    % 19 20
    I = schema.input('I');
    I.description = 'Input';
    I.label = '';
    I.location = {'Left',[0.5]};
    % 24 25
    O = schema.output('O');
    O.description = 'Output';
    O.label = '';
    O.location = {'Right',[0.5]};
    O.type = ne_type('real', [1.0 1.0], 'm');
    % 30 32
    % 31 32
    gain = schema.parameter('gain');
    gain.description = 'Gain';
    gain.type = ne_type('real', [1.0 1.0], '1');
    gain.default = 377.0;
    % 36 37
    t = schema.parameter('time_constant');
    t.description = 'Time constant';
    t.type = ne_type('real', [1.0 1.0], 's');
    t.default = .002;
    % 41 42
    s = schema.parameter('saturation');
    s.description = 'Saturation';
    s.type = ne_type('real', [1.0 1.0], '1');
    s.default = .3;
    % 46 47
    schema.setup(@setup);
end % function
function setup(root, act_prop)
    % 50 53
    % 51 53
    % 52 53
    x_saturation = act_prop.saturation.check('>', 0.0);
    x_gain = act_prop.gain.check('>', 0.0);
    x_time_constant = act_prop.time_constant.check('>', 0.0);
    % 56 59
    % 57 59
    % 58 59
    sb1 = act_prop.element('sb1', root.fl.physical_signal.functions.ps_subtract);
    % 60 62
    % 61 62
    sat_el = act_prop.element('sat_el', root.fl.physical_signal.nonlinear.ps_saturation);
    sat_el.upper_limit = x_saturation;
    sat_el.lower_limit = uminus(x_saturation);
    % 65 67
    % 66 67
    g1 = act_prop.element('g1', root.fl.physical_signal.functions.ps_gain);
    g1.gain = x_gain;
    % 69 71
    % 70 71
    i1 = act_prop.element('i1', root.fl.physical_signal.linear.ps_integrator);
    % 72 74
    % 73 74
    sb2 = act_prop.element('sb2', root.fl.physical_signal.functions.ps_subtract);
    % 75 77
    % 76 77
    g2 = act_prop.element('g2', root.fl.physical_signal.functions.ps_gain);
    g2.gain = mrdivide(1.0, x_time_constant);
    % 79 81
    % 80 81
    i2 = act_prop.element('i2', root.fl.physical_signal.linear.ps_integrator);
    % 82 84
    % 83 84
    s1 = act_prop.signal('s1', sb1.O);
    s2 = act_prop.signal('s2', sat_el.O);
    s3 = act_prop.signal('s3', g1.O);
    s4 = act_prop.signal('s4', i1.O);
    s5 = act_prop.signal('s5', sb2.O);
    s6 = act_prop.signal('s6', g2.O);
    s7 = act_prop.signal('s7', i2.O);
    % 91 94
    % 92 94
    % 93 94
    act_prop.connect(sb1.I1, act_prop.I);
    act_prop.connect(sb1.I2, s7);
    % 96 98
    % 97 98
    act_prop.connect(sat_el.I, s1);
    % 99 101
    % 100 101
    act_prop.connect(g1.I, s2);
    % 102 104
    % 103 104
    act_prop.connect(i1.I, s3);
    % 105 107
    % 106 107
    act_prop.connect(sb2.I1, s4);
    act_prop.connect(sb2.I2, s7);
    % 109 111
    % 110 111
    act_prop.connect(g2.I, s5);
    % 112 114
    % 113 114
    act_prop.connect(i2.I, s6);
    act_prop.connect(i2.O, act_prop.O);
    % 116 117
end % function
