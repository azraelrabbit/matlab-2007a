function h = spcpushtool(varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    if gt(nargin, 0.0) && isscalar(varargin{1.0}) && ishandle(varargin{1.0})
        h = varargin{1.0};
        varargin(1.0) = [];
    else
        h = uimgr.spcpushtool;
    end % if
    % 17 21
    % 18 21
    % 19 21
    h.allowWidgetFcnArg = false;
    % 21 24
    % 22 24
    h.WidgetFcn = @(hThis)createSPCPushTool(hThis);
    % 24 26
    h.StateName = 'Selection';
    % 26 30
    % 27 30
    % 28 30
    h.uiitem(varargin{:});
function hWidget = createSPCPushTool(hThis)
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    hWidget = spcwidgets.uipushtool(hThis.GraphicalParent, 'tag', hThis.name);
    % 39 42
    % 40 42
    if not(isempty(hThis.iconAppData))
        set(hWidget, 'Icons', uimgr.getappdata(hThis, hThis.iconAppData));
    end % if
