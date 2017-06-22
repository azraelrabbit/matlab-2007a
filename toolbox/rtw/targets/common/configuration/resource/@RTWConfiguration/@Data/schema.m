function schema
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    hCreateInPackage = findpackage('RTWConfiguration');
    % 21 24
    % 22 24
    hThisClass = schema.class(hCreateInPackage, 'Data');
    % 24 27
    % 25 27
    hThisProp = schema.prop(hThisClass, 'help_callback', 'string');
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.FactoryValue = 'disp(''No Help Available'')';
    % 30 32
    hThisProp = schema.prop(hThisClass, 'configuration_type', 'string');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'RTW Configuration';
    % 36 38
    hThisProp = schema.prop(hThisClass, 'hidden_configuration', 'bool');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.Init = 'on';
    % 41 43
    hThisProp.FactoryValue = logical(0);
    % 43 45
    hThisProp = schema.prop(hThisClass, 'listeners', 'handle vector');
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.PublicSet = 'off';
end
