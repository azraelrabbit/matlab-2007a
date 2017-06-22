function hObj = RunTimeModule
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hObj = singleton;
    % 12 13
    if not(isempty(hObj))
    else
        % 15 16
        hObj = SSC.RunTimeModule;
        hObj.objectDate = datestr(now);
        singleton(hObj);
    end % if
    % 20 21
    if doDebug
        munlock
    else
        mlock
    end % if
end % function
