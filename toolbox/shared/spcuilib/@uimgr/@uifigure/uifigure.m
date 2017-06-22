function h = uifigure(varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if gt(nargin, 0.0) && isscalar(varargin{1.0}) && not(isnumeric(varargin{1.0})) && ishandle(varargin{1.0})
        % 16 19
        % 17 19
        h = varargin{1.0};
        varargin(1.0) = [];
    else
        h = uimgr.uifigure;
    end % if
    % 23 26
    % 24 26
    h.allowWidgetFcnArg = false;
    % 26 29
    % 27 29
    h.WidgetFcn = @(h)createFigure(h);
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    h.GraphicalParent = 0.0;
    % 34 37
    % 35 37
    h.uigroup(varargin{:});
function hWidget = createFigure(h)
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    hWidget = figure('parent', h.GraphicalParent, 'tag', h.name, 'numbertitle', 'off', 'menubar', 'none', 'name', h.name);
    % 47 58
    % 48 58
    % 49 58
    % 50 58
    % 51 58
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    hMainFlow = uiflowcontainer('parent', hWidget, 'flowdirection', 'bottomup', 'margin', 2.0);
    % 58 72
    % 59 72
    % 60 72
    % 61 72
    % 62 72
    % 63 72
    % 64 72
    % 65 72
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    hStatusParent = uicontainer('parent', hMainFlow);
    hg_pkg = findpackage('hg');
    findclass(hg_pkg, 'uicontainer');
    schema.prop(h, 'hStatusParent', 'hg.uicontainer');
    h.hStatusParent = hStatusParent;
    set(hStatusParent, 'HeightLimits', [0.0 0.0]);
    % 77 80
    % 78 80
    hVisParent = uicontainer('parent', hMainFlow);
    schema.prop(h, 'hVisParent', 'hg.uicontainer');
    h.hVisParent = hVisParent;
