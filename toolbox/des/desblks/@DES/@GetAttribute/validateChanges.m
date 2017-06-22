function [valid, errmsg] = validateChanges(hDlgSrcObj, hdlg)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if eq(numel(hDlgSrcObj.TableRowSrcObj), 0.0)
        valid = 1.0;
        errmsg = '';
        % 16 17
        hDlgSrcObj.Block.StatNumberDeparted = hDlgSrcObj.StatNumberDeparted;
        return;
    end % if
    % 20 22
    % 21 22
    for i=0.0:minus(numel(hDlgSrcObj.TableRowSrcObj), 1.0)
        % 23 25
        % 24 25
        MissingAttributeSrcSelection = hdlg.getTableItemValue('AttributeTable', i, 1.0);
        tempStructArray1(plus(i, 1.0)) = struct('Numeric', {'AttributeTable'}, 'isValid', {'IsRealNonScalar'}, 'isTableWidget', {[1.0]}, 'isEnabled', cellhorzcat(not(strcmp(MissingAttributeSrcSelection, 'Error'))), 'ColumnHeader', {'Default value'}, 'RowHeader', {'A'}, 'Position', cellhorzcat(horzcat(i, 2.0)));
        % 27 33
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        % 32 33
        tempStructArray2(plus(i, 1.0)) = struct('UniqueCharCellArray', {'AttributeTable'}, 'isTableWidget', {[1.0]}, 'isEnabled', {[1.0]}, 'ColumnHeader', {'Attribute name'}, 'RowHeader', {'A'}, 'Position', cellhorzcat(horzcat(i, 0.0)));
        % 34 39
        % 35 39
        % 36 39
        % 37 39
        % 38 39
    end % for
    % 40 41
    MaskParamCheck{1.0} = tempStructArray1;
    MaskParamCheck{2.0} = tempStructArray2;
    % 43 46
    % 44 46
    % 45 46
    [valid, errmsg] = hDlgSrcObj.des_ddg_validateinputs(hdlg, MaskParamCheck);
    % 47 48
    if valid
        errmsg = '';
    end % if
end % function
