function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('RTW');
    % 8 10
    % 9 10
    hBaseClass = findclass(hCreateInPackage, 'FcnCtl');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'FcnDefault', hBaseClass);
    % 14 15
    hThisProp = schema.prop(hThisClass, 'Multirate', 'bool');
    hThisProp.AccessFlags.Serialize = 'off';
    % 17 18
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 23 24
    m = schema.method(hThisClass, 'codeConstruction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 29 30
    m = schema.method(hThisClass, 'postApplyCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool','string'};
    % 35 36
    m = schema.method(hThisClass, 'validate');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array','string','bool'};
    s.OutputTypes = {'bool','string'};
    % 41 42
    m = schema.method(hThisClass, 'closeCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string'};
    s.OutputTypes = {};
end % function
