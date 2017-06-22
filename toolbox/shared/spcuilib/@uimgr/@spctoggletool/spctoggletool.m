function h = spctoggletool(varargin)
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
        h = uimgr.spctoggletool;
    end % if
    % 17 21
    % 18 21
    % 19 21
    h.allowWidgetFcnArg = false;
    % 21 24
    % 22 24
    h.WidgetFcn = @(hThis)createSPCToggleTool(hThis);
    % 24 27
    % 25 27
    h.uibutton(varargin{:});
function hWidget = createSPCToggleTool(hThis)
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    hWidget = spcwidgets.uitoggletool(hThis.GraphicalParent, 'tag', hThis.name);
    % 35 38
    % 36 38
    if not(isempty(hThis.iconAppData))
        set(hWidget, 'Icons', uimgr.getappdata(hThis, hThis.iconAppData));
    end % if
