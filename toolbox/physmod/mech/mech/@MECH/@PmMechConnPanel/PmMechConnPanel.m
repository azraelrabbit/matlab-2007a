function hObj = PmMechConnPanel(varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hObj = MECH.PmMechConnPanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    hObj.NumPortsParam = 'HIDE_SPINNER';
    hObj.PortSpinnerLabel = '';
    % 16 17
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
    % 20 23
    % 21 23
    % 22 23
    if gt(nargin, 1.0) && ischar(varargin{2.0})
        hObj.NumPortsParam = varargin{2.0};
    end % if
    % 26 29
    % 27 29
    % 28 29
    if gt(nargin, 2.0) && ischar(varargin{3.0})
        hObj.PortSpinnerLabel = varargin{3.0};
    end % if
    % 32 34
    % 33 34
    if gt(nargin, 4.0) && ischar(varargin{4.0}) && ischar(varargin{5.0})
        hObj.BaseLabel = varargin{4.0};
        hObj.FollowerLabel = varargin{5.0};
    else
        hObj.BaseLabel = xlate('Current base:');
        hObj.FollowerLabel = xlate('Current follower:');
    end % if
end % function
