function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgHG = findpackage('rptgen_hg');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkgHG, 'AbstractFigSnap', pkgRG.findclass('rpt_graphic'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'isCapture', 'bool', false, horzcat(xlate('Capture figure from screen'), ':'));
    % 15 18
    % 16 18
    p = rptgen.makeProp(h, 'CaptureWindowDecorations', vertcat(cellhorzcat('client', xlate('Client area only')), cellhorzcat('window', xlate('Entire figure window'))), 'client', '');
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.makeProp(h, 'PaperOrientation', vertcat(cellhorzcat('inherit', xlate('Use figure orientation')), cellhorzcat('portrait', xlate('Portrait')), cellhorzcat('landscape', xlate('Landscape')), cellhorzcat('rotated', xlate('Rotated'))), 'inherit', xlate('Paper orientation'));
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    p = rptgen.makeProp(h, 'isResizeFigure', vertcat(cellhorzcat('inherit', xlate('Use figure PaperPositionMode setting')), cellhorzcat('auto', xlate('Automatic (same size as on-screen)')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'auto', xlate('Image size'));
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    p = rptgen.prop(h, 'PrintSize', 'real point', [5.0 3.0], '');
    % 43 47
    % 44 47
    % 45 47
    p = rptgen.prop(h, 'PrintUnits', vertcat(cellhorzcat('inches', xlate('Inches')), cellhorzcat('centimeters', xlate('Centimeters')), cellhorzcat('points', xlate('Points')), cellhorzcat('normalized', xlate('Normalized (0.0 to 1.0)'))), 'inches', '');
    % 47 55
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    p = rptgen.prop(h, 'InvertHardcopy', vertcat(cellhorzcat('auto', xlate('Automatic')), cellhorzcat('on', xlate('Invert')), cellhorzcat('off', xlate('Don''t invert')), cellhorzcat('inherit', xlate('Use figure InvertHardcopy setting')), cellhorzcat('none', xlate('Make figure background transparent'))), 'auto', xlate('Invert hardcopy'));
    % 55 64
    % 56 64
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    p = rptgen.prop(h, 'ImageFormat', rptgen.getImgFormat('ALLHG'), 'AUTOHG', xlate('Image file format'));
    % 64 68
    % 65 68
    % 66 68
    p = rptgen.prop(h, 'RuntimePaperOrientation', 'String', '', '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 70 73
    % 71 73
    rptgen.makeStaticMethods(h, {}, {'dlgContainerFormat';'dlgContainerPrint';'dlgContainerSimplePrint';'findInvertState';'gr_getIntrinsicSize';'gr_getFileName'});
    % 73 81
    % 74 81
    % 75 81
    % 76 81
    % 77 81
    % 78 81
    % 79 81
