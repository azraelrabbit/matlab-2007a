function delCallbacks(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tmp = handle(this.jHandle.fVarCheckBox, 'callbackproperties');
    tmp.StateChangedCallback = [];
    tmp = handle(this.jHandle.fRangeCombo, 'callbackproperties');
    tmp.ItemStateChangedCallback = [];
    if not(isempty(this.jHandle.fRangeEditBox))
        tmp = handle(this.jHandle.fRangeEditBox, 'callbackproperties');
        tmp.ActionPerformedCallback = [];
    else
        if not(isempty(this.jHandle.fRangeComboBox))
            tmp = handle(this.jHandle.fRangeComboBox, 'callbackproperties');
            tmp.ItemStateChangedCallback = [];
        end
    end
    tmp = handle(this.jHandle.fShiftLeftBtn, 'callbackproperties');
    tmp.ActionPerformedCallback = [];
    tmp = handle(this.jHandle.fShiftRightBtn, 'callbackproperties');
    tmp.ActionPerformedCallback = [];
end
