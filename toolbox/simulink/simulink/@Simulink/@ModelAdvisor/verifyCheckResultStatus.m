function [success, message] = verifyCheckResultStatus(this, successArray, checkArray)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    success = false;
    message = '';
    % 9 10
    checkStatusArray = this.getCheckResultStatus(checkArray);
    % 11 12
    if ne(length(checkStatusArray), length(successArray))
        success = false;
        message = 'The length of checks mismatch with the length of passed in check result status.';
        return;
    end % if
    % 17 18
    for i=1.0:length(checkStatusArray)
        if ne(successArray{i}, checkStatusArray{i})
            success = false;
            message = horzcat('The result staus of check: ', checkArray{i}, ' mismatch.');
            return;
        end % if
    end % for
    % 25 26
    success = true;
    message = '';
end % function
