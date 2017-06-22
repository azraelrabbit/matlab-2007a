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
    c = schema.class(pk, 'iirgrpdelayoptsframe', pk.findclass('iirlpnormcoptsframe'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'InitNum', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
