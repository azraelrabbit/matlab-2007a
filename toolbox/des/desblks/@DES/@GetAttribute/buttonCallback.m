function buttonCallback(hDlgSrcObj, hDlg, action)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tempsrcObj = hDlgSrcObj.TableRowSrcObj;
    % 7 9
    switch action
    case 'addNewEntry'
        newsrcObj = DES.GATableRowObj(hDlgSrcObj.Block.handle, hDlgSrcObj);
        % 11 13
        tempsrcObj = vertcat(tempsrcObj, newsrcObj);
        RowNumber = numel(tempsrcObj);
        RowSrcObj = tempsrcObj(RowNumber);
        % 15 17
        hDlgSrcObj.updateParamsFromTableChanges(RowSrcObj, RowNumber, 'rowModified');
        % 17 19
        currentRowNumber = RowNumber;
    case 'removeSelectedEntry'
        % 20 22
        if isempty(tempsrcObj)
            return;
        end % if
        % 24 26
        if eq(length(tempsrcObj), 1.0)
            % 26 29
            % 27 29
            tempsrcObj = [];
            setAllParamsToEmpty(hDlgSrcObj);
            currentRowNumber = 1.0;
        else
            % 32 34
            RemoveRowNumber = plus(hDlgSrcObj.SelectedTableRow, 1.0);
            % 34 36
            if gt(RemoveRowNumber, 1.0)
                % 36 38
                delete(tempsrcObj(RemoveRowNumber));
                tempsrcObj = vertcat(tempsrcObj(1.0:minus(RemoveRowNumber, 1.0)), tempsrcObj(plus(RemoveRowNumber, 1.0):end));
                currentRowNumber = minus(RemoveRowNumber, 1.0);
            else
                % 41 43
                delete(tempsrcObj(1.0));
                tempsrcObj = tempsrcObj(plus(RemoveRowNumber, 1.0):end);
                currentRowNumber = 1.0;
            end % if
            RowSrcObj = 0.0;
            hDlgSrcObj.updateParamsFromTableChanges(RowSrcObj, RemoveRowNumber, 'rowRemoved');
        end % if
    case 'copySelectedEntry'
        % 50 52
        if isempty(tempsrcObj)
            return;
        end % if
        % 54 57
        % 55 57
        CopyRowNumber = plus(hDlgSrcObj.SelectedTableRow, 1.0);
        % 57 60
        % 58 60
        copyRowSrcObj = tempsrcObj(CopyRowNumber);
        copiedRowSrcObj = DES.GATableRowObj(hDlgSrcObj.Block.handle, hDlgSrcObj, copyRowSrcObj);
        % 61 64
        % 62 64
        tempsrcObj = vertcat(tempsrcObj, copiedRowSrcObj);
        RowNumber = numel(tempsrcObj);
        RowSrcObj = tempsrcObj(RowNumber);
        % 66 68
        hDlgSrcObj.updateParamsFromTableChanges(RowSrcObj, RowNumber, 'rowModified');
        % 68 70
        currentRowNumber = RowNumber;
    otherwise
        error('Illegal value for action in the button callback function');
    end % switch
    % 73 75
    hDlgSrcObj.SelectedTableRow = minus(currentRowNumber, 1.0);
    hDlgSrcObj.TableRowSrcObj = tempsrcObj;
    hDlg.enableApplyButton(true);
function setAllParamsToEmpty(hDlgSrcObj)
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    hDlgSrcObj.AttributeName = '';
    hDlgSrcObj.AttributeMissing = '';
    hDlgSrcObj.AttributeDefaultValue = '';
    hDlgSrcObj.AttributeTreatAsVector = '';
    hDlgSrcObj.AttributeSendTiming = '';
