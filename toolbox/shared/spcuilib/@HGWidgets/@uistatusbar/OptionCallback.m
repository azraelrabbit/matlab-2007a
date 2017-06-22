function OptionCallback(obj, idx, fcn)
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
    N = numel(obj.hOptionText);
    if lt(idx, 1.0) || gt(idx, N)
        if eq(N, 0.0)
            error('No Option regions defined in uistatusbar');
        else
            error('Option index must be in the range [1,%d]', N);
        end % if
    end % if
    set(obj.hOptionText(idx), 'buttondownfcn', fcn);
end % function
