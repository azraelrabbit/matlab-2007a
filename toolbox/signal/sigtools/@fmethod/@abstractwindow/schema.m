function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    c = schema.class(pk, 'abstractwindow', pk.findclass('abstractfir'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'Window', 'mxArray');
    % 13 14
    p = schema.prop(c, 'ScalePassband', 'bool');
    set(p, 'FactoryValue', true);
end % function
