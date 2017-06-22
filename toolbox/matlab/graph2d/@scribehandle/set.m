function set(hndl, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ud = getscribeobjectdata(hndl.HGHandle);
    % 10 12
    % 11 12
    MyObject = set(ud.ObjectStore, varargin{:});
    ud.ObjectStore = MyObject;
    % 14 16
    % 15 16
    setscribeobjectdata(hndl.HGHandle, ud);
end % function
