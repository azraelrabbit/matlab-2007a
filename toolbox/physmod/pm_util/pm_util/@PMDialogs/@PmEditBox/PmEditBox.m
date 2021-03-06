function hObj = PmEditBox(varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    hObj = PMDialogs.PmEditBox;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 20 21
    if lt(nargin, 3.0) || gt(nargin, 5.0)
        error(xlate('Wrong number of input arguments (need 3 or 5 arguments)'));
    end % if
    % 24 25
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 30 33
    % 31 33
    % 32 33
    hObj.Label = varargin{2.0};
    hObj.ValueBlkParam = varargin{3.0};
    hObj.LabelAttrb = 0.0;
    hObj.Value = '';
    % 37 38
    if gt(nargin, 3.0) && isnumeric(varargin{4.0}) && ge(varargin{4.0}, 0.0) && lt(varargin{4.0}, 4.0)
        hObj.LabelAttrb = int32(varargin{4.0});
    end % if
    % 41 42
    if gt(nargin, 4.0)
        hObj.Value = varargin{5.0};
    end % if
end % function
