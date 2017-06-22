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
    h = schema.class(pkgRG, 'rpt_auto_table', pkgRG.findclass('rptcomponent'));
    % 11 14
    % 12 14
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('No title')), cellhorzcat('name', xlate('Name')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'name', xlate('Table title'));
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'Title', rptgen.makeStringType, xlate('Title'), '');
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'HeaderType', vertcat(cellhorzcat('none', xlate('No header')), cellhorzcat('typename', xlate('Type and name')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'none', xlate('Header row'));
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    p = rptgen.prop(h, 'HeaderColumn1', 'string', xlate('Name'), '');
    p = rptgen.prop(h, 'HeaderColumn2', 'string', xlate('Value'), '');
    % 32 35
    % 33 35
    p = rptgen.prop(h, 'RemoveEmpty', 'bool', true, xlate('Don''t display empty values'));
    % 35 39
    % 36 39
    % 37 39
    rptgen.makeStaticMethods(h, {}, {'atGetDialogSchema';'atGetName';'atGetObjects';'atGetPropertyList';'atGetPropertySource';'atGetPropertyValue';'atGetType';'atIgnoreValue';'atMakeAutoTable'});
    % 39 50
    % 40 50
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
