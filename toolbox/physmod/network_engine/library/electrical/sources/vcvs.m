function vcvs(root, schema)
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
    schema.descriptor = 'Voltage-Controlled Voltage Source';
    % 12 15
    % 13 15
    % 14 15
    K = schema.parameter('K');
    K.description = 'Voltage gain K';
    K.type = ne_type('real', [1.0 1.0], '1');
    K.default = {[1.0],'1'};
    % 19 21
    % 20 21
    var_int_vin = schema.local_variable('input_voltage');
    var_int_vin.description = 'Input voltage (V)';
    var_int_vout = schema.local_variable('output_voltage');
    var_int_vout.description = 'Output voltage (V)';
    % 25 26
    var_int_i = schema.local_variable('output_current');
    var_int_i.description = 'Output current (A)';
    % 28 29
    var_int_w = schema.local_variable('output_power');
    var_int_w.description = 'Output power (W)';
    % 31 32
    schema.setup(@setup);
    % 33 34
end % function
function setup(root, vcvs)
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    vcvs.equation(@equation);
    % 41 42
end % function
function e = equation(sys, vcvs)
    % 44 46
    % 45 46
    e = sys.equation;
    % 47 48
    input_voltage = vcvs.v1;
    output_voltage = vcvs.v2;
    output_current = vcvs.i2;
    output_power = mtimes(output_current, output_voltage);
    % 52 54
    % 53 54
    e(1.0) = minus(mtimes(vcvs.K, vcvs.v1), vcvs.v2);
    e(2.0) = vcvs.i1;
    % 56 57
end % function
