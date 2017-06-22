function y = OptionCallback(obj, idx, fcn)
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
    error(nargchk(2.0, 3.0, nargin));
    CheckOptionIndex(obj, idx);
    % 14 15
    if gt(nargin, 2.0)
        set(obj.hOptionText(idx), 'buttondownfcn', fcn);
        % 17 21
        % 18 21
        % 19 21
        % 20 21
    end % if
    if gt(nargout, 0.0)
        y = get(obj.hOptionText(idx), 'buttondownfcn');
    end % if
end % function
