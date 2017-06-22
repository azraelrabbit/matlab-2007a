function moveMPTObjectTypeToTop(hThisObj, requestName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    warnID = 'Simulink:mpt:SLDataObjectCustomizer:moveMPTObjectTypeToTop';
    warnMsg = 'Invalid input argument for moveMPTObjectTypeToTop';
    if not(ischar(requestName))
        warning(warnID, warnMsg);
        return;
    end % if
    % 13 14
    requestName = strtrim(requestName);
    % 15 16
    if not(isvarname(requestName))
        warning(warnID, warnMsg);
        return;
    end % if
    % 20 21
    oldList = hThisObj.MPTObjectTypes;
    for i=1.0:length(oldList)
        thisName = oldList{i}.Name;
        if strcmp(thisName, requestName)
            % 25 26
            oldList = horzcat(oldList(i), oldList);
            oldList(plus(i, 1.0)) = [];
            hThisObj.MPTObjectTypes = oldList;
            return;
        end % if
    end % for
    % 32 34
    % 33 34
    msg = sprintf('''%s'' is not in registered user object type list.', requestName);
    warning(warnID, msg);
end % function
