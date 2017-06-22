function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'freqframe', pk.findclass('abstract_specsframe'));
    set(c, 'Description', 'abstract');
    % 13 15
    % 14 15
    p = schema.prop(c, 'AutoUpdate', 'on/off');
    % 16 17
    p = schema.prop(c, 'Fs', 'string');
    p.SetFunction = @set_fs;
    p.GetFunction = @get_fs;
    % 20 21
    p = schema.prop(c, 'Units', 'string');
    p.SetFunction = @set_units;
    p.GetFunction = @get_units;
end % function
function P = get_fs(h, dummy)
    % 26 28
    % 27 28
    fsh = getcomponent(h, '-class', 'siggui.specsfsspecifier');
    P = get(fsh, 'Value');
end % function
function dummy = set_fs(h, P)
    % 32 34
    % 33 34
    fsh = getcomponent(h, '-class', 'siggui.specsfsspecifier');
    % 35 36
    set(fsh, 'Value', P);
    % 37 38
    dummy = '';
end % function
function dummy = set_units(h, P)
    % 41 43
    % 42 43
    fsh = getcomponent(h, '-class', 'siggui.specsfsspecifier');
    % 44 45
    set(fsh, 'Units', P);
    % 46 47
    dummy = '';
end % function
function P = get_units(h, dummy)
    % 50 52
    % 51 52
    fsh = getcomponent(h, '-class', 'siggui.specsfsspecifier');
    % 53 54
    P = get(fsh, 'Units');
end % function
