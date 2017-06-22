function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    c = schema.class(findpackage('sigutils'), 'vector');
    % 10 11
    p = vertcat(schema.prop(c, 'Data', 'MATLAB array'), schema.prop(c, 'Limit', 'int32'));
    % 12 15
    % 13 15
    % 14 15
    p(1.0).FactoryValue = {};
    p(2.0).FactoryValue = 512.0;
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 18 19
    e = schema.event(c, 'VectorChanged');
end % function
