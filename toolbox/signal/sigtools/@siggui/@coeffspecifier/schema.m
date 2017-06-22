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
    c = schema.class(pk, 'coeffspecifier', pk.findclass('siggui'));
    % 12 14
    % 13 14
    p = vertcat(schema.prop(c, 'Labels', 'MATLAB array'), schema.prop(c, 'AllStructures', 'MATLAB array'));
    % 15 18
    % 16 18
    % 17 18
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 19 21
    % 20 21
    p = vertcat(schema.prop(c, 'Coefficients', 'MATLAB array'), schema.prop(c, 'SelectedStructure', 'string'), schema.prop(c, 'SOS', 'on/off'));
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p(3.0).GetFunction = @getsos;
end % function
