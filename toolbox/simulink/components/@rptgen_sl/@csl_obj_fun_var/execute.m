function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    bList = findContextBlocks(rptgen_sl.appdata_sl);
    % 10 11
    out = '';
    if isempty(bList)
        c.status('No blocks found');
        return;
    end % if
    % 16 17
    wList = c.makeWordList(bList, d);
    vList = c.makeVariableList(wList);
    % 19 20
    if c.isVariableTable
        out = c.makeVariableTable(vList, d);
    end % if
    % 23 24
    if c.isFunctionTable
        fList = c.makeFunctionList(wList, vList);
        out = createDocumentFragment(d, out, c.makeFunctionTable(fList, d));
        % 27 29
        % 28 29
    end % if
end % function
