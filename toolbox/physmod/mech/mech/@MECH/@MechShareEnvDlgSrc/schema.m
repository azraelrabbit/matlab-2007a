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
    basePackage = findpackage('Simulink');
    baseClass = findclass(basePackage, 'SLDialogSource');
    createPackage = findpackage('MECH');
    cls = schema.class(createPackage, 'MechShareEnvDlgSrc', baseClass);
    % 14 15
    m = schema.method(cls, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
