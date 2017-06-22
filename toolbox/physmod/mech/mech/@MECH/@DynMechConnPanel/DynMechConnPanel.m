function hObj = DynMechConnPanel(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hObj = MECH.DynMechConnPanel;
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.assignObjId();
    % 10 11
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
    % 14 15
    hObj.mSpinner = PMDialogs.DynLabelSpinner(hObj.BlockHandle);
end % function
