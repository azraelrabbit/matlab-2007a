function ac_voltage_source(root, schema)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    schema.extends(root.fl.electrical.electricalsource);
    schema.descriptor = 'AC Voltage Source';
    % 14 16
    % 15 16
    a = schema.parameter('amp');
    a.description = 'Peak amplitude';
    a.type = ne_type('real', [1.0 1.0], 'V');
    a.default = {[169.71],'V'};
    % 20 21
    ps = schema.parameter('shift');
    ps.description = 'Phase shift';
    ps.type = ne_type('real', [1.0 1.0], 'rad');
    ps.default = {[0.0],'rad'};
    % 25 26
    f = schema.parameter('omega');
    f.description = 'Frequency';
    f.type = ne_type('real', [1.0 1.0], 'rad/s');
    f.default = {[60.0],'Hz'};
    % 30 32
    % 31 32
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Current (A)';
    % 34 35
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage (V)';
    % 37 38
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 40 41
    schema.setup(@setup);
    % 42 43
end % function
function setup(root, ac_voltage_source)
    % 45 48
    % 46 48
    % 47 48
    ac_voltage_source.parameter('x_omega', ac_voltage_source.omega.check('>', 0.0));
    % 49 50
    ac_voltage_source.equation(@equation);
    % 51 52
end % function
function e = equation(sys, ac_voltage_source)
    % 54 57
    % 55 57
    % 56 57
    e = sys.equation;
    % 58 59
    amp = ac_voltage_source.amp;
    omega = ac_voltage_source.x_omega;
    % 61 62
    current = ac_voltage_source.i;
    voltage = ac_voltage_source.v;
    power = mtimes(current, voltage);
    % 65 66
    e(1.0) = minus(mtimes(amp, sin(plus(mtimes(omega, sys.t), ac_voltage_source.shift))), ac_voltage_source.v);
    % 67 68
end % function
