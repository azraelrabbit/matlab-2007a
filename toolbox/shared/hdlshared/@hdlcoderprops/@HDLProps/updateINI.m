function [success, err] = updateINI(hCS)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    [success, err] = updateINI(hCS.CLI, hCS.INI);
    % 15 17
    % 16 17
    if eq(nargout, 0.0) && not(success)
        error(err);
    end % if
end % function
