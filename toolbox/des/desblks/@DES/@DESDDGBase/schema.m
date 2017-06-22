function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentPkg = findpackage('Simulink');
    parent = findclass(parentPkg, 'SLDialogSource');
    package = findpackage('DES');
    this = schema.class(package, 'DESDDGBase', parent);
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(this, 'Block', 'handle');
    p.SetFunction = @setBlock;
end % function
