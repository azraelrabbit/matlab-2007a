function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('siggui');
    % 10 12
    % 11 12
    c = schema.class(pk, 'abstract_specsframe', pk.findclass('sigcontainer'));
    set(c, 'Description', 'abstract');
    % 14 16
    % 15 16
    p = schema.prop(c, 'SFListeners', 'MATLAB array');
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
end % function
