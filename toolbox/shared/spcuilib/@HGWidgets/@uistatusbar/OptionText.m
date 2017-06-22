function OptionText(obj, idx, str)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    N = numel(obj.hOptionText);
    if lt(idx, 1.0) || gt(idx, N)
        if eq(N, 0.0)
            error('No Option regions defined in uistatusbar');
        else
            error('Option index must be in the range [1,%d]', N);
        end % if
    end % if
    set(obj.hOptionText(idx), 'string', str);
end % function
