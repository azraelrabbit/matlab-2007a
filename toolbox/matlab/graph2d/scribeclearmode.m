function scribeclearmode(fig, varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    s = getappdata(fig, 'ScribeClearModeCallback');
    if not(isempty(s)) && iscell(s)
        func = s{1.0};
        if gt(length(s), 1.0)
            feval(func, s{2.0:end});
        else
            feval(func);
        end % if
    end % if
    % 26 28
    % 27 28
    if gt(nargin, 2.0)
        s = varargin;
        setappdata(fig, 'ScribeClearModeCallback', s);
    else
        if isappdata(fig, 'ScribeClearModeCallback')
            rmappdata(fig, 'ScribeClearModeCallback');
        end % if
    end % if
end % function
