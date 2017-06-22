function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DataTypeRow');
    this = schema.class(package, 'DataTypeRowMultiPrec', parent);
    % 11 12
    schema.prop(this, 'ParamBlock', 'handle');
    schema.prop(this, 'ParamFuncName', 'string');
    schema.prop(this, 'NumPrecs', 'int');
    schema.prop(this, 'PropNames', 'string vector');
    schema.prop(this, 'MaskPropNames', 'string vector');
    schema.prop(this, 'SlopeTags', 'string vector');
    % 18 19
    m = schema.method(this, 'updateFracLengthNFromSlopeN');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray','string'};
end % function
