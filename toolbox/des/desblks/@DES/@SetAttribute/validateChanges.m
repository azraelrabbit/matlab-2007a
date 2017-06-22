function [valid, errmsg] = validateChanges(hDlgSrcObj, hdlg)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if eq(numel(hDlgSrcObj.TableRowSrcObj), 0.0)
        valid = 1.0;
        errmsg = '';
        % 15 16
        if hDlgSrcObj.AttributeCreate
            hDlgSrcObj.Block.AttributeCreate = 'on';
        else
            hDlgSrcObj.Block.AttributeCreate = 'off';
        end % if
        hDlgSrcObj.Block.StatNumberDeparted = hDlgSrcObj.StatNumberDeparted;
        return;
    end % if
    for i=0.0:minus(numel(hDlgSrcObj.TableRowSrcObj), 1.0)
        % 25 27
        % 26 27
        AttributeSrcSelection = hdlg.getTableItemValue('AttributeTable', i, 1.0);
        tempStructArray1(plus(i, 1.0)) = struct('Numeric', {'AttributeTable'}, 'isValid', {'IsRealNonScalar'}, 'isTableWidget', {[1.0]}, 'isEnabled', cellhorzcat(strcmp(AttributeSrcSelection, 'Dialog')), 'ColumnHeader', {'Attribute value'}, 'RowHeader', {'A'}, 'Position', cellhorzcat(horzcat(i, 2.0)));
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        % 34 35
        tempStructArray2(plus(i, 1.0)) = struct('UniqueCharCellArray', {'AttributeTable'}, 'isTableWidget', {[1.0]}, 'isEnabled', {[1.0]}, 'ColumnHeader', {'Attribute name'}, 'RowHeader', {'A'}, 'Position', cellhorzcat(horzcat(i, 0.0)));
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        % 40 41
    end % for
    % 42 43
    MaskParamCheck{1.0} = tempStructArray1;
    MaskParamCheck{2.0} = tempStructArray2;
    % 45 48
    % 46 48
    % 47 48
    [valid, errmsg] = hDlgSrcObj.des_ddg_validateinputs(hdlg, MaskParamCheck);
    % 49 50
    if valid
        errmsg = '';
    end % if
end % function
