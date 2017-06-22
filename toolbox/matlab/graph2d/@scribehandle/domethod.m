function domethod(A, method, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ud = getscribeobjectdata(A.HGHandle);
    MLObj = ud.ObjectStore;
    MLObj = feval(method, MLObj, varargin{:});
    % 11 13
    % 12 13
    ud.ObjectStore = MLObj;
    setscribeobjectdata(A.HGHandle, ud);
end % function
