function hObj = PmLabelSpinner(varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    hObj = PMDialogs.PmLabelSpinner;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 15 16
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
    % 19 22
    % 20 22
    % 21 22
    if gt(nargin, 1.0) && ischar(varargin{2.0})
        hObj.Label = varargin{2.0};
    end % if
    % 25 28
    % 26 28
    % 27 28
    if gt(nargin, 2.0) && ischar(varargin{3.0})
        hObj.ValueBlkParam = varargin{3.0};
    end % if
    % 31 34
    % 32 34
    % 33 34
    if gt(nargin, 4.0) && ischar(varargin{4.0})
        minmaxVal = varargin{4.0};
        hObj.MinValue = minmaxVal(1.0);
        hObj.MaxValue = minmaxVal(2.0);
    end % if
end % function
