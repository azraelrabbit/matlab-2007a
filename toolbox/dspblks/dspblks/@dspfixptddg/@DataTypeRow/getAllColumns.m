function val = getAllColumns(h)
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
    val = h(1.0).getColumns;
    % 12 13
    for ind=2.0:length(h)
        val = bitor(val, h(ind).getColumns);
    end % for
end % function
