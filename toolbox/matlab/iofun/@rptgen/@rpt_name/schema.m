function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgRG = findpackage('rptgen');
    % 9 11
    h = schema.class(pkgRG, 'rpt_name', pkgRG.findclass('rptcomponent'));
    % 11 13
    p = rptgen.makeProp(h, 'RenderAs', vertcat(cellhorzcat('n', xlate('Name')), cellhorzcat('t n', xlate('Type Name')), cellhorzcat('t-n', xlate('Type - Name')), cellhorzcat('t:n', xlate('Type: Name'))), 'n', xlate('Display name as'));
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    rptgen.makeStaticMethods(h, {}, {'name_getGenericType';'name_getName';'name_getObject';'name_getPropSrc'});
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
