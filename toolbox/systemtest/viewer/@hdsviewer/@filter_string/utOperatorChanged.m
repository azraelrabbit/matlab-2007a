function utOperatorChanged(h, eventsrc, eventdata)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    [SelectedIndex, SelectedGrid] = getselectedindex(h, h.SelectedOperator, h.SelectedValue);
    if strcmp(h.Active, 'on')
        % 7 8
        h.SelectedGrid = SelectedGrid;
        h.SelectedIndex = SelectedIndex;
    end % if
end % function
