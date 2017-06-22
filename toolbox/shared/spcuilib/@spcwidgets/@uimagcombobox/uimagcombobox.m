function h = uimagcombobox(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    h = spcwidgets.uimagcombobox;
    % 10 14
    % 11 14
    % 12 14
    if eq(mod(nargin, 2.0), 1.0)
        h.parent = varargin{1.0};
        varargin = varargin(2.0:end);
    end % if
    if isempty(h.parent)
        % 18 24
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        parent = findobj(gcf, 'type', 'uitoolbar');
        if isempty(parent)
            parent = uitoolbar;
        end % if
        h.parent = parent;
    end % if
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    drawnow('expose');
    % 37 39
    [h.cb, h.api] = createMagComboBox(h.parent);
    set(h, varargin{:});
