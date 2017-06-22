function hObj = PmMechBodyCSPanel(varargin)
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
    hObj = MECH.PmMechBodyCSPanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 13 14
    if lt(nargin, 1.0)
        error(xlate('Wrong number of input arguments (need only one arguments)'));
    end % if
    % 17 18
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 23 24
    hObj.ParamName = 'WorkingFrames';
    % 25 26
end % function
