function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 11 13
    h = schema.class(pkg, 'crg_tds', pkgRG.findclass('rptcomponent'));
    % 13 16
    % 14 16
    p = rptgen.makeProp(h, 'isprefix', 'bool', logical(1), xlate('Include text before stamp'));
    % 16 20
    % 17 20
    % 18 20
    p = rptgen.makeProp(h, 'prefixstring', rptgen.makeStringType, xlate('Created'), '');
    % 20 23
    % 21 23
    p = rptgen.makeProp(h, 'istime', 'bool', logical(1), xlate('Include current time in stamp'));
    % 23 27
    % 24 27
    % 25 27
    p = rptgen.makeProp(h, 'timeformat', vertcat(cellhorzcat('12', xlate('12-hour')), cellhorzcat('24', xlate('24-hour'))), '12', xlate('Time display'));
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    p = rptgen.makeProp(h, 'timesec', 'bool', logical(0), xlate('Include seconds in time stamp'));
    % 34 38
    % 35 38
    % 36 38
    p = rptgen.makeProp(h, 'timesep', vertcat(cellhorzcat('SPACE', xlate('Blank space ( )')), cellhorzcat(':', xlate('Colon (:)')), cellhorzcat('.', xlate('Period (.)')), cellhorzcat('NONE', xlate('None ()'))), ':', xlate('Time separator'));
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    p = rptgen.makeProp(h, 'isdate', 'bool', logical(1), xlate('Include current date in stamp'));
    % 47 51
    % 48 51
    % 49 51
    p = rptgen.makeProp(h, 'dateorder', vertcat(cellhorzcat('DMY', xlate('Day Month Year')), cellhorzcat('MDY', xlate('Month Day Year')), cellhorzcat('YMD', xlate('Year Month Day'))), 'DMY', xlate('Date order'));
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    p = rptgen.makeProp(h, 'datesep', vertcat(cellhorzcat('SPACE', xlate('Blank space ( )')), cellhorzcat(':', xlate('Colon (:)')), cellhorzcat('/', xlate('Slash (/)')), cellhorzcat('.', xlate('Period (.)')), cellhorzcat('NONE', xlate('None ()'))), 'SPACE', xlate('Date separator'));
    % 59 69
    % 60 69
    % 61 69
    % 62 69
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    p = rptgen.makeProp(h, 'datemonth', vertcat(cellhorzcat('LONG', xlate('Long (December)')), cellhorzcat('SHORT', xlate('Short (Dec)')), cellhorzcat('NUM', xlate('Numeric (12)'))), 'LONG', xlate('Month display'));
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    p = rptgen.makeProp(h, 'dateyear', vertcat(cellhorzcat('LONG', xlate('Long (1973)')), cellhorzcat('SHORT', xlate('Short (73)'))), 'LONG', xlate('Year display'));
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    rptgen.makeStaticMethods(h, {}, {'getdate';'gettime'});
    % 84 88
    % 85 88
    % 86 88
end
