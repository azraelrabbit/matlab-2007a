function t = makeTable(c, d)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    cInfo = rptgen_sf.csf_truthtable.makeConditionCells(c, d);
    aInfo = rptgen_sf.csf_truthtable.makeActionCells(c, d);
    % 9 11
    switch c.TitleMode
    case 'none'
        tTitle = '';
    case 'auto'
        tTitle = c.RuntimeTruthTable.Name;
    otherwise
        tTitle = rptgen.parseExpressionText(c.Title);
    end
    % 18 21
    % 19 21
    tm = makeNodeTable(d, cInfo{1.0}, 0.0, logical(1));
    % 21 24
    % 22 24
    tm.setTitle(tTitle);
    tm.setColWidths(cInfo{2.0});
    tm.setNumHeadRows(plus(0.0, c.showConditionHeader));
    % 26 28
    t = tm.createTable;
    % 28 30
    for i=3.0:2.0:size(cInfo, 2.0)
        tm = makeNodeTable(d, cInfo{i}, 0.0, logical(1));
        % 31 34
        % 32 34
        tm.setTitle('');
        tm.setColWidths(cInfo{plus(i, 1.0)});
        tm.setNumHeadRows(plus(0.0, c.showConditionHeader));
        % 36 38
        t2 = tm.createTable;
        % 38 40
        t.appendChild(t2.getFirstChild);
        % 40 42
    end % for
    % 42 46
    % 43 46
    % 44 46
    if not(isempty(aInfo{1.0}))
        tm = makeNodeTable(d, aInfo{1.0}, 0.0, logical(1));
        % 47 50
        % 48 50
        tm.setTitle('');
        tm.setColWidths(aInfo{2.0});
        tm.setNumHeadRows(plus(0.0, c.showActionHeader));
        % 52 54
        t2 = tm.createTable;
        % 54 56
        t.appendChild(t2.getFirstChild);
        t2 = [];
    end
end
