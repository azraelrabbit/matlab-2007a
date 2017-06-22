function h = spcmagcombobox(varargin)
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
        h = uimgr.spcmagcombobox;
    end % if
    % 17 21
    % 18 21
    % 19 21
    h.allowWidgetFcnArg = false;
    % 21 24
    % 22 24
    h.WidgetFcn = @(hThis)createMagCombo(hThis);
    h.StateName = 'SelectedItem';
    % 25 28
    % 26 28
    h.uibutton(varargin{:});
function hWidget = createMagCombo(hThis)
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    hWidget = spcwidgets.uimagcombobox(hThis.GraphicalParent, 'tag', hThis.name);
