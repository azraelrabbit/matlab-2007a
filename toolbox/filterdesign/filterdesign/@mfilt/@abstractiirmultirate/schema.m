function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractiirmultirate', pk.findclass('abstractsiso'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'Polyphase', 'mxArray');
    set(p, 'SetFunction', @set_phase, 'GetFunction', @get_phase);
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(c, 'privphase', 'mxArray');
    p.AccessFlag.PublicGet = 'off';
    p.AccessFlag.PublicSet = 'off';
end % function
