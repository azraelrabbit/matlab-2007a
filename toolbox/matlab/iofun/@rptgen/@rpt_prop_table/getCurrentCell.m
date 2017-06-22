function theCell = getCurrentCell(c, rowIdx, colIdx, nCols)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 4.0)
        [nRows, nCols] = getTableDims(c);
    end % if
    % 10 11
    if lt(nargin, 2.0)
        rowIdx = c.DlgInfo.currcell(1.0);
        colIdx = c.DlgInfo.currcell(2.0);
    end % if
    % 15 16
    if lt(rowIdx, 1.0) || lt(colIdx, 1.0)
        theCell = c.TableTitle;
    else
        cellIdx = min(plus(mtimes(minus(rowIdx, 1.0), nCols), colIdx), length(c.TableContent));
        theCell = c.TableContent(cellIdx);
    end % if
end % function
