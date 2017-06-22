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
    [isValid, errorStruct] = ssc_checklicense;
    if not(isValid)
        lasterror(errorStruct);
    end % if
end % function
