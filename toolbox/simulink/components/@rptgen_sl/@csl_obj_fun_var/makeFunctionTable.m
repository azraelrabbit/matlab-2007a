function out = makeFunctionTable(c, fnList, d)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(fnList)
        out = '';
        c.status('No functions found', 2.0);
        return
    end
    % 11 13
    varTable = vertcat(cellhorzcat(xlate('Function Name')), fnList(:, 1.0));
    cWid = 1.0;
    % 14 16
    if c.FunctionTableParentBlock
        varTable(:, plus(end, 1.0)) = vertcat(cellhorzcat(xlate('Parent Blocks')), fnList(:, 2.0));
        cWid = horzcat(cWid, 4.0);
    end
    % 19 21
    if c.FunctionTableCallingString
        varTable(:, plus(end, 1.0)) = vertcat(cellhorzcat(xlate('Calling string')), fnList(:, 3.0));
        cWid = horzcat(cWid, 2.0);
    end
    % 24 26
    tm = makeNodeTable(d, varTable, 0.0, logical(1));
    % 26 29
    % 27 29
    if strcmp(c.FunctionTableTitleType, 'auto')
        currContext = getContextType(rptgen_sl.appdata_sl, c, logical(0));
        if (isempty(currContext)) | (strcmpi(currContext, 'none'))
            tTitle = xlate('All Functions in all Models');
        else
            tTitle = sprintf('%s Functions', currContext);
        end
    else
        tTitle = rptgen.parseExpressionText(c.FunctionTableTitle);
    end
    % 38 40
    tm.setTitle(tTitle);
    tm.setColWidths(cWid);
    tm.setBorder(c.isBorder);
    tm.setNumHeadRows(1.0);
    % 43 45
    out = tm.createTable;
end
