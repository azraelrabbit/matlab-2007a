function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'cud_class_hier', pkgRG.findclass('rpt_list'));
    % 12 16
    % 13 16
    % 14 16
    p = rptgen.makeProp(h, 'TreeType', vertcat(cellhorzcat('package', xlate('Classes in current package')), cellhorzcat('class', xlate('Current class and parents')), cellhorzcat('auto', xlate('Auto (context-sensitive)'))), 'auto', xlate('Construct tree from'));
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    rptgen.makeStaticMethods(h, {}, {'list_getContent'});
    % 27 30
    % 28 30
