function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    dspdialogPackage = findpackage('dspdialog');
    findclass(dspdialogPackage, 'DSPDDG');
    % 11 12
    this = schema.class(package, 'DataTypeRow');
    % 13 15
    % 14 15
    schema.prop(this, 'Block', 'handle');
    schema.prop(this, 'Name', 'string');
    schema.prop(this, 'Entries', 'string vector');
    schema.prop(this, 'Prefix', 'string');
    schema.prop(this, 'Row', 'int');
    p = schema.prop(this, 'Visible', 'bool');
    p.FactoryValue = 1.0;
    schema.prop(this, 'SupportsUnsigned', 'bool');
    % 23 24
    schema.prop(this, 'Controller', 'dspdialog.DSPDDG');
    % 25 27
    % 26 27
    schema.prop(this, 'Mode', 'string');
    p = schema.prop(this, 'WordLength', 'string');
    % 29 31
    % 30 31
    p.SetFunction = @setWordLength;
    schema.prop(this, 'FracLength', 'string');
    % 33 34
    m = schema.method(this, 'updateFracLengthFromSlope');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
end % function
