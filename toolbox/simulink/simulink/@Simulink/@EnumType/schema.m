function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hCreateInPackage, 'EnumTypeCore');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'EnumType', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 14 17
    % 15 17
    % 16 17
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 22 23
    m = schema.method(hThisClass, 'getStringValueDialogText');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 28 29
    m = schema.method(hThisClass, 'unpackStringValueDialogText');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'string vector','mxArray'};
end % function
