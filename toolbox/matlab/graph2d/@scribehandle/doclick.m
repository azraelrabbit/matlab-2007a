function doclick(hndl)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ud = getscribeobjectdata(hndl.HGHandle);
    MLObj = ud.ObjectStore;
    MLObj = doclick(MLObj);
    % 11 14
    % 12 14
    % 13 14
    if any(ishandle(hndl.HGHandle))
        ud.ObjectStore = MLObj;
        setscribeobjectdata(hndl.HGHandle, ud);
    end % if
end % function
