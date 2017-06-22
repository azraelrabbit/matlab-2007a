function c = setObjectType(c, oType)
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
    if islogical(oType)
        c.LockType = oType;
        return;
    end % if
    % 17 19
    c.LockType = false;
    termTypes = listTerminalTypes(rptgen_sf.appdata_sf);
    for i=1.0:length(termTypes)
        set(c, horzcat('isReport', termTypes{i}), false);
    end % for
    % 23 25
    set(c, horzcat('isReport', oType), true);
    c.LockType = true;
end % function
