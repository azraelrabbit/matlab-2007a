function doselect(hndl, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    ud = getscribeobjectdata(hndl.HGHandle);
    MLObj = ud.ObjectStore;
    MLObj = doselect(MLObj, varargin{:});
    % 10 12
    % 11 12
    ud.ObjectStore = MLObj;
    setscribeobjectdata(hndl.HGHandle, ud);
end % function
