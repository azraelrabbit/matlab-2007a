function copyParamsFrom(hDlgSrcObj, action)
    % 1 3
    % 2 3
    switch action
    case 'BlockToDialogSrc'
        % 5 6
        hDlgSrcObj.AttributeName = hDlgSrcObj.Block.AttributeName;
        hDlgSrcObj.AttributeMissing = hDlgSrcObj.Block.AttributeMissing;
        hDlgSrcObj.AttributeDefaultValue = hDlgSrcObj.Block.AttributeDefaultValue;
        hDlgSrcObj.AttributeTreatAsVector = hDlgSrcObj.Block.AttributeTreatAsVector;
        hDlgSrcObj.AttributeSendTiming = hDlgSrcObj.Block.AttributeSendTiming;
        hDlgSrcObj.StatNumberDeparted = hDlgSrcObj.Block.StatNumberDeparted;
    case 'DialogSrcToBlock'
        % 13 14
        hDlgSrcObj.Block.AttributeName = hDlgSrcObj.AttributeName;
        hDlgSrcObj.Block.AttributeMissing = hDlgSrcObj.AttributeMissing;
        hDlgSrcObj.Block.AttributeDefaultValue = hDlgSrcObj.AttributeDefaultValue;
        hDlgSrcObj.Block.AttributeTreatAsVector = hDlgSrcObj.AttributeTreatAsVector;
        hDlgSrcObj.Block.AttributeSendTiming = hDlgSrcObj.AttributeSendTiming;
        hDlgSrcObj.Block.StatNumberDeparted = hDlgSrcObj.StatNumberDeparted;
    otherwise
        error('Illegal value for action in the button callback function');
    end % switch
end % function
function boolVal = setOnOff(OnOff)
    % 25 27
    % 26 27
    switch OnOff
    case 'on'
        boolVal = 1.0;
    case 'off'
        boolVal = 0.0;
    end % switch
end % function
function OnOff = setBoolVal(boolVal)
    % 35 36
    switch boolVal
    case true
        OnOff = 'on';
    case false
        OnOff = 'off';
    end % switch
end % function
