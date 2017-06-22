function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('PMDialogs');
    hBaseObj = hCreateInPackage.findclass('PmGuiObj');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'PmDisplayBox', hBaseObj);
    % 13 15
    % 14 15
    p = schema.prop(hThisClass, 'Label', 'string');
    p = schema.prop(hThisClass, 'LabelAttrb', 'int');
    p = schema.prop(hThisClass, 'Value', 'string');
end % function
