function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkg, 'cfr_list', pkgRG.findclass('rpt_list'));
    % 13 15
    % 14 15
    p = rptgen.prop(h, 'Source', 'MATLAB array', '', '');
    % 16 17
    rptgen.makeStaticMethods(h, {}, {'list_getContent'});
    % 18 20
    % 19 20
end % function
