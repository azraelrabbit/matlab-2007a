function hObj = PmCheckBox(varargin)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    hObj = PMDialogs.PmCheckBox;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 21 22
    if lt(nargin, 3.0) || gt(nargin, 5.0)
        error(xlate('Wrong number of input arguments (need 3 or 5 arguments)'));
    end % if
    % 25 26
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 31 34
    % 32 34
    % 33 34
    hObj.Label = varargin{2.0};
    hObj.ValueBlkParam = varargin{3.0};
    hObj.LabelAttrb = 0.0;
    hObj.Value = 0.0;
    % 38 39
    if gt(nargin, 3.0) && isnumeric(varargin{4.0}) && ge(varargin{4.0}, 0.0) && lt(varargin{4.0}, 4.0)
        hObj.LabelAttrb = int32(varargin{4.0});
    end % if
    % 42 43
    if gt(nargin, 4.0)
        hObj.Value = varargin{5.0};
    end % if
end % function
