function hObj = DynMechJointPrimitivePanel(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hObj = MECH.DynMechJointPrimitivePanel;
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.assignObjId();
    hObj.FocusItem = [0.0 0.0];
    hObj.DummyProp = xlate('N/A');
    % 12 13
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
end % function
