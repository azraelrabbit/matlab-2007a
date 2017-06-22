function y = StatusCallback(obj, fcn)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    error(nargchk(1.0, 2.0, nargin));
    if gt(nargin, 1.0)
        set(obj.hStatusText, 'buttondownfcn', fcn);
        % 14 18
        % 15 18
        % 16 18
        % 17 18
    end % if
    if gt(nargout, 0.0)
        y = get(obj.hStatusText, 'buttondownfcn');
    end % if
end % function
