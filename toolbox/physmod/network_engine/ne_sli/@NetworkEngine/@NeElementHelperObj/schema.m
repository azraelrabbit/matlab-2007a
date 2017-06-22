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
    hCreateInPackage = findpackage('NetworkEngine');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'NeElementHelperObj');
    % 14 16
    % 15 16
    p = schema.prop(hThisClass, 'descriptorStr', 'string');
    p = schema.prop(hThisClass, 'hElementObj', 'handle');
    p = schema.prop(hThisClass, 'parameterVec', 'handle vector');
    p = schema.prop(hThisClass, 'variableVec', 'handle vector');
    p = schema.prop(hThisClass, 'terminalVec', 'handle vector');
    p = schema.prop(hThisClass, 'inputVec', 'handle vector');
    p = schema.prop(hThisClass, 'outputVec', 'handle vector');
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(hThisClass, 'portVec', 'handle vector');
    % 27 29
    % 28 29
    m = schema.method(hThisClass, 'NeElementHelperObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'mxArray'};
    s.OutputTypes = {'handle'};
end % function
