function hObj = DynDescriptionPanel(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hObj = PMDialogs.DynDescriptionPanel;
    hObj.CreateInstanceFcn = PMDialogs.DynCreateInstance;
    hObj.assignObjId();
    % 9 11
    % 10 11
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
    % 14 15
    hObj.DescrText = '<<BLANK>>';
    % 16 18
    % 17 18
    hObj.Need2Realize = true;
    hObj.BlockTitle = xlate('Desciption');
end % function
