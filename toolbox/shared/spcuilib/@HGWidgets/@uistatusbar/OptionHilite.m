function OptionHilite(obj, idx, doHilite)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    N = numel(obj.hOptionText);
    if lt(idx, 1.0) || gt(idx, N)
        if eq(N, 0.0)
            error('No Option regions defined in uistatusbar');
        else
            error('Option index must be in the range [1,%d]', N);
        end % if
    end % if
    if doHilite
        bg = [.8 .4 .4];
    else
        bg = obj.Background;
    end % if
    set(obj.hOptionText(idx), 'background', bg);
end % function
