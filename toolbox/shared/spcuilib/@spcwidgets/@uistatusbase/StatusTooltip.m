function y = StatusTooltip(obj, str)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 1.0)
        set(obj.hStatusText, 'tooltip', str);
    end % if
    if gt(nargout, 0.0)
        y = get(obj.hStatusText, 'tooltip');
    end % if
end % function
