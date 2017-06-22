function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentPkg = findpackage('dspdialog');
    parent = findclass(parentPkg, 'DSPDDG');
    package = findpackage('dspfixptddg');
    this = schema.class(package, 'DSPDDGBase', parent);
    % 12 13
    findclass(package, 'FixptDialog');
    % 14 16
    % 15 16
    schema.prop(this, 'FixptDialog', 'dspfixptddg.FixptDialog');
end % function
