function hObj = PmMechJointSpringPanel(varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hObj = MECH.PmMechJointSpringPanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    hObj.WeldFoundOnBlock = false;
    % 14 15
    if lt(nargin, 1.0)
        error(xlate('Wrong number of input arguments (need only one arguments)'));
    end % if
    % 18 19
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 24 25
    hObj.ParamName = 'JFEParameters';
    if gt(nargin, 1.0)
        hObj.ParamName = varargin{2.0};
    end % if
end % function
