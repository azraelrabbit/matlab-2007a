function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock
    % 9 13
    % 10 13
    % 11 13
    hCreateInPackage = findpackage('Simulink');
    % 13 16
    % 14 16
    hThisClass = schema.class(hCreateInPackage, 'DataUsage');
    % 16 19
    % 17 19
    hThisProp = schema.prop(hThisClass, 'IsParameter', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(1);
    % 21 23
    hThisProp = schema.prop(hThisClass, 'IsSignal', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(1);
end
