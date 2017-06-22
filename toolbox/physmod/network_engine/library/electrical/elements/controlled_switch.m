function controlled_switch(root, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    schema.descriptor = 'Switch';
    % 15 18
    % 16 18
    % 17 18
    vT = schema.input('vT');
    vT.description = 'Control signal';
    vT.type = ne_type('real', [1.0 1.0], '1');
    vT.label = 'PS';
    vT.location = {'Bottom';[0.25]};
    % 23 24
    n = schema.terminal('n');
    n.description = 'Negative Pin';
    n.domain = root.fl.electrical.electrical;
    n.label = '';
    n.location = {'Bottom';[0.75]};
    % 29 30
    p = schema.terminal('p');
    p.description = 'Positive Pin';
    p.domain = root.fl.electrical.electrical;
    p.label = '';
    p.location = {'Top';[0.5]};
    % 35 38
    % 36 38
    % 37 38
    R_closed = schema.parameter('R_closed');
    R_closed.description = 'Closed resistance R_closed';
    R_closed.type = ne_type('real', [1.0 1.0], 'Ohm');
    R_closed.default = {[0.01],'Ohm'};
    % 42 43
    G_open = schema.parameter('G_open');
    G_open.description = 'Open conductance G_open';
    G_open.type = ne_type('real', [1.0 1.0], '1/Ohm');
    G_open.default = {[1e-08],'1/Ohm'};
    % 47 49
    % 48 49
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Current (A)';
    % 51 52
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage (V)';
    % 54 55
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 57 58
    schema.setup(@setup);
    % 59 60
end % function
function setup(root, controlled_switch)
    % 62 64
    % 63 64
    controlled_switch.branch_across('v', controlled_switch.p.v, controlled_switch.n.v);
    controlled_switch.branch_through('i', controlled_switch.p.i, controlled_switch.n.i);
    % 66 68
    % 67 68
    controlled_switch.parameter('x_R_closed', controlled_switch.R_closed.check('>', 0.0));
    controlled_switch.parameter('x_G_open', controlled_switch.G_open.check('>', 0.0));
    % 70 71
    controlled_switch.equation(@equation);
    % 72 73
end % function
function e = equation(sys, controlled_switch)
    % 75 77
    % 76 77
    e = sys.equation;
    % 78 80
    % 79 80
    R_closed = controlled_switch.x_R_closed;
    G_open = controlled_switch.x_G_open;
    % 82 83
    current = controlled_switch.i;
    voltage = controlled_switch.v;
    power = mtimes(current, voltage);
    % 86 87
    if gt(controlled_switch.vT, 0.0)
        e(1.0) = minus(mtimes(current, R_closed), voltage);
    else
        e(1.0) = minus(mrdivide(current, G_open), voltage);
    end % if
    % 92 93
end % function
