function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sl');
    pkgHG = findpackage('rptgen_hg');
    % 10 12
    h = schema.class(pkg, 'csl_blk_toworkspace', pkgHG.findclass('AbstractFigSnap'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('varname', xlate('Variable/file')), cellhorzcat('blkname', xlate('Block name')), cellhorzcat('manual', xlate('Custom: '))), 'varname', xlate('Title'), 'SIMULINK_Report_Gen');
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'CaptionType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('auto', xlate('Description')), cellhorzcat('manual', xlate('Custom: '))), 'none', xlate('Caption'), 'SIMULINK_Report_Gen');
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    rptgen.makeStaticMethods(h, {}, {'gr_getCaption';'gr_getTitle'});
    % 34 38
    % 35 38
    % 36 38
