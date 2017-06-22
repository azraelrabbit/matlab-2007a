function copyParamsFrom(hDlgSrcObj, action)
    % 1 3
    % 2 3
    switch action
    case 'BlockToDialogSrc'
        % 5 6
        hDlgSrcObj.AttributeName = hDlgSrcObj.Block.AttributeName;
        hDlgSrcObj.AttributeFrom = hDlgSrcObj.Block.AttributeFrom;
        hDlgSrcObj.AttributeTreatAsVector = hDlgSrcObj.Block.AttributeTreatAsVector;
        hDlgSrcObj.AttributeValue = hDlgSrcObj.Block.AttributeValue;
        hDlgSrcObj.AttributeCreate = setOnOff(hDlgSrcObj.Block.AttributeCreate);
        hDlgSrcObj.StatNumberDeparted = hDlgSrcObj.Block.StatNumberDeparted;
    case 'DialogSrcToBlock'
        hDlgSrcObj.Block.AttributeName = hDlgSrcObj.AttributeName;
        hDlgSrcObj.Block.AttributeFrom = hDlgSrcObj.AttributeFrom;
        hDlgSrcObj.Block.AttributeTreatAsVector = hDlgSrcObj.AttributeTreatAsVector;
        hDlgSrcObj.Block.AttributeValue = hDlgSrcObj.AttributeValue;
        hDlgSrcObj.Block.AttributeCreate = setBoolVal(hDlgSrcObj.AttributeCreate);
        hDlgSrcObj.Block.StatNumberDeparted = hDlgSrcObj.StatNumberDeparted;
    otherwise
        error('Illegal value for action in the button callback function');
    end % switch
end % function
function boolVal = setOnOff(OnOff)
    % 24 26
    % 25 26
    switch OnOff
    case 'on'
        boolVal = 1.0;
    case 'off'
        boolVal = 0.0;
    end % switch
end % function
function OnOff = setBoolVal(boolVal)
    % 34 35
    switch boolVal
    case true
        OnOff = 'on';
    case false
        OnOff = 'off';
    end % switch
end % function
