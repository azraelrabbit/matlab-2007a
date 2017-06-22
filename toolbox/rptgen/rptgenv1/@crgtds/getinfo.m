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
    out.Name = xlate('Time/Date Stamp');
    out.Type = 'RG';
    out.Desc = xlate('Displays the time and date of generation.');
    % 25 29
    % 26 29
    % 27 29
    out.att.isprefix = logical(1);
    out.att.prefixstring = xlate('Created ');
    % 30 32
    out.att.istime = logical(1);
    out.att.timeformat = 12.0;
    out.att.timesec = logical(0);
    out.att.timesep = ':';
    % 35 37
    out.att.isdate = logical(1);
    out.att.dateorder = 'DMY';
    out.att.datesep = ' ';
    out.att.datemonth = 'LONG';
    out.att.dateyear = 'LONG';
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    out.attx.prefixstring.String = '';
    out.attx.isprefix.String = 'Include text before stamp: ';
    out.attx.istime.String = 'Include current time in stamp';
    out.attx.isdate.String = 'Include current date in stamp';
    out.attx.timesec.String = 'Include seconds in time stamp';
    % 51 53
    out.attx.timesep = struct('String', 'Time separator', 'enumValues', {{'&nbsp;',':','.',''}}, 'enumNames', {{'Blank space ( )';'Colon (:)';'Period (.)';'None ()'}});
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    out.attx.datesep = struct('String', 'Date separator', 'enumValues', {{'&nbsp;',':','//','.',''}}, 'enumNames', {{'Blank space ( )';'Colon (:)';'Slash (/)';'Period (.)';'None ()'}});
    % 60 68
    % 61 68
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    out.attx.dateorder = struct('String', 'Date order', 'enumValues', {{'DMY','MDY','YMD'}}, 'enumNames', {{'Day Month Year';'Month Day Year';'Year Month Day'}});
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    out.attx.dateyear = struct('String', 'Year display', 'Type', 'ENUM', 'enumValues', {{'LONG','SHORT'}}, 'enumNames', {{'Long (1998)','Short (98)'}});
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    out.attx.datemonth = struct('String', 'Month display', 'enumValues', {{'LONG','SHORT','NUM'}}, 'enumNames', {{'Long (December)';'Short (Dec)';'Numeric (12)'}});
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    out.attx.timeformat = struct('String', 'Time display', 'Type', 'ENUM', 'enumValues', {{[12.0],[24.0]}}, 'enumNames', {{'12-hour';'24-hour'}});
    % 85 89
    % 86 89
    % 87 89
end
