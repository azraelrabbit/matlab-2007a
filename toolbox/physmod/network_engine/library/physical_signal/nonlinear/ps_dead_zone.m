function ps_dead_zone(root, schema)
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
    schema.descriptor = 'PS Dead Zone';
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
function setup(root, dead_zone)
    % 44 48
    % 45 48
    % 46 48
    dead_zone.parameter('x_lower_limit', dead_zone.lower_limit.check('<', dead_zone.upper_limit, dead_zone.upper_limit));
    % 48 51
    % 49 51
    dead_zone.equation(@equation);
    % 51 53
end % function
function e = equation(sys, dead_zone)
    % 54 57
    % 55 57
    upper_limit = dead_zone.upper_limit;
    lower_limit = dead_zone.x_lower_limit;
    % 58 60
    if ge(dead_zone.I, upper_limit)
        output = minus(dead_zone.I, upper_limit);
    else
        if le(dead_zone.I, lower_limit)
            output = minus(dead_zone.I, lower_limit);
        else
            output = 0.0;
        end % if
    end % if
    e = sys.equation;
    e(1.0) = minus(dead_zone.O, output);
end % function
