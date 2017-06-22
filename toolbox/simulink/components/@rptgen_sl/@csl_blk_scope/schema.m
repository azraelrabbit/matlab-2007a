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
    h = schema.class(pkg, 'csl_blk_scope', pkgHG.findclass('AbstractFigSnap'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'isForceOpen', 'bool', false, xlate('Report on closed scopes'), 'SIMULINK_Report_Gen');
    % 15 19
    % 16 19
    % 17 19
    p = rptgen.prop(h, 'CaptionType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('auto', xlate('Description')), cellhorzcat('manual', xlate('Custom: '))), 'none', xlate('Caption'), 'SIMULINK_Report_Gen');
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('blkname', xlate('Block name')), cellhorzcat('fullname', xlate('Full block name')), cellhorzcat('manual', xlate('Custom: '))), 'blkname', xlate('Title'), 'SIMULINK_Report_Gen');
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    p = rptgen.prop(h, 'AutoscaleScope', 'bool', false, xlate('Autoscale time axis'), 'SIMULINK_Report_Gen');
    % 34 38
    % 35 38
    % 36 38
    rptgen.makeStaticMethods(h, {}, {'gr_getCaption';'gr_getTitle'});
    % 38 42
    % 39 42
    % 40 42
