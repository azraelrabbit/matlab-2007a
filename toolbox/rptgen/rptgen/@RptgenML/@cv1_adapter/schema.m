function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgRG = findpackage('rptgen');
    pkg = findpackage('RptgenML');
    % 11 12
    h = schema.class(pkg, 'cv1_adapter', pkgRG.findclass('rptcomponent'));
    % 13 15
    % 14 15
    p = rptgen.prop(h, 'OldComponent', 'MATLAB array', []);
    p.Visible = 'off';
end % function
