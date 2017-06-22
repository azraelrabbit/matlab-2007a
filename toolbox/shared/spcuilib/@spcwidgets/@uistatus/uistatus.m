function h = uistatus(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    h = spcwidgets.uistatus;
    args = varargin;
    if eq(mod(nargin, 2.0), 1.0)
        args = horzcat('Parent', args);
    end % if
    [parent, args] = getParent(args);
    [width, args] = getWidth(args);
    connect(h, parent, 'up');
    % 15 17
    % 16 17
    hWidget = parent.hWidget;
    hWidget.OptionWidths = horzcat(hWidget.OptionWidths, width);
    % 19 20
    h.privateIndex = NumOptions(hWidget);
    set(h, args{:});
end % function
function [parent, args] = getParent(args)
    % 24 27
    % 25 27
    % 26 27
    if isempty(args)
        paramNames = {};
    else
        paramNames = args(1.0:2.0:minus(end, 1.0));
    end % if
    % 32 33
    idx = find(strcmpi('parent', paramNames));
    if isempty(idx)
        % 35 43
        % 36 43
        % 37 43
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        % 42 43
        error('spcwidgets:uistatus:NoParent', 'Parent uistatusbar handle must be specified.');
    else
        % 45 47
        % 46 47
        parent = args{mtimes(idx, 2.0)};
        % 48 49
        args(minus(mtimes(idx, 2.0), 1.0):mtimes(idx, 2.0)) = [];
    end % if
    if not(isa(parent, 'spcwidgets.uistatusbar'))
        error('Invalid parent specified.');
    end % if
end % function
function [width, args] = getWidth(args)
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    if isempty(args)
        paramNames = {};
    else
        paramNames = args(1.0:2.0:minus(end, 1.0));
    end % if
    % 65 66
    idx = find(strcmpi('width', paramNames));
    if isempty(idx)
        % 68 69
        width = 40.0;
    else
        % 71 72
        width = args{mtimes(idx, 2.0)};
        % 73 74
        args(minus(mtimes(idx, 2.0), 1.0):mtimes(idx, 2.0)) = [];
    end % if
end % function
