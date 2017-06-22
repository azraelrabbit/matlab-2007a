function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_hg');
    % 9 11
    h = schema.class(pkg, 'chg_ax_snap', pkg.findclass('AbstractFigSnap'));
    % 11 15
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'AxesHandle', 'handle', [], '');
    % 15 17
    p.AccessFlags.PublicGet = 'off';
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('name', xlate('Name')), cellhorzcat('manual', xlate('Custom: '))), 'manual', xlate('Title'));
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    rptgen.makeStaticMethods(h, {}, {'gr_getTitle';'copyAxes'});
    % 28 32
    % 29 32
    % 30 32
