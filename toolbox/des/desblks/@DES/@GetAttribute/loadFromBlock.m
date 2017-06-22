function loadFromBlock(hDlgSrcObj)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    TableCellValues = hDlgSrcObj.getParamCellArrayFromBlock;
    % 12 14
    % 13 14
    if isempty(TableCellValues)
        % 15 16
        hDlgSrcObj.StatNumberDeparted = hDlgSrcObj.Block.StatNumberDeparted;
        return;
    end % if
    % 19 22
    % 20 22
    % 21 22
    for i=1.0:size(TableCellValues, 1.0)
        % 23 24
        srcObj(i) = DES.GATableRowObj(hDlgSrcObj.Block.handle, hDlgSrcObj, TableCellValues{i, 1.0}, TableCellValues{i, 2.0}, TableCellValues{i, 3.0}, str2double(TableCellValues{i, 4.0}), TableCellValues{i, 5.0});
        % 25 26
    end % for
    % 27 29
    % 28 29
    hDlgSrcObj.TableRowSrcObj = srcObj;
    % 30 31
    hDlgSrcObj.copyParamsFrom('BlockToDialogSrc');
end % function
