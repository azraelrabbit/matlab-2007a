function utExpressionChanged(h, eventsrc, eventdata)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if strcmp(h.Active, 'on')
        h.SelectedIndex = h.getselectedindex;
        h.SelectedIndexCache = h.SelectedIndex;
    end % if
end % function
