function schema
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    hDeriveFromPackage = findpackage('RTW');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'TargetPrefs');
    hCreateInPackage = findpackage('cancommon');
    % 23 25
    % 24 25
    hThisClass = schema.class(hCreateInPackage, 'candownloadprefs', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 27 28
    hThisProp = schema.prop(hThisClass, 'Download_Type', 'dnloadType');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'RAM application code';
    % 31 32
    hThisProp = schema.prop(hThisClass, 'CAN_Hardware', 'hardwareTypes');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'CanAc2Pci 1';
    % 35 36
    hThisProp = schema.prop(hThisClass, 'Bit_Rate', 'int32');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 500000.0;
    % 39 40
    hThisProp = schema.prop(hThisClass, 'Num_Quanta', 'int32');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 16.0;
    % 43 44
    hThisProp = schema.prop(hThisClass, 'Sample_Point', 'double');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = .81;
    % 47 48
    hThisProp = schema.prop(hThisClass, 'CCP_Station_Address', 'int32');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 1.0;
    % 51 52
    hThisProp = schema.prop(hThisClass, 'CAN_message_id_CRO', 'int32');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 1786.0;
    % 55 56
    hThisProp = schema.prop(hThisClass, 'CAN_message_id_DTO', 'int32');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 1787.0;
    % 59 60
    hThisProp = schema.prop(hThisClass, 'ConnectionType', 'connectiontypes');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'CAN';
    % 63 64
    hThisProp = schema.prop(hThisClass, 'SerialPort', 'commports');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'COM1';
    % 67 68
    hThisProp = schema.prop(hThisClass, 'Application_Channel', 'int32');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
end % function
