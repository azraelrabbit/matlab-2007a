function hObj = PmNePSConvertPanel(varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hObj = NetworkEngine.PmNePSConvertPanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 13 14
    if lt(nargin, 1.0) || gt(nargin, 3.0)
        error(xlate('Wrong number of input arguments (need only one argument and max three)'));
    end % if
    % 17 18
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 23 24
    if gt(nargin, 1.0)
        hObj.ParamName = varargin{2.0};
        hObj.ConverterMode = 'in';
    end % if
    % 28 29
    if eq(nargin, 3.0)
        if not(any(strcmpi(varargin{3.0}, {'in','out'})))
            error('NetworkEngine:PmNePSConvertPanel:InvalidMode', xlate('Expecting convert mode equal to in or out.'));
            % 32 33
        end % if
        hObj.ConverterMode = varargin{3.0};
    end % if
end % function
