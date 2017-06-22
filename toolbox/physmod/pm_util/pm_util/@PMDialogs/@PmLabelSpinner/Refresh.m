function retStatus = Refresh(hThis)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    retStatus = true;
    % 10 11
    try
        % 12 13
        hThis.setEnableStatus();
    catch
        retStatus = false;
    end % try
    % 17 18
end % function
