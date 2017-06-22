function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sf');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'csf_obj_snap', pkgRG.findclass('rpt_graphic'));
    % 12 14
    lic = 'SIMULINK_Report_Gen';
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    p = rptgen.prop(h, 'imageSizing', vertcat(cellhorzcat('auto', xlate('Shrink image to minimum font size set in Stateflow Hierarchy Loop')), cellhorzcat('manual', xlate('Fixed size')), cellhorzcat('zoom', xlate('Zoom'))), 'auto', '', lic);
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    p = rptgen.prop(h, 'PrintSize', 'real point', [500.0 300.0], xlate('Image size'), lic);
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    p = rptgen.prop(h, 'PrintZoom', 'double', 100.0, '', lic);
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    p = rptgen.prop(h, 'PrintUnits', vertcat(cellhorzcat('inches', xlate('Inches')), cellhorzcat('centimeters', xlate('Centimeters')), cellhorzcat('pixels', xlate('Pixels')), cellhorzcat('points', xlate('Points'))), 'points', '', lic);
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    p = rptgen.prop(h, 'LastPrintUnits', 'string', '', '', 2.0);
    % 44 47
    % 45 47
    p = rptgen.prop(h, 'PaperOrientation', vertcat(cellhorzcat('portrait', xlate('Portrait')), cellhorzcat('landscape', xlate('Landscape')), cellhorzcat('rotated', xlate('Rotated')), cellhorzcat('auto', xlate('Largest dimension vertical')), cellhorzcat('inherit', xlate('Use Chart PaperOrientation setting'))), 'portrait', xlate('Paper orientation'), lic);
    % 47 56
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    p = rptgen.prop(h, 'isPrintFrame', 'bool', false, xlate('Use printframe'), lic);
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    p = rptgen.prop(h, 'PrintFrameName', rptgen.makeStringType, 'rptdefaultframe.fig', '', lic);
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    p = rptgen.prop(h, 'isPrintFrameSettings', 'bool', true, xlate('Use printframe paper settings'), lic);
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    p = rptgen.prop(h, 'PrintSizePoints', 'real point', [-1.0 -1.0], '');
    p.Visible = 'off';
    % 72 75
    % 73 75
    p = rptgen.prop(h, 'ImageFormat', rptgen.getImgFormat('ALLSF'), 'AUTOSF', xlate('Image file format'), lic);
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    p = rptgen.prop(h, 'isCallouts', 'bool', true, xlate('Include callouts to describe visible objects'), lic);
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    p = rptgen.prop(h, 'TerminalChildAnchors', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('redundant', xlate('Redundant children only')), cellhorzcat('all', xlate('All'))), 'none', xlate('Insert anchors for transitions and junctions'), lic);
    % 86 93
    % 87 93
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    p = rptgen.prop(h, 'picMinChildren', 'double', 0.0, xlate('Run only if Stateflow object has at least the following number of children:'), lic);
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    p = rptgen.prop(h, 'AvoidRepeatSnapshot', 'bool', true, xlate('Do not take snapshot if this object appears legibly in another picture'), lic);
    % 98 101
    % 99 101
    p.Visible = 'off';
    % 101 104
    % 102 104
    p = rptgen.prop(h, 'RuntimePointerCoords', 'MATLAB array', {}, '', 2.0);
    % 104 107
    % 105 107
    p = rptgen.prop(h, 'RuntimeAnchors', 'org.w3c.dom.Node', [], '', 2.0);
    % 107 110
    % 108 110
    p = rptgen.prop(h, 'RuntimeImageSize', 'real point', [-1.0 -1.0], '', 2.0);
    % 110 113
    % 111 113
    p = rptgen.prop(h, 'RuntimePaperOrientation', 'String', '', '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 115 118
    % 116 118
    p = rptgen.prop(h, 'RuntimeMinMarginsWithCallouts', 'double', 0.0, '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 120 122
    p = rptgen.prop(h, 'RuntimeMinMarginsNoCallouts', 'double', 0.0, '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 124 127
    % 125 127
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('objname', xlate('Object name')), cellhorzcat('fullsfname', xlate('Full Stateflow name')), cellhorzcat('fullslsfname', xlate('Full Simulink + Stateflow name')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'none', xlate('Image title'), lic);
    % 127 136
    % 128 136
    % 129 136
    % 130 136
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    p = rptgen.prop(h, 'CaptionType', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('auto', xlate('Description')), cellhorzcat('manual', xlate('Custom: '))), 'none', xlate('Caption'), lic);
    % 136 145
    % 137 145
    % 138 145
    % 139 145
    % 140 145
    % 141 145
    % 142 145
    % 143 145
    p = rptgen.prop(h, 'TitleString', rptgen.makeStringType, '', '', lic);
    % 145 147
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @getTitleString;
    p.SetFunction = @setTitleString;
    p.Visible = 'off';
    % 153 156
    % 154 156
    rptgen.makeStaticMethods(h, {}, {'takeSnapshot';'gr_getCaption';'gr_getFileName';'gr_getIntrinsicSize';'gr_getTitle';'gr_preCreateAction'});
    % 156 164
    % 157 164
    % 158 164
    % 159 164
    % 160 164
    % 161 164
    % 162 164
function returnedValue = getTitleString(this, storedValue)
    % 164 171
    % 165 171
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    returnedValue = get(this, 'Title');
function valueStored = setTitleString(this, proposedValue)
    % 172 178
    % 173 178
    % 174 178
    % 175 178
    % 176 178
    set(this, 'Title', proposedValue);
    valueStored = '';
