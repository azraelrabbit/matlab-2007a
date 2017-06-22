function hObj = PmUnitSelect(varargin)
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
    hObj = PMDialogs.PmUnitSelect;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 23 24
    if ne(nargin, 5.0) && ne(nargin, 6.0) && ne(nargin, 7.0)
        error(xlate('Wrong number of input arguments (need 5, 6 or 7 arguments)'));
    end % if
    % 27 28
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 33 36
    % 34 36
    % 35 36
    hObj.Label = varargin{2.0};
    hObj.ValueBlkParam = varargin{3.0};
    hObj.LabelAttrb = 0.0;
    if isnumeric(varargin{4.0}) && ge(varargin{4.0}, 0.0) && lt(varargin{4.0}, 4.0)
        hObj.LabelAttrb = int32(varargin{4.0});
    end % if
    hObj.UnitDefault = varargin{5.0};
    % 43 44
    hObj.HideName = true;
    if gt(nargin, 5.0)
        hObj.HideName = varargin{6.0};
    end % if
    % 48 49
    hObj.Value = '';
    if gt(nargin, 6.0)
        hObj.Value = varargin{7.0};
    end % if
end % function
