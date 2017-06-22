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
    % 21 25
    % 22 25
    % 23 25
    out.Name = xlate('Report Options');
    out.Type = 'None';
    out.Desc = xlate('This component writes the output file and runs the outline.');
    % 27 29
    out.ValidChildren = {logical(1)};
    out.ValidParents = {logical(0)};
    % 30 34
    % 31 34
    % 32 34
    out.att = struct('DirectoryType', 'setfile', 'DirectoryName', '', 'FilenameType', 'setfile', 'FilenameName', 'index', 'isIncrementFilename', logical(0), 'Format', 'HTML', 'Stylesheet', '', 'isView', logical(1), 'isRegenerateImages', logical(1), 'isAutoSaveOnGenerate', logical(0), 'PostGenerateFcn', '', 'isDebug', logical(0), 'Description', cellhorzcat(xlate('A report')));
    % 34 50
    % 35 50
    % 36 50
    % 37 50
    % 38 50
    % 39 50
    % 40 50
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    out.attx.DirectoryType = struct('String', 'Directory:', 'enumValues', {{'setfile','pwd','other'}}, 'enumNames', {{'Same as setup file','Present working directory','Other'}}, 'UIcontrol', 'radiobutton');
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    out.attx.DirectoryName = struct('String', '', 'UIcontrol', 'edit', 'isParsedText', logical(1));
    % 55 59
    % 56 59
    % 57 59
    out.attx.FilenameType = struct('String', 'Filename:', 'enumValues', {{'setfile','other'}}, 'enumNames', {{'Same as setup file','Other'}}, 'UIcontrol', 'radiobutton');
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    out.attx.FilenameName = struct('String', '', 'UIcontrol', 'edit', 'isParsedText', logical(1));
    % 64 68
    % 65 68
    % 66 68
    out.attx.isIncrementFilename = struct('String', 'If report already exists, increment to prevent overwriting', 'Type', 'LOGICAL', 'UIcontrol', 'checkbox');
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    out.attx.isView = struct('String', 'View report after generating', 'Type', 'LOGICAL', 'UIcontrol', 'checkbox');
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    out.attx.isRegenerateImages = struct('String', xlate('Re-generate Simulink & Stateflow images'), 'Type', 'LOGICAL', 'UIcontrol', 'checkbox');
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    out.attx.isAutoSaveOnGenerate = struct('String', 'Save setup file on generation', 'Type', 'LOGICAL', 'UIcontrol', 'checkbox');
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    out.attx.Format = struct('Type', 'ENUM', 'String', '', 'UIcontrol', 'popupmenu');
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    out.attx.Stylesheet = struct('Type', 'ENUM', 'String', '', 'UIcontrol', 'popupmenu');
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    out.attx.Description = struct('String', 'Description', 'UIcontrol', 'multiedit');
    % 98 100
end
