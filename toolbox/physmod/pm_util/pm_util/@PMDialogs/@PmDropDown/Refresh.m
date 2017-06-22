function retStatus = Refresh(hThis)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    retStatus = true;
    % 11 12
    try
        % 13 14
        hThis.setEnableStatus();
    catch
        retStatus = false;
    end % try
    % 18 19
end % function
