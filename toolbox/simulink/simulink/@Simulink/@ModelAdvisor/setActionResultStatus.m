function success = setActionResultStatus(this, newvalue)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    success = false;
    if gt(this.ActiveCheckID, 0.0) && strcmp(this.stage, 'ExecuteActionCallback')
        this.CheckCellArray{this.ActiveCheckID}.ActionSuccess = newvalue;
        success = true;
    else
        DAStudio.error('Simulink:tools:MACanOnlyCallWhileExecuteActionCallback', 'setActionResultStatus');
    end % if
end % function
