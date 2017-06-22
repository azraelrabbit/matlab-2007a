function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgHG = findpackage('rptgen_hg');
    % 9 11
    h = schema.class(pkgHG, 'chg_fig_snap', pkgHG.findclass('AbstractFigSnap'));
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    p = rptgen.makeProp(h, 'FigureHandle', 'handle', [], '');
    % 16 18
    p.AccessFlags.PublicGet = 'off';
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('name', xlate('Name')), cellhorzcat('manual', xlate('Custom: '))), 'manual', xlate('Title'));
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    rptgen.makeStaticMethods(h, {}, {'gr_getTitle'});
    % 30 33
    % 31 33
