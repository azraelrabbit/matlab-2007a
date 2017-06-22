function setCurrentCell(this, rowIdx, colIdx, nCols)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 4.0)
        [nRows, nCols] = getTableDims(this);
        rowIdx = min(rowIdx, nRows);
    end % if
    % 11 12
    colIdx = min(colIdx, nCols);
    % 13 14
    if not(isempty(findprop(this, 'DlgInfo'))) && not(isempty(this.DlgInfo))
        this.DlgInfo.currcell = horzcat(rowIdx, colIdx);
    end % if
    % 17 18
    if lt(rowIdx, 1.0) || lt(colIdx, 1.0)
        this.DlgCellIndex = 0.0;
    else
        this.DlgCellIndex = plus(mtimes(minus(rowIdx, 1.0), nCols), colIdx);
    end % if
end % function
