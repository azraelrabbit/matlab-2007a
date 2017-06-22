function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgRG = findpackage('rptgen');
    pkgSL = findpackage('rptgen_sl');
    % 10 12
    h = schema.class(pkgSL, 'csl_sys_snap', pkgRG.findclass('rpt_graphic'));
    % 12 14
    lic = 'SIMULINK_Report_Gen';
    % 14 17
    % 15 17
    p = rptgen.prop(h, 'Format', rptgen.getImgFormat('ALLSL'), 'AUTOSL', xlate('Image file format'), lic);
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    p = rptgen.prop(h, 'PaperOrientation', vertcat(cellhorzcat('inherit', xlate('Use system orientation')), cellhorzcat('auto', xlate('Largest dimension vertical')), cellhorzcat('portrait', xlate('Portrait')), cellhorzcat('landscape', xlate('Landscape'))), 'portrait', xlate('Paper orientation'), lic);
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    p = rptgen.prop(h, 'PaperExtentMode', rptgen.enumAutoManual, 'auto', xlate('Image size'), lic);
    % 31 35
    % 32 35
    % 33 35
    p = rptgen.prop(h, 'PaperExtent', 'real point', [7.0 9.0], '', lic);
    % 35 39
    % 36 39
    % 37 39
    p = rptgen.prop(h, 'PaperZoom', 'double', 100.0, '', lic);
    % 39 43
    % 40 43
    % 41 43
    p = rptgen.prop(h, 'PaperUnits', vertcat(cellhorzcat('inches', xlate('Inches')), cellhorzcat('centimeters', xlate('Centimeters')), cellhorzcat('points', xlate('Points')), cellhorzcat('percent', xlate('%'))), 'inches', '', lic);
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    p = rptgen.prop(h, 'isPrintFrame', 'bool', false, xlate('Use printframe'), lic);
    % 51 55
    % 52 55
    % 53 55
    p = rptgen.prop(h, 'PrintFrameName', rptgen.makeStringType, 'rptdefaultframe.fig', '', lic);
    % 55 59
    % 56 59
    % 57 59
    p = rptgen.prop(h, 'CaptionType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('auto', xlate('Description')), cellhorzcat('manual', xlate('Custom: '))), 'none', xlate('Caption'), lic);
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('sysname', xlate('System name')), cellhorzcat('fullname', xlate('Full system name')), cellhorzcat('manual', xlate('Custom: '))), 'none', xlate('Title'), lic);
    % 66 74
    % 67 74
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    p = rptgen.prop(h, 'CreateImagemap', 'bool', true, xlate('Create imagemap with links to blocks and signals'), lic);
    % 74 78
    % 75 78
    % 76 78
    p = rptgen.prop(h, 'RuntimeBoundingBox', 'rect', [0.0 0.0 0.0 0.0], '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 80 83
    % 81 83
    p = rptgen.prop(h, 'RuntimePaperOrientation', 'String', '', '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 85 88
    % 86 88
    p = rptgen.prop(h, 'RuntimeCreateImagemap', 'bool', false, '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 90 93
    % 91 93
    rptgen.makeStaticMethods(h, {}, {'getImagemapCoords';'getImgInfo';'gr_getCaption';'gr_getFileName';'gr_getTitle';'gr_preCreateAction';'makeLineImagemap'});
    % 93 102
    % 94 102
    % 95 102
    % 96 102
    % 97 102
    % 98 102
    % 99 102
    % 100 102
