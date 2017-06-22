function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigio');
    pk1 = findpackage('siggui');
    c = schema.class(pk, 'abstractxpdestination', pk1.findclass('sigcontainer'));
    c.Description = 'abstract';
    % 11 14
    % 12 14
    p = schema.prop(c, 'Data', 'mxArray');
    set(p, 'SetFunction', @setdata, 'GetFunction', @getdata);
    % 15 17
    findclass(findpackage('sigutils'), 'vector');
    p = horzcat(schema.prop(c, 'VariableCount', 'int32'), schema.prop(c, 'VectorChangedListener', 'handle.listener'), schema.prop(c, 'privData', 'sigutils.vector'));
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    set(p(3.0), 'SetFunction', @setprivdata);
    % 24 26
    schema.prop(c, 'Toolbox', 'string');
    % 26 29
    % 27 29
    schema.event(c, 'NewFrameHeight');
end % function
