function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 11
    % 10 11
    c = schema.class(pk, 'numDenFilterOrder');
    % 12 14
    % 13 14
    p = schema.prop(c, 'Tag', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 'numDenFilterOrder';
    % 17 19
    % 18 19
    p = schema.prop(c, 'numOrder', 'spt_uint32');
    p.FactoryValue = 8.0;
    % 21 22
    p = schema.prop(c, 'denOrder', 'spt_uint32');
    p.FactoryValue = 6.0;
end % function
