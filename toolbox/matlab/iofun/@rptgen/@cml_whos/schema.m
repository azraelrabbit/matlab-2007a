function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'cml_whos', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'Source', vertcat(cellhorzcat('WORKSPACE', xlate('Base workspace')), cellhorzcat('MATFILE', xlate('MAT-file: ')), cellhorzcat('GLOBAL', xlate('Global workspace'))), 'WORKSPACE', xlate('Read variables from'));
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    p = rptgen.makeProp(h, 'Filename', rptgen.makeStringType, 'matlab.mat', '');
    % 23 27
    % 24 27
    % 25 27
    p = rptgen.makeProp(h, 'TitleType', vertcat(cellhorzcat('auto', xlate('Automatic')), cellhorzcat('manual', horzcat(xlate('Custom'), ': '))), 'auto', xlate('Table title'));
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    p = rptgen.makeProp(h, 'TableTitle', rptgen.makeStringType, 'Variables', '');
    % 34 37
    % 35 37
    p = rptgen.makeProp(h, 'isSize', 'bool', logical(1), xlate('Variable dimensions (MxN)'));
    % 37 41
    % 38 41
    % 39 41
    p = rptgen.makeProp(h, 'isBytes', 'bool', logical(1), xlate('Variable memory bytes'));
    % 41 45
    % 42 45
    % 43 45
    p = rptgen.makeProp(h, 'isClass', 'bool', logical(1), xlate('Variable class'));
    % 45 49
    % 46 49
    % 47 49
    p = rptgen.makeProp(h, 'isValue', 'bool', logical(0), xlate('Variable value'));
    % 49 53
    % 50 53
    % 51 53
    rptgen.makeStaticMethods(h, {}, {});
    % 53 55
end
