function y = StatusEnable(obj, ena)
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
    % 11 12
    error(nargchk(1.0, 2.0, nargin));
    if gt(nargin, 1.0)
        set(obj.hStatusText, 'enable', ena);
    end % if
    if gt(nargout, 0.0)
        y = get(obj.hStatusText, 'enable');
    end % if
end % function
