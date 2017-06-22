function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    c = schema.class(pk, 'abstractdesign');
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'DesignAlgorithm', 'string');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(c, 'FilterStructure', 'string');
    set(p, 'GetFunction', @get_structure, 'SetFunction', @set_structure);
    % 20 21
end % function
