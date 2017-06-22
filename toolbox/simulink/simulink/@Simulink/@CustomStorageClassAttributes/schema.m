function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mlock
    % 10 12
    % 11 12
    hCreateInPackage = findpackage('Simulink');
    % 13 15
    % 14 15
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'BaseCSCAttributes');
    % 17 19
    % 18 19
    hThisClass = schema.class(hCreateInPackage, 'CustomStorageClassAttributes', hDeriveFromClass);
    % 20 33
    % 21 33
    % 22 33
    % 23 33
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    m = schema.method(hThisClass, 'getInstanceSpecificProps');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 38 39
    m = schema.method(hThisClass, 'getDialogContainer');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 44 45
    findclass(findpackage('Simulink'), 'CSCDefn');
    m = schema.method(hThisClass, 'isAddressable');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','Simulink.CSCDefn','Simulink.Data'};
    s.OutputTypes = {'bool'};
end % function
