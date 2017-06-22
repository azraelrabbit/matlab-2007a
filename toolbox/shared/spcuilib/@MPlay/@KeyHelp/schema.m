function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MPlay');
    hDeriveFromClass = findclass(pkg, 'DialogBase');
    hThisClass = schema.class(pkg, 'KeyHelp', hDeriveFromClass);
    % 10 11
    MPlay.RegisterDDGMethods(hThisClass, {'getDialogSchema'});
    % 12 14
    % 13 14
    schema.prop(hThisClass, 'playbackHelp', 'MATLAB array');
end % function
