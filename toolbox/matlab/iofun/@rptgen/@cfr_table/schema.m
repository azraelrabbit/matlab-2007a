function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'cfr_table', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'TableTitle', rptgen.makeStringType, '', xlate('Table title'));
    % 15 19
    % 16 19
    % 17 19
    p = rptgen.prop(h, 'Source', 'MATLAB array', '', xlate('Workspace variable name'));
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p = rptgen.prop(h, 'isPgwide', 'bool', true, xlate('Table spans page width'));
    % 24 28
    % 25 28
    % 26 28
    p = rptgen.prop(h, 'ColumnWidths', 'MATLAB array', [], xlate('Column widths'));
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    p = rptgen.prop(h, 'AllAlign', rptgen.enumTableHorizAlign, 'left', xlate('Cell alignment'));
    % 34 38
    % 35 38
    % 36 38
    p = rptgen.prop(h, 'isBorder', 'bool', true, xlate('Table grid lines'));
    % 38 42
    % 39 42
    % 40 42
    p = rptgen.prop(h, 'isInverted', 'bool', false, 'Rotate table 90 degrees');
    % 42 44
    p.Visible = 'off';
    % 44 48
    % 45 48
    % 46 48
    p = rptgen.prop(h, 'numHeaderRows', 'int32', 1.0, xlate('Number of header rows'));
    % 48 52
    % 49 52
    % 50 52
    p = rptgen.prop(h, 'Footer', vertcat(cellhorzcat('NONE', xlate('No footer')), cellhorzcat('LASTROWS', xlate('Last N rows are footer: '))), 'NONE', '');
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    p = rptgen.prop(h, 'numFooterRows', 'int32', 1.0, '');
    % 58 61
    % 59 61
    p = rptgen.prop(h, 'ShrinkEntries', 'bool', true, xlate('Collapse large cells to a simple description'));
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    rptgen.makeStaticMethods(h, {}, {'getContent'});
    % 66 69
    % 67 69
