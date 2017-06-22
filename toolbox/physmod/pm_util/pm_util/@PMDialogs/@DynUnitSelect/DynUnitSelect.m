function hObj = DynUnitSelect(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hObj = PMDialogs.DynUnitSelect;
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.assignObjId();
    % 9 10
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
end % function
