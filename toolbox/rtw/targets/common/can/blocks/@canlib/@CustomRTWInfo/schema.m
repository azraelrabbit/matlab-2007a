function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    pk = findpackage('canlib');
    simulinkpackage = findpackage('Simulink');
    c = schema.class(pk, 'CustomRTWInfo', simulinkpackage.findclass('CustomRTWInfo'));
    % 9 12
    % 10 12
    % 11 12
    p = schema.prop(c, 'CustomStorageClass', 'storage_class');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = 'Daq_List_Signal_Processing';
end % function
