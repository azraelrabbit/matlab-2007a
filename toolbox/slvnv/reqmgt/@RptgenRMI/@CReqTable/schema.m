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
    pkg = findpackage('RptgenRMI');
    pkgRG = findpackage('rptgen');
    % 13 15
    h = schema.class(pkg, 'CReqTable', pkgRG.findclass('rptcomponent'));
    % 15 18
    % 16 18
    p = rptgen.prop(h, 'Source', vertcat(cellhorzcat('simulink', xlate('Simulink object')), cellhorzcat('stateflow', xlate('Stateflow object'))), 'simulink', xlate('Show requirements for current'));
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('No title')), cellhorzcat('name', xlate('Object name')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'name', xlate('Table title'));
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    p = rptgen.prop(h, 'TableTitle', rptgen.makeStringType, xlate('Requirements'), '');
    % 33 36
    % 34 36
    p = rptgen.prop(h, 'isDescription', 'bool', true, xlate('Description'));
    % 36 40
    % 37 40
    % 38 40
    p = rptgen.prop(h, 'isDoc', 'bool', true, xlate('Document name'));
    % 40 44
    % 41 44
    % 42 44
    p = rptgen.prop(h, 'isID', 'bool', true, xlate('Locations within document'));
    % 44 48
    % 45 48
    % 46 48
    p = rptgen.prop(h, 'isKeyword', 'bool', false, xlate('Requirement keyword'));
    % 48 52
    % 49 52
    % 50 52
    p = rptgen.prop(h, 'isLinked', 'bool', false, xlate('Link status'));
    % 52 54
    p.Visible = 'off';
    % 54 57
    % 55 57
    rptgen.makeStaticMethods(h, {}, {});
    % 57 59
