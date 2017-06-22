function success = setCheckResult(this, newvalue)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    success = false;
    if gt(this.ActiveCheckID, 0.0) && strcmp(this.stage, 'ExecuteCheckCallback')
        this.CheckCellArray{this.ActiveCheckID}.Result = newvalue;
        success = true;
    else
        error('setCheckResult method can only be called while executing check callback.');
    end % if
end % function
