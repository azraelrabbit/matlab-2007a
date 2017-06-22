function y = OptionTooltip(obj, idx, str)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(2.0, 3.0, nargin));
    CheckOptionIndex(obj, idx);
    % 12 13
    if lt(nargin, 3.0)
        y = get(obj.hOptionText(idx), 'tooltip');
    else
        set(obj.hOptionText(idx), 'tooltip', str);
    end % if
end % function
