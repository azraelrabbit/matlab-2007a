function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen');
    % 8 9
    h = schema.class(pkg, 'ReportState');
    % 10 13
    % 11 13
    % 12 13
    p = schema.prop(h, 'Language', 'string');
    % 14 15
    p = schema.prop(h, 'Debug', 'MATLAB array');
    % 16 17
    p = schema.prop(h, 'ReportComponent', 'handle');
    % 18 19
    p = schema.prop(h, 'DestroyedListener', 'handle');
    p.Visible = 'off';
end % function
