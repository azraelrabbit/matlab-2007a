function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('hdlgui');
    c = schema.class(pk, 'stimulus', pk.findclass('abstracthdlgui'));
    set(c, 'Description', 'Stimulus');
    % 11 12
    p = schema.prop(c, 'Impulse', 'on/off');
    set(p, 'Description', 'Impulse response');
    % 14 15
    p = schema.prop(c, 'Step', 'on/off');
    set(p, 'Description', 'Step response');
    % 17 18
    p = schema.prop(c, 'Ramp', 'on/off');
    set(p, 'Description', 'Ramp response');
    % 20 21
    p = schema.prop(c, 'Chirp', 'on/off');
    set(p, 'Description', 'Chirp response');
    % 23 24
    p = schema.prop(c, 'Noise', 'on/off');
    set(p, 'Description', 'White noise response');
    % 26 27
    p = schema.prop(c, 'UserDefined', 'on/off');
    set(p, 'Description', 'User defined response');
    % 29 30
    p = schema.prop(c, 'UserDefinedStimulus', 'string');
    set(p, 'Description', ' ');
end % function
