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
    h = schema.class(pkgRG, 'rpt_graphic', pkgRG.findclass('rptcomponent'));
    % 11 14
    % 12 14
    p = rptgen.prop(h, 'Title', rptgen.makeStringType, '', xlate('Title'));
    % 14 18
    % 15 18
    % 16 18
    p = rptgen.prop(h, 'Caption', rptgen.makeStringType, '', xlate('Caption'));
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.prop(h, 'isInline', 'bool', false, xlate('Insert as inline image'));
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.prop(h, 'DocHorizAlign', vertcat(cellhorzcat('auto', xlate('Auto')), cellhorzcat('right', xlate('Right')), cellhorzcat('center', xlate('Center')), cellhorzcat('left', xlate('Left'))), 'auto', xlate('Alignment'));
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    p = rptgen.prop(h, 'DocWidth', 'String', '', xlate('Document absolute width'), 2.0);
    % 35 39
    % 36 39
    % 37 39
    p = rptgen.prop(h, 'DocHeight', 'String', '', xlate('Document absolute height'), 2.0);
    % 39 43
    % 40 43
    % 41 43
    p = rptgen.prop(h, 'ViewportType', vertcat(cellhorzcat('none', xlate('Use image size')), cellhorzcat('zoom', xlate('Zoom: ')), cellhorzcat('fixed', xlate('Fixed size'))), 'none', xlate('Scaling'));
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    p = rptgen.prop(h, 'ViewportSize', 'real point', [7.0 9.0], xlate('Size'));
    % 50 54
    % 51 54
    % 52 54
    p = rptgen.prop(h, 'ViewportUnits', vertcat(cellhorzcat('inches', xlate('Inches')), cellhorzcat('centimeters', xlate('Centimeters')), cellhorzcat('points', xlate('Points'))), 'inches');
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    p = rptgen.prop(h, 'ViewportZoom', 'double', 100.0);
    % 61 64
    % 62 64
    p = rptgen.prop(h, 'RuntimeViewportSize', 'real point', [-1.0 -1.0], '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 66 69
    % 67 69
    rptgen.makeStaticMethods(h, {}, {'gr_dlgDisplayOptions';'gr_getCaption';'gr_getFileName';'gr_getTitle';'gr_makeGraphic';'gr_preCreateAction';'gr_makeViewport';'gr_getIntrinsicSize'});
    % 69 79
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
