function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    basePackage = findpackage('Simulink');
    baseClass = findclass(basePackage, 'SLDialogSource');
    createPackage = findpackage('POWERSYS');
    cls = schema.class(createPackage, 'PowerSysDialog', baseClass);
    % 16 17
    schema.prop(cls, 'BlockHandle', 'double');
    % 18 19
    m = schema.method(cls, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
