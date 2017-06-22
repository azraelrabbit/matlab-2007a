function isValid = internalValidateLicense(hThis, hBlock)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    [isValid, errorStruct] = nesl_checklicense(hBlock);
    if not(isValid)
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        lasterror(errorStruct);
    end % if
    % 21 22
end % function
