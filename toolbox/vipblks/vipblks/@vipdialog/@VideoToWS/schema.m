function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentpackage = findpackage('dspdialog');
    parent = findclass(parentpackage, 'DSPDDG');
    vipPackage = findpackage('vipdialog');
    hThisClass = schema.class(vipPackage, 'VideoToWS', parent);
    % 12 14
    % 13 14
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 20
    schema.prop(hThisClass, 'VariableName', 'string');
    schema.prop(hThisClass, 'NumInputs', 'string');
    schema.prop(hThisClass, 'DataLimit', 'string');
    schema.prop(hThisClass, 'DecimationFactor', 'string');
    schema.prop(hThisClass, 'LogFi', 'bool');
    schema.prop(hThisClass, 'InPortLabels', 'string');
end % function
