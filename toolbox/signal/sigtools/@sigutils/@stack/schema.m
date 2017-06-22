function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigutils');
    % 9 10
    c = schema.class(pk, 'stack');
    % 11 13
    % 12 13
    p = vertcat(schema.prop(c, 'Data', 'MATLAB array'), schema.prop(c, 'StackLimit', 'int32'));
    % 14 15
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'off');
    set(p(1.0), 'FactoryValue', {});
    % 17 19
    % 18 19
    e = schema.event(c, 'TopChanged');
end % function
