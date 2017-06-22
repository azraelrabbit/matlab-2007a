function ps_saturation(root, schema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    schema.descriptor = 'PS Saturation';
    % 17 20
    % 18 20
    I = schema.input('I');
    I.description = 'Input';
    I.label = '';
    I.location = {'Left',[0.5]};
    % 23 25
    O = schema.output('O');
    O.description = 'Output';
    O.label = '';
    O.location = {'Right',[0.5]};
    % 28 31
    % 29 31
    upper_limit = schema.parameter('upper_limit');
    upper_limit.description = 'Upper limit';
    upper_limit.type = ne_type('real', [1.0 1.0], '1');
    upper_limit.default = .5;
    % 34 36
    lower_limit = schema.parameter('lower_limit');
    lower_limit.description = 'Lower limit';
    lower_limit.type = ne_type('real', [1.0 1.0], '1');
    lower_limit.default = -.5;
    % 39 41
    schema.setup(@setup);
    % 41 43
end % function
function setup(root, saturation)
    % 44 48
    % 45 48
    % 46 48
    saturation.parameter('x_lower_limit', saturation.lower_limit.check('<', saturation.upper_limit));
    % 48 51
    % 49 51
    saturation.equation(@equation);
    % 51 53
end % function
function e = equation(sys, saturation)
    % 54 57
    % 55 57
    upper_limit = saturation.upper_limit;
    lower_limit = saturation.x_lower_limit;
    % 58 60
    e = sys.equation;
    % 60 62
    if ge(saturation.I, upper_limit)
        output = upper_limit;
    else
        if le(saturation.I, lower_limit)
            output = lower_limit;
        else
            output = saturation.I;
        end % if
    end % if
    e(1.0) = minus(saturation.O, output);
end % function
