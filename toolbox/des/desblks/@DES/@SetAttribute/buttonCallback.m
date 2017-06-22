function buttonCallback(hDlgSrcObj, hDlg, action)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    tempsrcObj = hDlgSrcObj.TableRowSrcObj;
    % 8 10
    switch action
    case 'addNewEntry'
        newsrcObj = DES.SATableRowObj(hDlgSrcObj.Block.handle, hDlgSrcObj);
        % 12 14
        tempsrcObj = vertcat(tempsrcObj, newsrcObj);
        RowNumber = numel(tempsrcObj);
        RowSrcObj = tempsrcObj(RowNumber);
        % 16 18
        hDlgSrcObj.updateParamsFromTableChanges(RowSrcObj, RowNumber, 'rowModified');
        % 18 20
        currentRowNumber = RowNumber;
    case 'removeSelectedEntry'
        % 21 23
        if isempty(tempsrcObj)
            return;
        end % if
        % 25 27
        if eq(length(tempsrcObj), 1.0)
            % 27 30
            % 28 30
            tempsrcObj = [];
            setAllParamsToEmpty(hDlgSrcObj);
            currentRowNumber = 1.0;
        else
            % 33 35
            RemoveRowNumber = plus(hDlgSrcObj.SelectedTableRow, 1.0);
            % 35 37
            if gt(RemoveRowNumber, 1.0)
                % 37 39
                delete(tempsrcObj(RemoveRowNumber));
                tempsrcObj = vertcat(tempsrcObj(1.0:minus(RemoveRowNumber, 1.0)), tempsrcObj(plus(RemoveRowNumber, 1.0):end));
                currentRowNumber = minus(RemoveRowNumber, 1.0);
            else
                % 42 44
                delete(tempsrcObj(1.0));
                tempsrcObj = tempsrcObj(plus(RemoveRowNumber, 1.0):end);
                currentRowNumber = 1.0;
            end % if
            RowSrcObj = 0.0;
            hDlgSrcObj.updateParamsFromTableChanges(RowSrcObj, RemoveRowNumber, 'rowRemoved');
        end % if
    case 'copySelectedEntry'
        % 51 53
        if isempty(tempsrcObj)
            return;
        end % if
        % 55 58
        % 56 58
        CopyRowNumber = plus(hDlgSrcObj.SelectedTableRow, 1.0);
        % 58 61
        % 59 61
        copyRowSrcObj = tempsrcObj(CopyRowNumber);
        copiedRowSrcObj = DES.SATableRowObj(hDlgSrcObj.Block.handle, hDlgSrcObj, copyRowSrcObj);
        % 62 65
        % 63 65
        tempsrcObj = vertcat(tempsrcObj, copiedRowSrcObj);
        RowNumber = numel(tempsrcObj);
        RowSrcObj = tempsrcObj(RowNumber);
        % 67 69
        hDlgSrcObj.updateParamsFromTableChanges(RowSrcObj, RowNumber, 'rowModified');
        % 69 71
        currentRowNumber = RowNumber;
    otherwise
        error('Illegal value for action in the button callback function');
    end % switch
    % 74 76
    hDlgSrcObj.SelectedTableRow = minus(currentRowNumber, 1.0);
    hDlgSrcObj.TableRowSrcObj = tempsrcObj;
    hDlg.enableApplyButton(true);
function setAllParamsToEmpty(hDlgSrcObj)
    % 79 83
    % 80 83
    % 81 83
    hDlgSrcObj.AttributeName = '';
    hDlgSrcObj.AttributeFrom = '';
    hDlgSrcObj.AttributeValue = '';
    hDlgSrcObj.AttributeTreatAsVector = '';
