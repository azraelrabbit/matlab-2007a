function dc_voltage_source(root, schema)
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
    schema.descriptor = 'DC Voltage Source';
    % 13 15
    % 14 15
    vo = schema.parameter('v0');
    vo.description = 'Constant voltage';
    vo.type = ne_type('real', [1.0 1.0], 'V');
    vo.default = {[1.0],'V'};
    % 19 21
    % 20 21
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Current (A)';
    % 23 24
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage (V)';
    % 26 27
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 29 30
    schema.setup(@setup);
    % 31 32
end % function
function setup(root, dc_voltage_source)
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    dc_voltage_source.equation(@equation);
    % 40 41
end % function
function e = equation(sys, dc_voltage_source)
    % 43 46
    % 44 46
    % 45 46
    e = sys.equation;
    % 47 48
    current = dc_voltage_source.i;
    voltage = dc_voltage_source.v;
    power = mtimes(current, voltage);
    % 51 52
    e(1.0) = minus(dc_voltage_source.v0, dc_voltage_source.v);
end % function
