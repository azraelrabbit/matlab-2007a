function hObj = PmDlgBuilder(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hObj = PMDialogs.PmDlgBuilder;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 8 10
    % 9 10
    hObj.BlockHandle = 0.0;
    % 11 12
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
    % 15 16
    hObj.OnBlockSchema = '';
    hObj.PanelObjLst = [];
end % function
