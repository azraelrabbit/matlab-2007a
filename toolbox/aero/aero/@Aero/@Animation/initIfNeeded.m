function initIfNeeded(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isempty(h.Figure) || not(ishandle(h.Figure))
        h.initialize;
    end % if
end % function
