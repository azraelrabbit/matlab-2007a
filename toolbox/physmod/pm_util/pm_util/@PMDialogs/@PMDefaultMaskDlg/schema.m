function schema
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    basePackage = findpackage('Simulink');
    baseClass = findclass(basePackage, 'SLDialogSource');
    createPackage = findpackage('PMDialogs');
    cls = schema.class(createPackage, 'PMDefaultMaskDlg', baseClass);
    % 17 18
    schema.prop(cls, 'BlockHandle', 'double');
    % 19 20
    m = schema.method(cls, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
