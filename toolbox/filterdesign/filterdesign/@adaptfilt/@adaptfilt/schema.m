function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'adaptfilt', findclass(pk, 'baseclass'));
    c.Description = 'abstract';
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(c, 'FilterLength', 'spt_uint32');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 10.0;
end % function
