function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    pkgHG = findpackage('rptgen_hg');
    pkgRG = findpackage('rptgen');
    % 13 15
    h = schema.class(pkgHG, 'chg_obj_name', pkgRG.findclass('rpt_name'));
    % 15 18
    % 16 18
    p = rptgen.makeProp(h, 'ObjType', vertcat(cellhorzcat('Figure', xlate('Figure')), cellhorzcat('Axes', xlate('Axes')), cellhorzcat('Object', xlate('Other object'))), 'Figure', xlate('Show name of current'));
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    rptgen.makeStaticMethods(h, {}, {'name_getGenericType';'name_getObject';'name_getPropSrc'});
    % 26 31
    % 27 31
    % 28 31
    % 29 31
