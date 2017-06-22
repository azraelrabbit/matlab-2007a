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
    % 19 23
    % 20 23
    % 21 23
    out.Name = xlate('Image');
    out.Type = 'FR';
    out.Desc = xlate('Inserts an image into the document.');
    % 25 29
    % 26 29
    % 27 29
    out.att.isTitle = 'none';
    out.att.Title = xlate('Report Generator Image');
    out.att.FileName = 'ngc6543a.jpg';
    out.att.Caption = '';
    out.att.isInline = logical(0);
    out.att.CalloutList = cell(0.0, 2.0);
    out.att.isCopyFile = logical(0);
    % 35 39
    % 36 39
    % 37 39
    out.attx.isTitle = struct('String', '', 'enumValues', {{'none','local','filename'}}, 'enumNames', {{'No title','Title:','Title from filename'}}, 'UIcontrol', 'radiobutton');
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    out.attx.FileName.String = '';
    out.attx.FileName.Ext = '*';
    out.attx.FileName.isParsedText = logical(1);
    % 46 48
    out.attx.isInline.String = 'Insert as inline image';
    % 48 50
    out.attx.Title.String = '';
    % 50 52
    out.attx.isCopyFile.String = 'Copy to local report files directory';
end
