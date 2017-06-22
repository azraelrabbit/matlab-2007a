function out = getinfo(c)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    out = getprotocomp(c);
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    out.Name = xlate('List');
    out.Type = 'FR';
    out.Desc = xlate('Inserts a bulleted or numbered list into the report.');
    out.ValidChildren = {logical(1)};
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    out.att.ListTitle = '';
    out.att.isSourceFromWorkspace = logical(0);
    out.att.SourceVariableName = '';
    out.att.SourceCell = {};
    out.att.ListStyle = 'ItemizedList';
    out.att.Spacing = 'Normal';
    out.att.NumerationType = 'Arabic';
    out.att.NumInherit = 'Ignore';
    out.att.NumContinue = 'Restarts';
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    out.attx.SourceVariableName.String = 'Create list from cell array with workspace variable name:';
    % 48 51
    % 49 51
    out.attx.ListTitle.String = 'List title';
    out.attx.ListTitle.isParsedText = logical(1);
    % 52 54
    out.attx.ListStyle = struct('String', 'List style', 'enumValues', {{'ItemizedList';'OrderedList'}}, 'enumNames', {{'Bulleted list';'Numbered list'}});
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    out.attx.Spacing.enumValues = {'Compact';'Normal'};
    % 61 64
    % 62 64
    out.attx.NumerationType = struct('String', 'Numbering style', 'enumValues', {{'Arabic';'Loweralpha';'Upperalpha';'Lowerroman';'Upperroman'}}, 'enumNames', {{'1,2,3,4,...';'a,b,c,d,...';'A,B,C,D,...';'i,ii,iii,iv,...';'I,II,III,IV,...'}});
    % 64 77
    % 65 77
    % 66 77
    % 67 77
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    out.attx.NumInherit = struct('String', '', 'enumValues', {{'Inherit';'Ignore'}}, 'enumNames', {{'Show parent number in nested list (1.1.a)';'Show only current list value (a)'}}, 'UIcontrol', 'radiobutton');
    % 77 85
    % 78 85
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    out.attx.NumContinue = struct('String', '', 'enumValues', {{'Continues';'Restarts'}}, 'enumNames', {{'Continue numbering from previous list';'Always start at 1'}}, 'UIcontrol', 'radiobutton');
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
end
