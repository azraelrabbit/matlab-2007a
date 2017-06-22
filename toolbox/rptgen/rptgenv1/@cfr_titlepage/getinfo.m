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
    out.Name = xlate('Title Page');
    out.Type = 'FR';
    out.Desc = xlate('Inserts a title page into the report.');
    % 25 29
    % 26 29
    % 27 29
    out.att.Title = '';
    out.att.Subtitle = '';
    out.att.Author = '';
    out.att.Include_Date = logical(1);
    out.att.DateFormat = 1.0;
    out.att.Include_Copyright = logical(1);
    out.att.Copyright_Holder = '';
    % 35 38
    % 36 38
    clockNum = clock;
    out.att.Copyright_Date = num2str(clockNum(1.0));
    out.att.Abstract = {''};
    out.att.Legal_Notice = {''};
    out.att.Image = '';
    % 42 46
    % 43 46
    % 44 46
    out.attx.Title = struct('String', 'Title', 'Type', 'STRING', 'isParsedText', logical(1), 'UIcontrol', 'edit');
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    out.attx.Subtitle = struct('String', 'Subtitle', 'Type', 'STRING', 'isParsedText', logical(1), 'UIcontrol', 'edit');
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    out.attx.Author = struct('String', 'Author', 'Type', 'STRING', 'isParsedText', logical(1), 'UIcontrol', 'edit');
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    out.attx.Include_Copyright = struct('String', 'Include copyright information', 'Type', 'LOGICAL', 'UIcontrol', 'checkbox');
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    out.attx.Include_Date = struct('String', 'Include date report was created', 'Type', 'LOGICAL', 'UIcontrol', 'checkbox');
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    dateVals = {'dd-mmm-yyyy HH:MM:SS';'dd-mmm-yyyy';'mm/dd/yy';'mmm';'m';'mm';'mm/dd';'dd';'ddd';'d';'yyyy';'yy';'mmmyy';'HH:MM:SS';'HH:MM:SS PM';'HH:MM';'HH:MM PM';'QQ-YY';'QQ'};
    % 74 96
    % 75 96
    % 76 96
    % 77 96
    % 78 96
    % 79 96
    % 80 96
    % 81 96
    % 82 96
    % 83 96
    % 84 96
    % 85 96
    % 86 96
    % 87 96
    % 88 96
    % 89 96
    % 90 96
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    currDate = now;
    for i=length(dateVals):-1.0:1.0
        dateDisplay{i, 1.0} = datestr(currDate, dateVals{i});
    end % for
    % 99 101
    out.attx.DateFormat = struct('String', '', 'Type', 'ENUM', 'enumValues', cellhorzcat(dateVals), 'enumNames', cellhorzcat(dateDisplay), 'UIcontrol', 'popupmenu');
    % 101 108
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
    out.attx.Copyright_Holder = struct('String', 'Name of copyright holder', 'Type', 'STRING', 'isParsedText', logical(1), 'UIcontrol', 'edit');
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    out.attx.Copyright_Date = struct('String', 'copyright year', 'Type', 'STRING', 'isParsedText', logical(1), 'UIcontrol', 'edit');
    % 114 120
    % 115 120
    % 116 120
    % 117 120
    % 118 120
    out.attx.Abstract = struct('String', 'Abstract', 'Type', 'STRING', 'isParsedText', logical(1), 'UIcontrol', 'multiedit');
    % 120 126
    % 121 126
    % 122 126
    % 123 126
    % 124 126
    out.attx.Legal_Notice = struct('String', 'Legal notice', 'Type', 'STRING', 'isParsedText', logical(1), 'UIcontrol', 'multiedit');
    % 126 132
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    out.attx.Image = struct('Ext', '*', 'isParsedText', logical(1));
    % 132 134
end
