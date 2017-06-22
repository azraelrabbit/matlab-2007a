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
    c = schema.class(pk, 'abstractDesignMethod');
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    pk.findclass('abstractFilterType');
    p = vertcat(schema.prop(c, 'responseTypeSpecs', 'filtdes.abstractFilterType'), schema.prop(c, 'availableTypes', 'MATLAB array'), schema.prop(c, 'dynamicProps', 'schema.prop vector'), schema.prop(c, 'dynamicPropsListener', 'handle.listener vector'), schema.prop(c, 'listeners', 'handle.listener vector'));
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
    % 27 29
    % 28 29
    p = schema.prop(c, 'Tag', 'string');
    p.AccessFlags.PublicSet = 'off';
end % function
