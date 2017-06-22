function removeUserPackage(hThisObj, requestName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    warnID = 'Simulink:mpt:SLDataObjectCustomizer:removeUserPackage';
    warnMsg = 'Invalid input argument for removeUserPackage.';
    % 9 10
    if not(ischar(requestName))
        warning(warnID, warnMsg);
        return;
    end % if
    % 14 15
    requestName = strtrim(requestName);
    % 16 17
    if not(isvarname(requestName))
        warning(warnID, warnMsg);
        return;
    end % if
    % 21 22
    oldList = hThisObj.UserPackageList;
    idx = find(strcmp(requestName, oldList));
    if isempty(idx)
        msg = sprintf('Package ''%s'' is not in the package list.', requestName);
        warning(warnID, msg);
    else
        try
            % 29 30
            oldList(idx) = [];
            hThisObj.UserPackageList = oldList;
        catch
            warning(warnID, lasterr);
        end % try
    end % if
end % function
