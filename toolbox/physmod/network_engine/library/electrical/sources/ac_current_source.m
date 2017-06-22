function ac_current_source(root, schema)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    schema.extends(root.fl.electrical.electricalsource);
    schema.descriptor = 'AC Current Source';
    % 13 15
    % 14 15
    a = schema.parameter('amp');
    a.description = 'Peak amplitude';
    a.type = ne_type('real', [1.0 1.0], 'A');
    a.default = {[14.1421],'A'};
    % 19 20
    ps = schema.parameter('shift');
    ps.description = 'Phase shift';
    ps.type = ne_type('real', [1.0 1.0], 'rad');
    ps.default = {[0.0],'rad'};
    % 24 25
    f = schema.parameter('omega');
    f.description = 'Frequency';
    f.type = ne_type('real', [1.0 1.0], 'rad/s');
    f.default = {[60.0],'Hz'};
    % 29 31
    % 30 31
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Current (A)';
    % 33 34
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage (V)';
    % 36 37
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 39 40
    schema.setup(@setup);
    % 41 42
end % function
function setup(root, ac_current_source)
    % 44 47
    % 45 47
    % 46 47
    ac_current_source.parameter('x_omega', ac_current_source.omega.check('>', 0.0));
    % 48 49
    ac_current_source.equation(@equation);
    % 50 51
end % function
function e = equation(sys, ac_current_source)
    % 53 56
    % 54 56
    % 55 56
    e = sys.equation;
    % 57 58
    amp = ac_current_source.amp;
    omega = ac_current_source.x_omega;
    % 60 61
    current = ac_current_source.i;
    voltage = ac_current_source.v;
    power = mtimes(current, voltage);
    % 64 65
    e(1.0) = plus(mtimes(amp, sin(plus(mtimes(omega, sys.t), ac_current_source.shift))), ac_current_source.i);
    % 66 67
end % function
