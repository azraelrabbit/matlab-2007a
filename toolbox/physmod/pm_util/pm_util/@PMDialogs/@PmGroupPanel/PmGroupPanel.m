function hObj = PmGroupPanel(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hObj = PMDialogs.PmGroupPanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 9 10
    hObj.BlockHandle = 0.0;
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
    % 14 15
    hObj.Label = '';
    if gt(nargin, 1.0) && ischar(varargin{2.0})
        hObj.Label = varargin{2.0};
    end % if
    % 19 20
    hObj.Style = 'Box';
    if gt(nargin, 2.0) && ischar(varargin{3.0})
        hObj.Style = varargin{3.0};
    end % if
    % 24 25
    hObj.StdLayoutCfg = 'Unset';
    if gt(nargin, 3.0) && ischar(varargin{4.0})
        hObj.StdLayoutCfg = varargin{4.0};
    end % if
    % 29 30
end % function
