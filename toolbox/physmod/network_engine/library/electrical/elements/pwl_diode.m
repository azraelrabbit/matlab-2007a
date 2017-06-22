function pwl_diode(root, schema)
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
    schema.extends(root.fl.electrical.branch);
    schema.descriptor = 'Diode';
    % 16 18
    % 17 18
    Vf = schema.parameter('Vf');
    Vf.description = 'Forward voltage';
    Vf.type = ne_type('real', [1.0 1.0], 'V');
    Vf.default = {[0.6],'V'};
    % 22 23
    Ron = schema.parameter('Ron');
    Ron.description = 'On resistance';
    Ron.type = ne_type('real', [1.0 1.0], 'Ohm');
    Ron.default = {[0.3],'Ohm'};
    % 27 28
    Goff = schema.parameter('Goff');
    Goff.description = 'Off conductance';
    Goff.type = ne_type('real', [1.0 1.0], '1/Ohm');
    Goff.default = {[1e-08],'1/Ohm'};
    % 32 34
    % 33 34
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Diode current (A)';
    % 36 37
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage across diode (V)';
    % 39 40
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 42 43
    schema.setup(@setup);
    % 44 45
end % function
function setup(root, pwl_diode)
    % 47 50
    % 48 50
    % 49 50
    pwl_diode.parameter('x_Vf', pwl_diode.Vf.check('>', 0.0));
    pwl_diode.parameter('x_Ron', pwl_diode.Ron.check('>', 0.0));
    pwl_diode.parameter('x_Goff', pwl_diode.Goff.check('>', 0.0));
    pwl_diode.equation(@equation);
    % 54 55
end % function
function e = equation(sys, pwl_diode)
    % 57 58
    e = sys.equation;
    % 59 60
    Vf = pwl_diode.x_Vf;
    Ron = pwl_diode.x_Ron;
    Goff = pwl_diode.x_Goff;
    current = pwl_diode.i;
    voltage = pwl_diode.v;
    power = mtimes(current, voltage);
    % 66 68
    % 67 68
    if gt(voltage, Vf)
        e(1.0) = minus(current, mrdivide(minus(voltage, mtimes(Vf, minus(1.0, mtimes(Ron, Goff)))), Ron));
    else
        e(1.0) = minus(current, mtimes(voltage, Goff));
    end % if
    % 73 74
end % function
