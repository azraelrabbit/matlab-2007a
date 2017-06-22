function h = uitoolbar(varargin)
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
    if gt(nargin, 0.0) && isscalar(varargin{1.0}) && ishandle(varargin{1.0})
        h = varargin{1.0};
        varargin(1.0) = [];
    else
        h = uimgr.uitoolbar;
    end % if
    % 29 33
    % 30 33
    % 31 33
    h.allowWidgetFcnArg = false;
    % 33 36
    % 34 36
    h.WidgetFcn = @(hThis)createToolbar(hThis);
    % 36 39
    % 37 39
    h.uigroup(varargin{:});
function hWidget = createToolbar(hThis)
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    hWidget = uitoolbar(hThis.GraphicalParent, 'tag', hThis.name);
