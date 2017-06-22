function h = uistatusbar(varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    args = varargin;
    if eq(mod(nargin, 2.0), 1.0)
        args = horzcat('Parent', args);
    end % if
    [parent, args] = getParent(args);
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    h = [];
    if isempty(h)
        % 28 30
        % 29 30
        h = spcwidgets.uistatusbar;
        h.hWidget = spcwidgets.uistatusbase(parent);
    end % if
    set(h, args{:});
end % function
function [parent, args] = getParent(args)
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    idx = find(strcmpi('parent', args));
    if isempty(idx)
        % 42 43
        parent = gcf;
    else
        % 45 46
        parent = args{mtimes(idx, 2.0)};
        args(minus(mtimes(idx, 2.0), 1.0):mtimes(idx, 2.0)) = [];
    end % if
end % function
