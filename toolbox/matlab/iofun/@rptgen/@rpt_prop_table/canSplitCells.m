function tf = canSplitCells(c, splitDir, rowIdx, colIdx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    tf = true;
    % 8 10
    if lt(nargin, 4.0)
        rowIdx = c.DlgInfo.currcell(1.0);
        colIdx = c.DlgInfo.currcell(2.0);
    end
    % 13 15
    if lt(rowIdx, 1.0) || lt(colIdx, 1.0)
        % 15 17
        tf = false;
    end
    % 18 20
    [nRows, nCols] = getTableDims(c);
    currCell = getCurrentCell(c, rowIdx, colIdx, nCols);
    % 21 23
    tf = gt(currCell.ColSpan, 1.0) || gt(currCell.RowSpan, 1.0);
end
