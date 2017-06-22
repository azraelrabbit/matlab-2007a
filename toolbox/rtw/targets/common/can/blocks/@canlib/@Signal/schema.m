function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    pk = findpackage('canlib');
    simulinkpackage = findpackage('Simulink');
    c = schema.class(pk, 'Signal', simulinkpackage.findclass('Signal'));
    % 9 11
    % 10 11
    p = schema.prop(c, 'Configuration', 'handle');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = canlib.Configuration(254.0);
end % function
