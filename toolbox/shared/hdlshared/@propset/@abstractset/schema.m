function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mlock;
    % 9 10
    pkg = findpackage('propset');
    h = schema.class(pkg, 'abstractset');
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(h, 'prop_set_names', 'string vector');
    p.AccessFlags.PublicSet = 'off';
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(h, 'prop_sets', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 28 30
    % 29 30
    p = schema.prop(h, 'prop_set_enables', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
end % function
