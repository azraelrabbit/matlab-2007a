function updateParamsFromTableChanges(hDlgSrcObj, RowSrcObj, RowNumber, action)
    % 1 3
    % 2 3
    switch action
    case 'rowModified'
        hDlgSrcObj.AttributeName = des_set_pipestr(hDlgSrcObj.AttributeName, RowNumber, RowSrcObj.SrcAttributeName);
        hDlgSrcObj.AttributeFrom = des_set_pipestr(hDlgSrcObj.AttributeFrom, RowNumber, RowSrcObj.SrcAttributeFrom);
        hDlgSrcObj.AttributeValue = des_set_pipestr(hDlgSrcObj.AttributeValue, RowNumber, RowSrcObj.SrcAttributeValue);
        hDlgSrcObj.AttributeTreatAsVector = des_set_pipestr(hDlgSrcObj.AttributeTreatAsVector, RowNumber, num2str(RowSrcObj.SrcAttributeTreatAsVector));
    case 'rowRemoved'
        hDlgSrcObj.AttributeName = des_remove_pipestr(hDlgSrcObj.AttributeName, RowNumber);
        hDlgSrcObj.AttributeFrom = des_remove_pipestr(hDlgSrcObj.AttributeFrom, RowNumber);
        hDlgSrcObj.AttributeValue = des_remove_pipestr(hDlgSrcObj.AttributeValue, RowNumber);
        hDlgSrcObj.AttributeTreatAsVector = des_remove_pipestr(hDlgSrcObj.AttributeTreatAsVector, RowNumber);
    otherwise
        error('Illegal value for action in the button callback function');
    end % switch
end % function
