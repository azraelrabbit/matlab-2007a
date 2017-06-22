function y = StatusText(obj, str)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if isempty(obj.hStatusText)
        if gt(nargout, 0.0)
            y = '';
        end % if
    else
        if gt(nargin, 1.0)
            set(obj.hStatusText, 'string', str);
        end % if
        if gt(nargout, 0.0)
            y = get(obj.hStatusText, 'string');
        end % if
    end % if
end % function
