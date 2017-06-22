function success = setCheckResultData(this, newvalue)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    success = false;
    % 10 11
    if gt(this.ActiveCheckID, 0.0) && strcmp(this.stage, 'ExecuteCheckCallback')
        this.CheckCellArray{this.ActiveCheckID}.ResultData = newvalue;
        success = true;
    else
        error('setCheckResultData method can only be called while executing check callback.');
    end % if
end % function
