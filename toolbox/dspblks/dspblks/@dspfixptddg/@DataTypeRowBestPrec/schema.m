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
    this = schema.class(package, 'DataTypeRowBestPrec', parent);
    % 11 14
    % 12 14
    % 13 14
    schema.prop(this, 'ParamBlock', 'handle');
    schema.prop(this, 'ParamPropNames', 'string vector');
    schema.prop(this, 'WordLengthOffset', 'double');
    schema.prop(this, 'BestPrecString', 'string');
    schema.prop(this, 'FracLengthEdit', 'string');
    % 19 20
    m = schema.method(this, 'updateFracLengthFromFracLength');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    % 24 25
    m = schema.method(this, 'updateFracLengthsFromSlope');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
end % function
