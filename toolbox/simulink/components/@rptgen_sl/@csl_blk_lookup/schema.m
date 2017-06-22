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
    h = schema.class(pkg, 'csl_blk_lookup', pkgHG.findclass('AbstractFigSnap'));
    % 12 14
    lic = 'SIMULINK_Report_Gen';
    % 14 17
    % 15 17
    p = rptgen.prop(h, 'isSinglePlot', 'bool', true, xlate('Plot 1-D data'), lic);
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'SinglePlotType', vertcat(cellhorzcat('lineplot', xlate('Line plot')), cellhorzcat('barplot', xlate('Bar plot'))), 'lineplot', xlate(''), lic);
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    p = rptgen.prop(h, 'isSingleTable', 'bool', false, xlate('Create table for 1-D data'), lic);
    % 27 31
    % 28 31
    % 29 31
    p = rptgen.prop(h, 'isDoublePlot', 'bool', false, xlate('Plot 2-D data'));
    % 31 35
    % 32 35
    % 33 35
    p = rptgen.prop(h, 'DoublePlotType', vertcat(cellhorzcat('multilineplot', xlate('Multi-line plot')), cellhorzcat('surfaceplot', xlate('Surface plot'))), 'surfaceplot', xlate(''), lic);
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    p = rptgen.prop(h, 'isDoubleTable', 'bool', false, xlate('Create table for 2-D data'), lic);
    % 41 45
    % 42 45
    % 43 45
    p = rptgen.prop(h, 'isMultiTable', 'bool', false, xlate('Create table for N-D data'), lic);
    % 45 49
    % 46 49
    % 47 49
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('auto', xlate('Block name')), cellhorzcat('manual', xlate('Custom: '))), 'none', xlate('Title'), lic);
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    p = rptgen.prop(h, 'CaptionType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('auto', xlate('Description')), cellhorzcat('manual', xlate('Custom: '))), 'none', xlate('Caption'), lic);
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    rptgen.makeStaticMethods(h, {}, {'gr_getCaption';'gr_getTitle';'makeFigureOneD';'makeFigureTwoD'});
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
