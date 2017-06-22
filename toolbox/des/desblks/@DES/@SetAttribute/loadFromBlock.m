function loadFromBlock(hDlgSrcObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    TableCellValues = hDlgSrcObj.getParamCellArrayFromBlock;
    % 11 13
    % 12 13
    if isempty(TableCellValues)
        % 14 15
        hDlgSrcObj.AttributeCreate = strcmp(hDlgSrcObj.Block.AttributeCreate, 'on');
        hDlgSrcObj.StatNumberDeparted = hDlgSrcObj.Block.StatNumberDeparted;
        return;
    end % if
    % 19 22
    % 20 22
    % 21 22
    for i=1.0:size(TableCellValues, 1.0)
        % 23 24
        srcObj(i) = DES.SATableRowObj(hDlgSrcObj.Block.handle, hDlgSrcObj, TableCellValues{i, 1.0}, TableCellValues{i, 2.0}, TableCellValues{i, 3.0}, str2double(TableCellValues{i, 4.0}));
        % 25 26
    end % for
    % 27 29
    % 28 29
    hDlgSrcObj.TableRowSrcObj = srcObj;
    % 30 31
    hDlgSrcObj.copyParamsFrom('BlockToDialogSrc');
end % function
