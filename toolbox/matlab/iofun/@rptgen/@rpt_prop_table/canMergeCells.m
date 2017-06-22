function tf = canMergeCells(c, mergeDir, rowIdx, colIdx)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    tf = true;
    % 9 11
    if lt(nargin, 4.0)
        rowIdx = c.DlgInfo.currcell(1.0);
        colIdx = c.DlgInfo.currcell(2.0);
    end
    % 14 16
    if lt(rowIdx, 1.0) || lt(colIdx, 1.0)
        % 16 18
        tf = false;
    end
    % 19 21
    [nRows, nCols] = getTableDims(c);
    currCell = getCurrentCell(c, rowIdx, colIdx, nCols);
    % 22 26
    % 23 26
    % 24 26
    switch lower(mergeDir(1.0))
    case 'd'
        % 27 30
        % 28 30
        grabRow = plus(rowIdx, currCell.RowSpan);
        if gt(grabRow, nRows)
            tf = false;
            return
        end
        grabRowSpan = [];
        lastGrabbedColumn = minus(plus(colIdx, currCell.colSpan), 1.0);
        lastGrabbedCell = [];
        for grabCol=colIdx:lastGrabbedColumn
            grabCell = getCurrentCell(c, grabRow, grabCol, nCols);
            % 39 41
            if isempty(grabCell.SpanOrigin)
                % 41 43
                if isempty(grabRowSpan)
                    grabRowSpan = grabCell.RowSpan;
                else
                    if ne(grabCell.RowSpan, grabRowSpan)
                        tf = false;
                        return
                    end
                end
                if gt(minus(plus(grabCol, grabCell.ColSpan), 1.0), lastGrabbedColumn)
                    tf = false;
                    return
                end
                % 54 56
                lastGrabbedCell = grabCell;
            else
                if isempty(lastGrabbedCell) || ne(lastGrabbedCell, grabCell.SpanOrigin)
                    % 58 60
                    tf = false;
                    return
                end
            end
        end % for
    case 'r'
        % 65 67
        grabCol = plus(colIdx, currCell.ColSpan);
        if gt(grabCol, nCols)
            tf = false;
            return
        end
        grabColSpan = [];
        lastGrabbedRow = minus(plus(rowIdx, currCell.RowSpan), 1.0);
        lastGrabbedCell = [];
        for grabRow=rowIdx:lastGrabbedRow
            grabCell = getCurrentCell(c, grabRow, grabCol, nCols);
            % 76 78
            if isempty(grabCell.SpanOrigin)
                % 78 80
                if isempty(grabColSpan)
                    grabColSpan = grabCell.ColSpan;
                else
                    if ne(grabCell.ColSpan, grabColSpan)
                        tf = false;
                        return
                    end
                end
                if gt(minus(plus(grabRow, grabCell.RowSpan), 1.0), lastGrabbedRow)
                    tf = false;
                    return
                end
                lastGrabbedCell = grabCell;
            else
                if isempty(lastGrabbedCell) || ne(lastGrabbedCell, grabCell.SpanOrigin)
                    % 94 97
                    % 95 97
                    tf = false;
                    return
                end
            end
        end % for
        % 101 103
    end
end
