function ps_integrator(root, schema)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    schema.descriptor = 'PS Integrator';
    % 11 13
    % 12 13
    I = schema.input('I');
    I.description = 'Input';
    I.label = '';
    I.location = {'Left',[0.5]};
    % 17 18
    O = schema.output('O');
    O.description = 'Output';
    O.label = '';
    O.location = {'Right',[0.5]};
    % 22 24
    % 23 24
    gain = schema.parameter('x0');
    gain.description = 'Initial Condition';
    gain.type = ne_type('real', [1.0 1.0], '1');
    gain.default = 0.0;
    % 28 29
    schema.setup(@setup);
    % 30 31
end % function
function setup(root, integrator)
    % 33 35
    % 34 35
    integrator.variable('x', [1.0 1.0], '1');
    integrator.equation(@equation);
    % 37 38
end % function
function e = equation(sys, integrator)
    % 40 42
    % 41 42
    e = sys.equation;
    if sys.dc
        e(1.0) = minus(integrator.x, integrator.x0);
    else
        e(1.0) = minus(integrator.x.der, integrator.I);
    end % if
    % 48 49
    e(2.0) = minus(integrator.O, integrator.x);
    % 50 51
end % function
