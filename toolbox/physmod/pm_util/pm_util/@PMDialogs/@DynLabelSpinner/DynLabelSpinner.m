function hObj = DynLabelSpinner(varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    hObj = PMDialogs.DynLabelSpinner;
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.assignObjId();
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
end % function
