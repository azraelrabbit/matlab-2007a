function hObj = PmCheckUnit(varargin)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    hObj = PMDialogs.PmCheckUnit;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 27 28
    if ne(nargin, 0.0) && ne(nargin, 9.0)
        error(xlate('Wrong number of input arguments (need 0 or 9 arguments)'));
    end % if
    % 31 32
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 37 38
    hObj.Label = varargin{2.0};
    hObj.LabelAttrb = int32(varargin{3.0});
    chkBoxLabel = varargin{4.0};
    chkBoxParamName = varargin{5.0};
    unitLabel = varargin{6.0};
    unitParamName = varargin{7.0};
    unitHideName = varargin{8.0};
    unitDefault = varargin{9.0};
    % 46 47
    hPosEdit = PMDialogs.PmCheckBox(hObj.BlockHandle, chkBoxLabel, chkBoxParamName, 0.0);
    hUnitsSel = PMDialogs.PmUnitSelect(hObj.BlockHandle, unitLabel, unitParamName, 0.0, unitDefault, unitHideName);
    % 49 51
    % 50 51
    hObj.Items = horzcat(hPosEdit, hUnitsSel);
end % function
