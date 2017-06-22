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
    hBasePackage = findpackage('MECH');
    hBaseObj = hBasePackage.findclass('PmMechGuiObj');
    hCreateInPackage = hBasePackage;
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'PmMechDriverActuatorPanel', hBaseObj);
    % 16 18
    % 17 18
    schema.prop(hThisClass, 'ConnectToBlockType', 'string');
end % function
