function MaskWSData = saveChangesToBlock(hDlgSrcObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    b_ud = hDlgSrcObj.Block.userdata;
    b_ud.in_blockupdate = 1.0;
    hDlgSrcObj.Block.userdata = b_ud;
    % 12 15
    % 13 15
    hDlgSrcObj.copyParamsFrom('DialogSrcToBlock');
    % 15 19
    % 16 19
    % 17 19
    b_ud = hDlgSrcObj.Block.userdata;
    b_ud.in_blockupdate = 0.0;
    hDlgSrcObj.Block.userdata = b_ud;
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    if eq(numel(hDlgSrcObj.TableRowSrcObj), 0.0)
        MaskWSData = [];
        % 27 29
        if hDlgSrcObj.AttributeCreate
            hDlgSrcObj.Block.AttributeCreate = 'on';
        else
            hDlgSrcObj.Block.AttributeCreate = 'off';
        end % if
        hDlgSrcObj.Block.StatNumberDeparted = hDlgSrcObj.StatNumberDeparted;
        return;
    end % if
    % 36 39
    % 37 39
    TableCellValues = hDlgSrcObj.getParamCellArrayFromBlock;
    % 39 42
    % 40 42
    AttributeSrcColumn = TableCellValues(:, 2.0);
    AttributeValueColumn = TableCellValues(:, 3.0);
    x = strfind(AttributeSrcColumn, 'Signal port');
    emptyIdx = find(not(cellfun(@isempty, x)));
    AttributeValueColumn(emptyIdx) = {'[]'};
    TableCellValues(:, 3.0) = AttributeValueColumn;
    % 47 50
    % 48 50
    values = TableCellValues(:, 3.0:4.0);
    tempws_cell = cellstr(repmat('base', horzcat(size(values, 1.0), 1.0)));
    ws_cell = repmat(tempws_cell, horzcat(1.0, size(values, 2.0)));
    evaluatedStrings = cellfun(@evalin, ws_cell, values, 'UniformOutput', false);
    % 53 56
    % 54 56
    TableCellValues(:, 3.0:4.0) = evaluatedStrings;
    Fields = {'AttributeName','AttributeFrom','AttributeValue','AttributeTreatAsVector'};
    MaskWSData = cell2struct(TableCellValues, Fields, 2.0);
end % function
