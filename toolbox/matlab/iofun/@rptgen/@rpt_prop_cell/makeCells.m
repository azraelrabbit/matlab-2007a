function result = makeCells(pCell, isSplit, propSrc, rptObj, d, colIdx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isempty(pCell.SpanOrigin))
        % 9 11
        % 10 11
        result = [];
        return;
    end % if
    % 14 15
    entryClass = 'com.mathworks.toolbox.rptgencore.docbook.CALSEntry';
    % 16 17
    cellText = pCell.parseText(isSplit, propSrc, rptObj, d);
    if isSplit
        result = javaArray(entryClass, 2.0);
        result(1.0) = javaObject(entryClass, d.Document, cellText{1.0});
        result(2.0) = javaObject(entryClass, d.Document, cellText{2.0});
        % 22 23
        result(1.0).setColsep(pCell.BorderRight);
        result(2.0).setColsep(pCell.BorderRight);
        % 25 26
        result(1.0).setRowsep(pCell.BorderLower);
        result(2.0).setRowsep(pCell.BorderLower);
        % 28 29
        switch pCell.Align
        case 'center'
            result(1.0).setAlign('right');
            result(2.0).setAlign('left');
        case 'justify'
            result(1.0).setAlign('left');
            result(2.0).setAlign('right');
        otherwise
            result(1.0).setAlign(pCell.Align);
            result(2.0).setAlign(pCell.Align);
        end % switch
        % 40 41
        if gt(pCell.RowSpan, 1.0)
            result(1.0).setMoreRows(minus(pCell.RowSpan, 1.0));
            result(2.0).setMoreRows(minus(pCell.RowSpan, 1.0));
        end % if
        % 45 46
        if gt(pCell.ColSpan, 1.0)
            % 47 48
            result(2.0).setColSpan(mtimes(colIdx, 2.0), mtimes(minus(plus(colIdx, pCell.ColSpan), 1.0), 2.0));
        end % if
    else
        % 51 52
        result = javaObject(entryClass, java(d), cellText);
        result.setRowsep(pCell.BorderLower);
        result.setColsep(pCell.BorderRight);
        result.setAlign(pCell.Align);
        % 56 57
        if gt(pCell.RowSpan, 1.0)
            result.setMoreRows(minus(pCell.RowSpan, 1.0));
        end % if
        % 60 61
        if gt(pCell.ColSpan, 1.0)
            result.setColSpan(colIdx, minus(plus(colIdx, pCell.ColSpan), 1.0));
        end % if
    end % if
end % function
