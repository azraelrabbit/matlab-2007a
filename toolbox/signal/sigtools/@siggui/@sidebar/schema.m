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
    c = schema.class(pk, 'sidebar', pk.findclass('sigcontainer'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'CurrentPanel', 'int32');
    % 15 16
    p = vertcat(schema.prop(c, 'Constructors', 'MATLAB array'), schema.prop(c, 'Labels', 'string vector'));
    % 17 19
    % 18 19
    p(1.0).FactoryValue = {};
    p(2.0).FactoryValue = {};
    % 21 22
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
