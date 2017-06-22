function out = execute(c, d, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    out = [];
    try
        obj = c.pt_getReportedObject;
    catch
        c.status('No object available for property table', 2.0);
        return
    end % try
    if ischar(obj)
        obj = cellhorzcat(obj);
    end
    % 16 18
    propSrc = c.pt_getPropertySource;
    % 18 20
    numCells = length(c.TableContent);
    tCells = javaArray('com.mathworks.toolbox.rptgencore.docbook.CALSEntry', mtimes(numCells, plus(1.0, c.SingleValueMode)));
    % 21 24
    % 22 24
    [numRows, numCols] = getTableDims(c);
    % 24 26
    for i=1.0:numCells
        colIdx = rem(i, numCols);
        if eq(colIdx, 0.0)
            colIdx = numCols;
        end
        % 30 32
        thisCell = c.TableContent(i).makeCells(c.SingleValueMode, propSrc, obj, d, colIdx);
        % 32 37
        % 33 37
        % 34 37
        % 35 37
        if not(isempty(thisCell))
            idxStart = minus(mtimes(plus(1.0, c.SingleValueMode), i), c.SingleValueMode);
            tCells(idxStart:plus(idxStart, c.SingleValueMode)) = thisCell;
        end
    end % for
    % 41 43
    cWid = c.ColWidths;
    if not(isequal(cWid, round(cWid)))
        % 44 46
        cWid = round(mtimes(mrdivide(cWid, mean(cWid)), 100.0));
    end
    % 47 49
    tm = com.mathworks.toolbox.rptgencore.docbook.TableMaker(java(d), cWid);
    % 49 51
    tm.setContent(tCells);
    tm.setTitle(c.TableTitle.parseText(logical(0), propSrc, obj, d));
    tm.setBorder(c.isBorder);
    tm.setPageWide(logical(1));
    tm.setNumHeadRows(0.0);
    tm.setNumFootRows(0.0);
    % 56 58
    out = tm.createTable;
end
