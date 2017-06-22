function ps_subtract(root, schema)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    schema.descriptor = 'PS Subtract';
    % 14 16
    % 15 16
    I1 = schema.input('I1');
    I1.description = 'First input';
    I1.label = '';
    I1.location = {'Left',[0.25]};
    % 20 21
    I2 = schema.input('I2');
    I2.description = 'Second input';
    I2.label = '';
    I2.location = {'Left',[0.75]};
    % 25 26
    O = schema.output('O');
    O.description = 'Output';
    O.label = '';
    O.location = {'Right',[0.5]};
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    schema.setup(@setup);
    % 35 36
end % function
function setup(root, ps_subtract)
    % 38 40
    % 39 40
    ps_subtract.equation(@equation);
    % 41 42
end % function
function e = equation(sys, ps_subtract)
    % 44 46
    % 45 46
    e = sys.equation;
    e(1.0) = plus(minus(ps_subtract.O, ps_subtract.I1), ps_subtract.I2);
    % 48 49
end % function
