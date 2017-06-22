function hObj = DynEditUnit(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hObj = PMDialogs.DynEditUnit;
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.assignObjId();
    % 10 11
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
end % function
