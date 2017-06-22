function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    verStruct = ver;
    % 9 11
    tableCells = ctranspose(cellhorzcat(verStruct.Name));
    hRow = cellhorzcat(xlate('Name'));
    colWid = 3.0;
    % 13 15
    if c.isVersion
        tableCells = horzcat(tableCells, ctranspose(cellhorzcat(verStruct.Version)));
        colWid = horzcat(colWid, 1.0);
        hRow{plus(end, 1.0)} = xlate('Version');
    end
    % 19 21
    if c.isRelease
        tableCells = horzcat(tableCells, ctranspose(cellhorzcat(verStruct.Release)));
        colWid = horzcat(colWid, 1.0);
        hRow{plus(end, 1.0)} = xlate('Release');
    end
    % 25 27
    if c.isDate
        tableCells = horzcat(tableCells, ctranspose(cellhorzcat(verStruct.Date)));
        colWid = horzcat(colWid, 2.0);
        hRow{plus(end, 1.0)} = xlate('Date');
    end
    % 31 33
    if c.isHeaderRow
        tableCells = vertcat(hRow, tableCells);
    end
    % 35 37
    tm = makeNodeTable(d, tableCells, 0.0, logical(1));
    % 37 41
    % 38 41
    % 39 41
    tm.setColWidths(colWid);
    tm.setTitle(rptgen.parseExpressionText(c.TableTitle));
    tm.setBorder(c.isBorder);
    tm.setPageWide(logical(1));
    tm.setNumHeadRows(plus(c.isHeaderRow, 0.0));
    tm.setNumFootRows(0.0);
    % 46 48
    out = tm.createTable;
end
