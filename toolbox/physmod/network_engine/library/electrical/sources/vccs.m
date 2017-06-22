function vccs(root, schema)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    schema.extends(root.fl.electrical.dependent_electricalsource);
    schema.descriptor = 'Voltage-Controlled Current Source';
    % 12 15
    % 13 15
    % 14 15
    K = schema.parameter('K');
    K.description = 'Transconductance K';
    K.type = ne_type('real', [1.0 1.0], '1/Ohm');
    K.default = {[1.0],'1/Ohm'};
    % 19 21
    % 20 21
    var_int_vin = schema.local_variable('input_voltage');
    var_int_vin.description = 'Input voltage (V)';
    % 23 24
    var_int_vout = schema.local_variable('output_voltage');
    var_int_vout.description = 'Output voltage (V)';
    % 26 27
    var_int_iout = schema.local_variable('output_current');
    var_int_iout.description = 'Output current (A)';
    % 29 30
    var_int_w = schema.local_variable('output_power');
    var_int_w.description = 'Output power (W)';
    % 32 33
    schema.setup(@setup);
    % 34 35
end % function
function setup(root, vccs)
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    vccs.equation(@equation);
    % 42 43
end % function
function e = equation(sys, vccs)
    % 45 47
    % 46 47
    e = sys.equation;
    % 48 49
    input_voltage = vccs.v1;
    output_voltage = vccs.v2;
    output_current = vccs.i2;
    output_power = mtimes(output_current, output_voltage);
    % 53 55
    % 54 55
    e(1.0) = plus(mtimes(vccs.K, vccs.v1), vccs.i2);
    e(2.0) = vccs.i1;
    % 57 58
end % function
