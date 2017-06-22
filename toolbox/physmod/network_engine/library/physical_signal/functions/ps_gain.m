function ps_gain(root, schema)
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
    schema.descriptor = 'PS Gain';
    % 15 17
    % 16 17
    I = schema.input('I');
    I.description = 'Input';
    I.label = '';
    I.location = {'Left',[0.5]};
    % 21 22
    O = schema.output('O');
    O.description = 'Output';
    O.label = '';
    O.location = {'Right',[0.5]};
    % 26 28
    % 27 28
    gain = schema.parameter('gain');
    gain.description = 'Gain';
    gain.type = ne_type('real', [1.0 1.0], '1');
    gain.default = 1.0;
    % 32 33
    schema.setup(@setup);
    % 34 35
end % function
function setup(root, gain)
    % 37 39
    % 38 39
    gain.equation(@equation);
    % 40 41
end % function
function e = equation(sys, gain)
    % 43 45
    % 44 45
    e = sys.equation;
    e(1.0) = minus(gain.O, mtimes(gain.I, gain.gain));
    % 47 48
end % function
