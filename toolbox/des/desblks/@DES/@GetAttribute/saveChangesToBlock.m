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
    % 15 17
    b_ud = hDlgSrcObj.Block.userdata;
    b_ud.in_blockupdate = 0.0;
    hDlgSrcObj.Block.userdata = b_ud;
    % 19 21
    if eq(numel(hDlgSrcObj.TableRowSrcObj), 0.0)
        MaskWSData = [];
        return;
    end % if
    % 24 26
    TableCellValues = hDlgSrcObj.getParamCellArrayFromBlock;
    % 26 29
    % 27 29
    AttributeSrcColumn = TableCellValues(:, 2.0);
    AttributeValueColumn = TableCellValues(:, 3.0);
    x = strfind(AttributeSrcColumn, 'Error');
    emptyIdx = find(not(cellfun(@isempty, x)));
    AttributeValueColumn(emptyIdx) = {'[]'};
    TableCellValues(:, 3.0) = AttributeValueColumn;
    % 34 37
    % 35 37
    values = TableCellValues(:, 3.0:4.0);
    tempws_cell = cellstr(repmat('base', horzcat(size(values, 1.0), 1.0)));
    ws_cell = repmat(tempws_cell, horzcat(1.0, size(values, 2.0)));
    evaluatedStrings = cellfun(@evalin, ws_cell, values, 'UniformOutput', false);
    % 40 42
    TableCellValues(:, 3.0:4.0) = evaluatedStrings;
    Fields = {'AttributeName','AttributeMissing','AttributeDefaultValue','AttributeTreatAsVector','AttributeSendTiming'};
    MaskWSData = cell2struct(TableCellValues, Fields, 2.0);
end % function
