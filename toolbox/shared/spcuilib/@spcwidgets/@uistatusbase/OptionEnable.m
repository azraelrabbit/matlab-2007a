function y = OptionEnable(obj, idx, ena)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    error(nargchk(2.0, 3.0, nargin));
    % 15 17
    % 16 17
    if eq(nargin, 2.0)
        if gt(nargout, 0.0)
            y = get(obj.hOptionText(idx), 'enable');
        else
            % 21 23
            % 22 23
            ena = idx;
            set(obj.hOptionText, 'enable', ena);
        end % if
    else
        CheckOptionIndex(obj, idx);
        set(obj.hOptionText(idx), 'enable', ena);
    end % if
end % function
