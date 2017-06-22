function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    dfiltpk = findpackage('dfilt');
    % 10 12
    % 11 12
    c = schema.class(pk, 'baseclass', findclass(dfiltpk, 'basefilter'));
    c.Description = 'abstract';
    % 14 16
    % 15 16
    p = schema.prop(c, 'Algorithm', 'string');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Serialize = 'off';
    % 20 21
    p = schema.prop(c, 'CapturedProperties', 'MATLAB array');
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
end % function
