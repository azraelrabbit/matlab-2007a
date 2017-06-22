function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('RTW');
    hPackage = findpackage('DAStudio');
    hBaseClass = findclass(hPackage, 'Object');
    % 10 11
    hThisClass = schema.class(hCreateInPackage, 'FcnCtlUI', hBaseClass);
    % 12 14
    % 13 14
    hThisProp = schema.prop(hThisClass, 'fcnclass', 'handle');
    hThisProp.SetFunction = @setFcnClass;
    hThisProp = schema.prop(hThisClass, 'preFunctionClass', 'int32');
    hThisProp = schema.prop(hThisClass, 'validationStatus', 'bool');
    hThisProp = schema.prop(hThisClass, 'validationResult', 'string');
    % 19 20
    hThisProp = schema.prop(hThisClass, 'closeListener', 'handle');
    % 21 24
    % 22 24
    % 23 24
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 29 30
    m = schema.method(hThisClass, 'postApplyCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool','string'};
    % 35 36
    m = schema.method(hThisClass, 'closeCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string'};
    s.OutputTypes = {};
    % 41 42
    m = schema.method(hThisClass, 'FunctionClassChanged');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','double','handle'};
    s.OutputTypes = {};
    % 47 48
    m = schema.method(hThisClass, 'preConfig');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 53 54
    m = schema.method(hThisClass, 'validate');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
end % function
function newValue = setFcnClass(hThis, valueProposed)
    % 61 62
    if not(isa(valueProposed, 'RTW.FcnCtl'))
        newValue = hThis.fcnclass;
        DAStudio.error('RTW:fcnClass:expectingFcnClassType');
    else
        newValue = valueProposed;
    end % if
end % function
