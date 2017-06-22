function hObj = DynMechJointSpringPanel(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hObj = MECH.DynMechJointSpringPanel;
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.assignObjId();
    hObj.DummyProp = xlate('N/A');
    % 10 11
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
end % function
