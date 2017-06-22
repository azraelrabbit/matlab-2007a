function h = uibuttongroup(varargin)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if gt(nargin, 0.0) && isscalar(varargin{1.0}) && ishandle(varargin{1.0})
        h = varargin{1.0};
        varargin(1.0) = [];
    else
        h = uimgr.uibuttongroup;
    end % if
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    h.allowWidgetFcnArg = false;
    % 31 33
    % 32 33
    h.uigroup(varargin{:});
end % function
