function hObj = PmMechJointPrimSel(varargin)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    hObj = MECH.PmMechJointPrimSel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 23 24
    if ne(nargin, 0.0) && ne(nargin, 4.0) && ne(nargin, 5.0)
        error(xlate('Wrong number of input arguments (need 0,4 or 5 arguments)'));
    end % if
    % 27 28
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 33 34
    hObj.Label = varargin{2.0};
    hObj.BlkParamName = varargin{3.0};
    % 36 37
    if ge(nargin, 4.0)
        hObj.LabelAttrb = int32(varargin{4.0});
    else
        hObj.LabelAttrb = 0.0;
    end % if
    % 42 43
    if ge(nargin, 5.0)
        hObj.WatchPort = varargin{5.0};
    else
        hObj.WatchPort = '';
    end % if
    % 48 49
    choices = cellhorzcat(xlate('None'));
    % 50 51
    hCombo = PMDialogs.PmDropDown(hObj.BlockHandle, hObj.Label, hObj.BlkParamName, choices, hObj.LabelAttrb);
    hObj.Items = hCombo;
end % function
