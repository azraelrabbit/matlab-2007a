function N = CheckOptionIndex(h, idx, N)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 3.0)
        N = h.NumOptions;
    end % if
    % 13 14
    if any(lt(idx, 1.0)) || any(gt(idx, N))
        error('spcwidgets:uistatusbar:InvalidOptionIndex', 'Option index must be in the range [1,%d]', N);
        % 16 17
    end % if
end % function
