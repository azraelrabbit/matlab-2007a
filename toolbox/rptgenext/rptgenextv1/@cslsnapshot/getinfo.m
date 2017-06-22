function out = getinfo(c)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    out = getprotocomp(c);
    % 20 24
    % 21 24
    % 22 24
    out.Name = xlate('System Snapshot');
    out.Type = 'SL';
    out.Desc = xlate('Inserts a picture of a Simulink system.');
    % 26 30
    % 27 30
    % 28 30
    out.att.format = 'AUTOSL';
    % 30 32
    out.att.TitleType = 'none';
    out.att.TitleString = '';
    % 33 35
    out.att.CaptionType = '$none';
    out.att.CaptionString = '';
    % 36 38
    out.att.PaperOrientation = 'portrait';
    % 38 40
    out.att.PaperExtentMode = 'auto';
    out.att.PaperExtent = [7.0 9.0];
    out.att.PaperUnits = 'inches';
    % 42 44
    out.att.isPrintFrame = logical(0);
    out.att.PrintFrameName = 'rptdefaultframe.fig';
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    allFormats = getimgformat(c, 'ALLSL');
    out.attx.format.String = 'Image file format';
    out.attx.format.enumValues = cellhorzcat(allFormats.ID);
    out.attx.format.enumNames = cellhorzcat(allFormats.name);
    % 56 58
    out.attx.PaperExtentMode.String = 'Image size';
    out.attx.PaperExtentMode.enumValues = {'auto','manual'};
    out.attx.PaperExtentMode.enumNames = {'Automatic','Manual: '};
    % 60 64
    % 61 64
    % 62 64
    out.attx.PaperExtent.String = '';
    % 64 66
    out.attx.PaperUnits.String = '';
    out.attx.PaperUnits.enumValues = {'inches','centimeters','points'};
    % 67 69
    out.attx.PaperUnits.UIcontrol = 'popupmenu';
    % 69 71
    out.attx.isPrintFrame.String = 'Use printframe: ';
    % 71 73
    out.attx.PrintFrameName.String = '';
    out.attx.PrintFrameName.Ext = '.fig';
    % 74 76
    out.attx.PaperOrientation.String = 'Orientation';
    out.attx.PaperOrientation.enumValues = {'','portrait','landscape'};
    % 77 79
    out.attx.PaperOrientation.enumNames = {'Use system orientation','Portrait','Landscape'};
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    out.attx.CaptionType.String = 'Caption ';
    out.attx.CaptionType.enumValues = {'$none','$auto','$manual'};
    out.attx.CaptionType.enumNames = {'No caption';'Automatic (use system description)';'Manual: '};
    % 86 90
    % 87 90
    % 88 90
    out.attx.CaptionType.UIcontrol = 'radiobutton';
    % 90 92
    out.attx.CaptionString.String = '';
    out.attx.CaptionString.isParsedText = logical(1);
    % 93 96
    % 94 96
    out.attx.TitleType.String = 'Title ';
    out.attx.TitleType.enumValues = {'none','sysname','fullsysname','manual'};
    out.attx.TitleType.enumNames = {'No title';'System name';'System name (full path)';'Manual: '};
    % 98 103
    % 99 103
    % 100 103
    % 101 103
    out.attx.TitleType.UIcontrol = 'radiobutton';
    % 103 105
    out.attx.TitleString.String = '';
    out.attx.TitleString.isParsedText = logical(1);
end
