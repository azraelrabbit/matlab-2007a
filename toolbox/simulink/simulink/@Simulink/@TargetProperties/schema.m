function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('Simulink');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'TargetProperties');
    % 13 15
    % 14 15
    hThisProp = schema.prop(hThisClass, 'PropertiesName', 'string');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'UnNamed';
end % function
