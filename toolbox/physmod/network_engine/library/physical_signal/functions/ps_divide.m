function ps_divide(root, schema)
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
    schema.descriptor = 'PS Divide';
    % 15 17
    % 16 17
    I1 = schema.input('I1');
    I1.description = 'First input';
    I1.label = '';
    I1.location = {'Left',[0.25]};
    % 21 22
    I2 = schema.input('I2');
    I2.description = 'Second input';
    I2.label = '';
    I2.location = {'Left',[0.75]};
    % 26 27
    O = schema.output('O');
    O.description = 'Output';
    O.label = '';
    O.location = {'Right',[0.5]};
    % 31 32
    schema.setup(@setup);
    % 33 34
end % function
function setup(root, sum)
    % 36 38
    % 37 38
    sum.equation(@equation);
    % 39 40
end % function
function e = equation(sys, sum)
    % 42 44
    % 43 44
    e = sys.equation;
    e(1.0) = minus(sum.O, mrdivide(sum.I1, sum.I2));
    % 46 47
end % function
