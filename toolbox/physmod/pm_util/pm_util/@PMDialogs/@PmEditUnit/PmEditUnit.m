function hObj = PmEditUnit(varargin)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    hObj = PMDialogs.PmEditUnit;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 26 27
    if ne(nargin, 0.0) && ne(nargin, 8.0)
        error(xlate('Wrong number of input arguments (need 0 or 8 arguments)'));
    end % if
    % 30 31
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 36 37
    hObj.Label = varargin{2.0};
    hObj.LabelAttrb = int32(varargin{3.0});
    eBoxLabel = varargin{4.0};
    eBoxParamName = varargin{5.0};
    unitLabel = varargin{6.0};
    unitParamName = varargin{7.0};
    unitDefault = varargin{8.0};
    % 44 45
    hPosEdit = PMDialogs.PmEditBox(hObj.BlockHandle, eBoxLabel, eBoxParamName, 0.0);
    hUnitsSel = PMDialogs.PmUnitSelect(hObj.BlockHandle, unitLabel, unitParamName, 0.0, unitDefault);
    % 47 48
    hObj.Items = horzcat(hPosEdit, hUnitsSel);
end % function
