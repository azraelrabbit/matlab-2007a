function rotational_converter(root, schema)
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
    % 19 20
    schema.descriptor = 'Rotational Electromechanical Converter';
    % 21 23
    % 22 23
    p = schema.terminal('p');
    p.description = 'Positive Terminal';
    p.domain = root.fl.electrical.electrical;
    p.label = '+';
    p.location = {'Top',[0.25]};
    % 28 29
    n = schema.terminal('n');
    n.description = 'Negative Terminal';
    n.domain = root.fl.electrical.electrical;
    n.label = '-';
    n.location = {'Bottom',[0.25]};
    % 34 35
    R = schema.terminal('R');
    R.description = 'Mechanical Port R';
    R.domain = root.fl.mechanical.rotational.rotational;
    R.label = 'R';
    R.location = {'Top';[0.75]};
    % 40 41
    C = schema.terminal('C');
    C.description = 'Mechanical Port C';
    C.domain = root.fl.mechanical.rotational.rotational;
    C.label = 'C';
    C.location = {'Bottom';[0.75]};
    % 46 48
    % 47 48
    K = schema.parameter('K');
    K.description = 'Constant of proportionality K';
    K.type = ne_type('real', [1.0 1.0], 'V/(rad/s)');
    K.default = {[0.1],'V/(rad/s)'};
    % 52 54
    % 53 54
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Current (A)';
    % 56 57
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage (V)';
    % 59 60
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 62 63
    var_int_T = schema.local_variable('torque');
    var_int_T.description = 'Torque (Nm)';
    % 65 66
    var_int_w = schema.local_variable('speed');
    var_int_w.description = 'Angular speed (rad/s)';
    % 68 69
    schema.setup(@setup);
    % 70 71
end % function
function setup(root, rotational_converter)
    % 73 75
    % 74 75
    rotational_converter.branch_across('v', rotational_converter.p.v, rotational_converter.n.v);
    rotational_converter.branch_through('i', rotational_converter.p.i, rotational_converter.n.i);
    rotational_converter.branch_across('w', rotational_converter.R.w, rotational_converter.C.w);
    rotational_converter.branch_through('t', rotational_converter.R.t, rotational_converter.C.t);
    % 79 81
    % 80 81
    rotational_converter.parameter('adjust_torque_unit', {[1.0],'rad'});
    % 82 83
    rotational_converter.equation(@equation);
end % function
function e = equation(sys, rotational_converter)
    % 86 87
    e = sys.equation;
    % 88 89
    current = rotational_converter.i;
    voltage = rotational_converter.v;
    power = mtimes(current, voltage);
    torque = rotational_converter.t;
    speed = rotational_converter.w;
    % 94 95
    K = rotational_converter.K;
    adjust_torque_unit = rotational_converter.adjust_torque_unit;
    % 97 98
    e(1.0) = minus(mtimes(K, speed), voltage);
    e(2.0) = plus(mtimes(mtimes(K, adjust_torque_unit), current), torque);
end % function
