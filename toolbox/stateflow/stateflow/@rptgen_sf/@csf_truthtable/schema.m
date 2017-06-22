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
    pkg = findpackage('rptgen_sf');
    pkgRG = findpackage('rptgen');
    % 13 15
    h = schema.class(pkg, 'csf_truthtable', pkgRG.findclass('rptcomponent'));
    % 15 17
    lic = 'SIMULINK_Report_Gen';
    % 17 20
    % 18 20
    p = rptgen.prop(h, 'TitleMode', vertcat(cellhorzcat('none', xlate('No title')), cellhorzcat('auto', xlate('Use Stateflow name')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'none', xlate('Title'), lic);
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    p = rptgen.prop(h, 'Title', rptgen.makeStringType, 'Truth Table', xlate(''), lic);
    % 28 32
    % 29 32
    % 30 32
    p = rptgen.prop(h, 'ShowConditionHeader', 'bool', false, xlate('Show header'), lic);
    % 32 36
    % 33 36
    % 34 36
    p = rptgen.prop(h, 'ShowConditionNumber', 'bool', false, xlate('Show number'), lic);
    % 36 40
    % 37 40
    % 38 40
    p = rptgen.prop(h, 'ShowConditionCode', 'bool', false, xlate('Show condition'), lic);
    % 40 44
    % 41 44
    % 42 44
    p = rptgen.prop(h, 'ShowConditionDescription', 'bool', true, xlate('Show description'), lic);
    % 44 48
    % 45 48
    % 46 48
    p = rptgen.prop(h, 'ConditionWrapLimit', 'int32', 20.0, xlate('Wrap if column count exceeds'), lic);
    % 48 52
    % 49 52
    % 50 52
    p = rptgen.prop(h, 'ShowActionHeader', 'bool', false, xlate('Show header'), lic);
    % 52 56
    % 53 56
    % 54 56
    p = rptgen.prop(h, 'ShowActionNumber', 'bool', true, xlate('Show number'), lic);
    % 56 60
    % 57 60
    % 58 60
    p = rptgen.prop(h, 'ShowActionCode', 'bool', true, xlate('Show action'), lic);
    % 60 64
    % 61 64
    % 62 64
    p = rptgen.prop(h, 'ShowActionDescription', 'bool', false, xlate('Show description'), lic);
    % 64 74
    % 65 74
    % 66 74
    % 67 74
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    p = rptgen.prop(h, 'RuntimeTruthTable', 'handle', [], '', 2.0);
    % 74 78
    % 75 78
    % 76 78
    rptgen.makeStaticMethods(h, {'makeConditionCells';'makeActionCells';'findTruthTables'}, {'makeTable'});
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
