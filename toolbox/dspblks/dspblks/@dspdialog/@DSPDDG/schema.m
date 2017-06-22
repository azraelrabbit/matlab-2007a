function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    parentPkg = findpackage('Simulink');
    parent = findclass(parentPkg, 'SLDialogSource');
    package = findpackage('dspdialog');
    this = schema.class(package, 'DSPDDG', parent);
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(this, 'Block', 'handle');
    p.SetFunction = @setBlock;
    schema.prop(this, 'Root', 'Simulink.BlockDiagram');
end % function
