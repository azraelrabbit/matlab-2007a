function moveUserPackageToTop(hThisObj, requestName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    warnID = 'Simulink:mpt:SLDataObjectCustomizer:moveUserPackageToTop';
    warnMsg = 'Invalid input argument for moveUserPackageToTop';
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
    % 23 24
    idx = find(strcmp(oldList, requestName));
    if isempty(idx)
        msg = sprintf('Package ''%s'' is not in the package list', requestName);
        warning(warnID, msg);
    else
        % 29 30
        oldList(idx) = [];
        hThisObj.UserPackageList = horzcat(cellhorzcat(requestName), oldList);
    end % if
end % function
