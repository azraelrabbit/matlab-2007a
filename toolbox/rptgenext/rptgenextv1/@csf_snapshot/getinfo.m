function out = getinfo(c)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    out = getprotocomp(c);
    % 21 23
    out.Name = xlate('Snapshot');
    out.Type = 'SF';
    out.Desc = xlate('Inserts a picture of a Stateflow object');
    % 25 29
    % 26 29
    % 27 29
    out.att.imageSizing = 'auto';
    out.att.PrintSize = [500.0 300.0];
    out.att.PrintSizePoints = out.att.PrintSize;
    out.att.picMinChildren = 0.0;
    out.att.PrintUnits = 'points';
    out.att.ImageFormat = 'AUTOSF';
    out.att.isCallouts = logical(1);
    out.att.TitleType = 'none';
    out.att.TitleString = '';
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    out.attx.picMinChildren.String = 'Run only if Stateflow object has at least the following number of children:';
    % 42 45
    % 43 45
    allFormats = getimgformat(c, 'ALLSF');
    out.attx.ImageFormat = struct('String', 'Image file format', 'enumValues', cellhorzcat(cellhorzcat(allFormats.ID)), 'enumNames', cellhorzcat(cellhorzcat(allFormats.name)));
    % 46 50
    % 47 50
    % 48 50
    out.attx.imageSizing.String = '';
    out.attx.imageSizing.enumValues = {'auto','manual'};
    out.attx.imageSizing.enumNames = {'Attempt to shrink image to minimum font size set in Stateflow Loop','As specified (maintain aspect ratio)'};
    % 52 55
    % 53 55
    out.attx.imageSizing.UIcontrol = 'radiobutton';
    % 55 57
    out.attx.PrintSize.String = 'Maximum size';
    % 57 59
    out.attx.PrintUnits.String = '';
    out.attx.PrintUnits.enumValues = {'inches','centimeters','points'};
    % 60 62
    out.attx.isCallouts.String = 'Include callouts to describe visible objects';
    % 62 65
    % 63 65
    out.attx.TitleType.String = 'Title ';
    out.attx.TitleType.enumValues = {'none','objname','fullsfname','fullslsfname','manual'};
    out.attx.TitleType.enumNames = {'No title';'Object name';'Object name (full Stateflow path)';'Object name (full Simulink+Stateflow path)';'Manual: '};
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    out.attx.TitleType.UIcontrol = 'radiobutton';
    % 73 75
    out.attx.TitleString.String = '';
    out.attx.TitleString.isParsedText = logical(1);
end
