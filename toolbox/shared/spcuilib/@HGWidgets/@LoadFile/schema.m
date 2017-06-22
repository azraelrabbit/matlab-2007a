function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('HGWidgets');
    hThisClass = schema.class(hCreateInPackage, 'LoadFile');
    % 9 12
    % 10 12
    % 11 12
    schema.prop(hThisClass, 'title', 'string');
    schema.prop(hThisClass, 'filterspec', 'mxArray');
    schema.prop(hThisClass, 'initialDir', 'string');
    % 15 16
    schema.prop(hThisClass, 'selected_file', 'string');
    schema.prop(hThisClass, 'selected_path', 'string');
end % function
