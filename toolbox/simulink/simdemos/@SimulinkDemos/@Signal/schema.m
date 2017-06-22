function schema
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'Signal');
    hCreateInPackage = findpackage('SimulinkDemos');
    % 20 23
    % 21 23
    hThisClass = schema.class(hCreateInPackage, 'Signal', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 24 27
    % 25 27
    hThisProp = schema.prop(hThisClass, 'UserMATLABArray1', 'MATLAB array');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = [];
    % 29 31
    hThisProp = schema.prop(hThisClass, 'UserMATLABArray2', 'MATLAB array');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = '';
    % 33 35
    hThisProp = schema.prop(hThisClass, 'UserDouble', 'double');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 37 39
    hThisProp = schema.prop(hThisClass, 'UserInt32', 'int32');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 41 43
    hThisProp = schema.prop(hThisClass, 'UserBool', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 45 47
    hThisProp = schema.prop(hThisClass, 'UserOnOff', 'on/off');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'off';
    % 49 51
    hThisProp = schema.prop(hThisClass, 'UserString', 'string');
    % 51 53
    hThisProp = schema.prop(hThisClass, 'UserColorEnum', 'SimulinkDemos_ColorEnum');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'red';
end
