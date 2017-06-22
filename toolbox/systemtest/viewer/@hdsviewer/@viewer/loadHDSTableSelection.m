function loadHDSTableSelection(h, s)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if not(isfield(s, 'DataTableState'))
        return;
    end % if
    % 8 10
    % 9 10
    h.HDSTableAdaptor.HDSTable.loadSelection(s.DataTableState.SelectedSubTable, s.DataTableState.SelectedVariableName);
end % function
