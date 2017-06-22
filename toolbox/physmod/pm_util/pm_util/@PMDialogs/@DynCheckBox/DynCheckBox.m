function hObj = DynCheckBox(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hObj = PMDialogs.DynCheckBox;
    hObj.assignObjId();
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.ResolveBuddyTags = false;
    hObj.MyTag = '';
    % 11 12
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
end % function
