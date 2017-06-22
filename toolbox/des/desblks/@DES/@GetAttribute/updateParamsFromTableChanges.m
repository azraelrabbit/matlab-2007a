function updateParamsFromTableChanges(hDlgSrcObj, RowSrcObj, RowNumber, action)
    % 1 3
    % 2 3
    switch action
    case 'rowModified'
        hDlgSrcObj.AttributeName = des_set_pipestr(hDlgSrcObj.AttributeName, RowNumber, RowSrcObj.SrcAttributeName);
        hDlgSrcObj.AttributeMissing = des_set_pipestr(hDlgSrcObj.AttributeMissing, RowNumber, RowSrcObj.SrcAttributeMissing);
        hDlgSrcObj.AttributeDefaultValue = des_set_pipestr(hDlgSrcObj.AttributeDefaultValue, RowNumber, RowSrcObj.SrcAttributeDefaultValue);
        hDlgSrcObj.AttributeTreatAsVector = des_set_pipestr(hDlgSrcObj.AttributeTreatAsVector, RowNumber, num2str(RowSrcObj.SrcAttributeTreatAsVector));
        hDlgSrcObj.AttributeSendTiming = des_set_pipestr(hDlgSrcObj.AttributeSendTiming, RowNumber, RowSrcObj.SrcAttributeSendTiming);
    case 'rowRemoved'
        hDlgSrcObj.AttributeName = des_remove_pipestr(hDlgSrcObj.AttributeName, RowNumber);
        hDlgSrcObj.AttributeMissing = des_remove_pipestr(hDlgSrcObj.AttributeMissing, RowNumber);
        hDlgSrcObj.AttributeDefaultValue = des_remove_pipestr(hDlgSrcObj.AttributeDefaultValue, RowNumber);
        hDlgSrcObj.AttributeTreatAsVector = des_remove_pipestr(hDlgSrcObj.AttributeTreatAsVector, RowNumber);
        hDlgSrcObj.AttributeSendTiming = des_remove_pipestr(hDlgSrcObj.AttributeSendTiming, RowNumber);
    otherwise
        error('Illegal value for action in the button callback function');
    end % switch
end % function
