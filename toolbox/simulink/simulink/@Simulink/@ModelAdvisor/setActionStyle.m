function success = setActionStyle(this, newvalue)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    success = false;
    % 9 11
    switch newvalue
    case {'None','PerObject','PerGroup','PerCheck'}
        if gt(this.ActiveCheckID, 0.0) && strcmp(this.stage, 'ExecuteCheckCallback')
            this.CheckCellArray{this.ActiveCheckID}.ActionCallbackStyle = newvalue;
            success = true;
        else
            DAStudio.error('Simulink:tools:MACanOnlyCallWhileExecuteCheckCallback', 'setActionStyle');
        end % if
    otherwise
        DAStudio.error('Simulink:tools:MAInvalidParamsetActionStyle', newvalue);
    end % switch
