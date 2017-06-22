function mergeCells(c, mergeDir, rowIdx, colIdx)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if lt(nargin, 4.0)
        rowIdx = c.DlgInfo.currcell(1.0);
        colIdx = c.DlgInfo.currcell(2.0);
    end % if
    % 12 14
    if not(canMergeCells(c, mergeDir, rowIdx, colIdx))
        return;
    end % if
    % 16 18
    [nRows, nCols] = getTableDims(c);
    currCell = getCurrentCell(c, rowIdx, colIdx, nCols);
    % 19 23
    % 20 23
    % 21 23
    switch lower(mergeDir(1.0))
    case 'd'
        % 24 28
        % 25 28
        % 26 28
        grabRow = plus(rowIdx, currCell.RowSpan);
        if gt(grabRow, nRows)
            return;
        end % if
        grabbedText = '';
        maxRowSpan = 1.0;
        for grabCol=colIdx:minus(plus(colIdx, currCell.colSpan), 1.0)
            grabCell = getCurrentCell(c, grabRow, grabCol, nCols);
            if gt(grabCell.RowSpan, 1.0) || gt(grabCell.ColSpan, 1.0)
                maxRowSpan = max(maxRowSpan, grabCell.RowSpan);
                % 37 39
                for refGrabRow=grabRow:minus(plus(grabRow, grabCell.RowSpan), 1.0)
                    for refGrabCol=grabCol:minus(plus(grabCol, grabCell.ColSpan), 1.0)
                        refGrabCell = getCurrentCell(c, refGrabRow, refGrabCol, nCols);
                        refGrabCell.SpanOrigin = currCell;
                    end % for
                end % for
                grabCell.RowSpan = 1.0;
                grabCell.ColSpan = 1.0;
            else
                grabCell.SpanOrigin = currCell;
            end % if
            if not(isempty(grabCell.text))
                grabbedText = horzcat(grabbedText, ' ', grabCell.text);
                grabCell.text = '';
            end % if
        end % for
        if not(isempty(grabbedText))
            % 55 57
            currCell.text = horzcat(currCell.text, char(10.0), grabbedText);
        end % if
        currCell.RowSpan = plus(currCell.RowSpan, maxRowSpan);
    case 'r'
        % 60 64
        % 61 64
        % 62 64
        grabCol = plus(colIdx, currCell.ColSpan);
        if gt(grabCol, nCols)
            return;
        end % if
        maxColSpan = 1.0;
        for grabRow=rowIdx:minus(plus(rowIdx, currCell.RowSpan), 1.0)
            grabCell = getCurrentCell(c, grabRow, grabCol, nCols);
            % 70 72
            if gt(grabCell.RowSpan, 1.0) || gt(grabCell.ColSpan, 1.0)
                maxColSpan = max(maxColSpan, grabCell.ColSpan);
                % 73 75
                for refGrabRow=grabRow:minus(plus(grabRow, grabCell.RowSpan), 1.0)
                    for refGrabCol=grabCol:minus(plus(grabCol, grabCell.ColSpan), 1.0)
                        refGrabCell = getCurrentCell(c, refGrabRow, refGrabCol, nCols);
                        refGrabCell.SpanOrigin = currCell;
                    end % for
                end % for
                grabCell.RowSpan = 1.0;
                grabCell.ColSpan = 1.0;
            else
                grabCell.SpanOrigin = currCell;
            end % if
            % 85 88
            % 86 88
            if not(isempty(grabCell.text))
                currCell.text = horzcat(currCell.text, ' ', grabCell.text);
                grabCell.text = '';
            end % if
        end % for
        currCell.ColSpan = plus(currCell.ColSpan, maxColSpan);
        % 93 97
        % 94 97
        % 95 97
    end % switch
    % 97 99
    dlgEditor(c, 'Redraw');
    dlgEditor(c, 'CellSelect', rowIdx, colIdx);
