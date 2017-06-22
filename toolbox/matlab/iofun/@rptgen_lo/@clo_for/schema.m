function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgLO = findpackage('rptgen_lo');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkgLO, 'clo_for', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'LoopType', vertcat(cellhorzcat('increment', xlate('Incremented indices')), cellhorzcat('vector', xlate('Vector of indices'))), 'increment', xlate('Loop type'));
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.makeProp(h, 'LoopVector', 'String', '[1 2 3 4 5]', xlate('Vector'));
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.makeProp(h, 'StartNumber', 'String', '1', xlate('Start'));
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.makeProp(h, 'IncrementNumber', 'String', '1', xlate('Increment'));
    % 29 33
    % 30 33
    % 31 33
    p = rptgen.makeProp(h, 'EndNumber', 'String', '5', xlate('End'));
    % 33 37
    % 34 37
    % 35 37
    p = rptgen.makeProp(h, 'isUseVariable', 'bool', logical(1), xlate('Show index value in base workspace'));
    % 37 41
    % 38 41
    % 39 41
    p = rptgen.makeProp(h, 'VariableName', 'string', 'RPTGEN_LOOP', xlate('Variable name'));
    % 41 45
    % 42 45
    % 43 45
    p = rptgen.makeProp(h, 'isCleanup', 'bool', logical(1), xlate('Remove variable from workspace when done'));
    % 45 49
    % 46 49
    % 47 49
    rptgen.makeStaticMethods(h, {}, {});
    % 49 51
end
