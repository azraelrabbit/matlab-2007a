function loadHDSTable(h, s)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if not(isfield(s, 'DataTableState'))
        return;
    end % if
    % 8 10
    % 9 10
    twistState = vertcat(horzcat(s.DataTableState.ResultsTableOpen), horzcat(s.DataTableState.VectorTableOpen), horzcat(s.DataTableState.StatsTableOpen));
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    sortOrder = vertcat(horzcat(s.DataTableState.ResultsSortOrder), horzcat(s.DataTableState.VectorsSortOrder));
    % 17 20
    % 18 20
    % 19 20
    h.FilterCtrl.DerivedVarExpressions = s.DataTableState.DerivedVarExpressions;
    % 21 23
    % 22 23
    h.HDSTableAdaptor.HDSTable.loadSetup(twistState, sortOrder, s.DataTableState.VectorTableColumns(:), s.DataTableState.ResultsTableColumns(:));
    % 24 25
end % function
