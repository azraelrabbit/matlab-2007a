function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mlock;
    % 9 10
    pkg = findpackage('slhdlcoder');
    this = schema.class(pkg, 'ConfigurationContainer');
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    schema.prop(this, 'fileName', 'string');
    schema.prop(this, 'defaults', 'mxArray');
    schema.prop(this, 'statements', 'mxArray');
    schema.prop(this, 'HDLTopLevel', 'string');
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    schema.prop(this, 'settings', 'mxArray');
end % function
