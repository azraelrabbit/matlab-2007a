function cccs(root, schema)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    schema.extends(root.fl.electrical.dependent_electricalsource);
    schema.descriptor = 'Current-Controlled Current Source';
    % 11 14
    % 12 14
    % 13 14
    K = schema.parameter('K');
    K.description = 'Current gain K';
    K.type = ne_type('real', [1.0 1.0], '1');
    K.default = {[1.0],'1'};
    % 18 20
    % 19 20
    var_int_iin = schema.local_variable('input_current');
    var_int_iin.description = 'Input current (A)';
    % 22 23
    var_int_vout = schema.local_variable('output_voltage');
    var_int_vout.description = 'Output voltage (V)';
    % 25 26
    var_int_iout = schema.local_variable('output_current');
    var_int_iout.description = 'Output current (A)';
    % 28 29
    var_int_w = schema.local_variable('output_power');
    var_int_w.description = 'Output power (W)';
    % 31 32
    schema.setup(@setup);
    % 33 34
end % function
function setup(root, cccs)
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    cccs.equation(@equation);
    % 41 42
end % function
function e = equation(sys, cccs)
    % 44 46
    % 45 46
    e = sys.equation;
    % 47 48
    input_current = cccs.i1;
    output_voltage = cccs.v2;
    output_current = cccs.i2;
    output_power = mtimes(output_current, output_voltage);
    % 52 54
    % 53 54
    e(1.0) = plus(mtimes(cccs.K, cccs.i1), cccs.i2);
    e(2.0) = cccs.v1;
    % 56 57
end % function
