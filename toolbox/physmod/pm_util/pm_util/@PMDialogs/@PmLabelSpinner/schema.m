function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hCreateInPackage = findpackage('PMDialogs');
    hBaseObj = hCreateInPackage.findclass('PmBaseWidget');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'PmLabelSpinner', hBaseObj);
    % 15 17
    % 16 17
    p = schema.prop(hThisClass, 'Label', 'string');
    p.FactoryValue = '';
    p = schema.prop(hThisClass, 'Value', 'int');
    p.FactoryValue = 1.0;
    p = schema.prop(hThisClass, 'MinValue', 'int');
    p.FactoryValue = 0.0;
    p = schema.prop(hThisClass, 'MaxValue', 'int');
    p.FactoryValue = 99.0;
end % function
