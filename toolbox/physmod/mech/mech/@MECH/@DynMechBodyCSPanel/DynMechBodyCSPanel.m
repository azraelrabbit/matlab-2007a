function hObj = DynMechBodyCSPanel(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hObj = MECH.DynMechBodyCSPanel;
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.assignObjId();
    hObj.FocusItem = [0.0 0.0];
    hObj.FocusTab = 0.0;
    hObj.nPortsShown = 0.0;
    % 13 14
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
end % function
