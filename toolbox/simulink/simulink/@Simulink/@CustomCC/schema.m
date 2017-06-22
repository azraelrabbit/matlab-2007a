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
    hDeriveFromClass = findclass(hDeriveFromPackage, 'ConfigMComponent');
    % 17 19
    % 18 19
    hThisClass = schema.class(hCreateInPackage, 'CustomCC', hDeriveFromClass);
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    m = schema.method(hThisClass, 'update');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 29 30
    m = schema.method(hThisClass, 'okToAttach');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool'};
    % 35 36
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 41 42
    m = schema.method(hThisClass, 'okToDetach');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'bool'};
    % 47 48
    m = schema.method(hThisClass, 'isVisible');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
