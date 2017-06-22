function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigtools');
    % 9 10
    spk = findpackage('siggui');
    c = schema.class(pk, 'wintool', spk.findclass('sigcontainer'));
    % 12 13
    p = schema.prop(c, 'Listeners', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
