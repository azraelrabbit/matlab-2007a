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
    createPackage = findpackage('PMDialogs');
    cls = schema.class(createPackage, 'DynDlgSource', baseClass);
    % 14 15
    schema.prop(cls, 'BuilderObj', 'handle');
    schema.prop(cls, 'BlockHandle', 'double');
    % 17 18
    m = schema.method(cls, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 23 24
    m = schema.method(cls, 'preApplyCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool','string'};
    % 29 30
    m = schema.method(cls, 'closeDialogCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    % 34 35
    m = schema.method(cls, 'internalGetPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'mxArray'};
    % 40 41
    m = schema.method(cls, 'internalValidateLicense');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool'};
    % 46 47
    m = schema.method(cls, 'makeDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'mxArray'};
end % function
