function y = OptionVisible(obj, idx, vis)
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
            y = get(obj.hAllOptions(idx), 'visible');
        else
            % 21 23
            % 22 23
            vis = idx;
            set(obj.hAllOptions, 'visible', vis);
        end % if
    else
        CheckOptionIndex(obj, idx);
        set(obj.hAllOptions(idx), 'visible', vis);
    end % if
end % function
