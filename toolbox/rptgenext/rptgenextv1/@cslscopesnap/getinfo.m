function out = getinfo(c)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    out = getprotocomp(c);
    % 19 21
    out.Name = xlate('Block Type: Scope Snapshot');
    out.Type = 'SL';
    out.Desc = xlate('Inserts pictures of Simulink scopes and XY graphs');
    % 23 27
    % 24 27
    % 25 27
    out.att.isForceOpen = logical(0);
    out.att.AutoscaleScope = logical(0);
    out.att.PaperOrientation = '';
    out.att.PaperSize = [5.0 4.0];
    out.att.PaperUnits = 'inches';
    out.att.isInvertHardcopy = logical(0);
    out.att.ImageFormat = 'AUTOHG';
    % 33 35
    out.att.CaptionType = '$none';
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    out.attx.isForceOpen.String = '';
    out.attx.isForceOpen.enumValues = {logical(0),logical(1)};
    out.attx.isForceOpen.enumNames = {'Include open scopes only';'Include all scopes'};
    % 43 45
    out.attx.isForceOpen.UIcontrol = 'radiobutton';
    % 45 47
    out.attx.PaperOrientation.String = 'Paper orientation ';
    out.attx.PaperOrientation.enumValues = {'portrait';'landscape';'rotated'};
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    out.attx.PaperOrientation.enumNames = {'Portrait';'Landscape';'Rotated'};
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    out.attx.PaperOrientation.UIcontrol = 'radiobutton';
    % 58 60
    allFormats = getimgformat(c, 'ALLHG');
    out.attx.ImageFormat = struct('String', 'Image file format', 'enumValues', cellhorzcat(cellhorzcat(allFormats.ID)), 'enumNames', cellhorzcat(cellhorzcat(allFormats.name)));
    % 61 65
    % 62 65
    % 63 65
    out.attx.PaperSize.String = 'Image size: ';
    % 65 67
    out.attx.PaperUnits.String = '';
    out.attx.PaperUnits.enumValues = {'inches','centimeters','points','normalized'};
    % 68 70
    out.attx.PaperUnits.UIcontrol = 'popupmenu';
    % 70 72
    out.attx.isInvertHardcopy.String = 'Use white background and black lines';
    % 72 75
    % 73 75
    out.attx.AutoscaleScope.String = 'Autoscale scopes';
    % 75 78
    % 76 78
    out.attx.CaptionType.String = 'Caption ';
    out.attx.CaptionType.enumValues = {'$none','$auto'};
    out.attx.CaptionType.enumNames = {'No caption';'Automatic (use block description)'};
    % 80 84
    % 81 84
    % 82 84
    out.attx.CaptionType.UIcontrol = 'radiobutton';
end
