function translational_converter(root, schema)
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
    schema.descriptor = 'Translational Electromechanical Converter';
    % 20 22
    % 21 22
    p = schema.terminal('p');
    p.description = 'Positive Terminal';
    p.domain = root.fl.electrical.electrical;
    p.label = '+';
    p.location = {'Top',[0.25]};
    % 27 28
    n = schema.terminal('n');
    n.description = 'Negative Terminal';
    n.domain = root.fl.electrical.electrical;
    n.label = '-';
    n.location = {'Bottom',[0.25]};
    % 33 34
    R = schema.terminal('R');
    R.description = 'Mechanical Port R';
    R.domain = root.fl.mechanical.translational.translational;
    R.label = 'R';
    R.location = {'Top';[0.75]};
    % 39 40
    C = schema.terminal('C');
    C.description = 'Mechanical Port C';
    C.domain = root.fl.mechanical.translational.translational;
    C.label = 'C';
    C.location = {'Bottom';[0.75]};
    % 45 47
    % 46 47
    K = schema.parameter('K');
    K.description = 'Constant of proportionality K';
    K.type = ne_type('real', [1.0 1.0], 'V/(m/s)');
    K.default = {[0.1],'V/(m/s)'};
    % 51 53
    % 52 53
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Current (A)';
    % 55 56
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage (V)';
    % 58 59
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 61 62
    var_int_F = schema.local_variable('force');
    var_int_F.description = 'Force (N)';
    % 64 65
    var_int_U = schema.local_variable('speed');
    var_int_U.description = 'Speed (m/s)';
    % 67 68
    schema.setup(@setup);
    % 69 70
end % function
function setup(root, translational_converter)
    % 72 74
    % 73 74
    translational_converter.branch_across('v', translational_converter.p.v, translational_converter.n.v);
    translational_converter.branch_through('i', translational_converter.p.i, translational_converter.n.i);
    translational_converter.branch_across('U', translational_converter.R.v, translational_converter.C.v);
    translational_converter.branch_through('F', translational_converter.R.f, translational_converter.C.f);
    % 78 79
    translational_converter.equation(@equation);
end % function
function e = equation(sys, translational_converter)
    % 82 83
    e = sys.equation;
    % 84 85
    current = translational_converter.i;
    voltage = translational_converter.v;
    power = mtimes(current, voltage);
    force = translational_converter.F;
    speed = translational_converter.U;
    % 90 91
    K = translational_converter.K;
    % 92 93
    e(1.0) = minus(mtimes(K, speed), voltage);
    e(2.0) = plus(mtimes(K, current), force);
end % function
