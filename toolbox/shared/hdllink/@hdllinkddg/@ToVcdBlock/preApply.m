function [status, errMsg] = preApply(this, dialog)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    status = true;
    errMsg = '';
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if status
        [status, errMsg] = this.preApplyCallback(dialog);
    end % if
end % function
