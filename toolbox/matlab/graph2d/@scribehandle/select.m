function select(hndl)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ud = getscribeobjectdata(hndl.HGHandle);
    MLObj = ud.ObjectStore;
    select(MLObj);
end % function
