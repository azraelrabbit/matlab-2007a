function notify(hndl, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ud = getscribeobjectdata(hndl.HGHandle);
    MLObj = ud.ObjectStore;
    MLObj = notify(MLObj, varargin{:});
    % 12 13
    ud.ObjectStore = MLObj;
    setscribeobjectdata(hndl.HGHandle, ud);
end % function
