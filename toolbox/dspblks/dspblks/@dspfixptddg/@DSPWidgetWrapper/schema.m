function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    % 9 10
    this = schema.class(package, 'DSPWidgetWrapper');
    % 11 12
    schema.method(this, 'getDialogSchemaCellArray');
    % 13 14
    schema.prop(this, 'DialogSchema', 'MATLAB array');
    schema.prop(this, 'Block', 'handle');
    schema.prop(this, 'PropNames', 'string vector');
    schema.prop(this, 'PropTypes', 'string vector');
    schema.prop(this, 'UserData', 'mxArray');
end % function
