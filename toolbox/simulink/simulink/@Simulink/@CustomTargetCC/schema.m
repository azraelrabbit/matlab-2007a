function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('Simulink');
    % 9 11
    % 10 11
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'TargetCC');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'CustomTargetCC', hDeriveFromClass);
    % 16 19
    % 17 19
    % 18 19
    m = schema.method(hThisClass, 'getTargetSpecificString');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'string'};
    % 24 25
    m = schema.method(hThisClass, 'getStringFormat');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 30 31
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
