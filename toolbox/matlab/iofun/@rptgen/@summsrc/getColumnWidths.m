function cWid = getColumnWidths(this)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    propCount = length(this.Properties);
    widCount = length(this.ColumnWidths);
    % 14 15
    if eq(widCount, propCount)
        cWid = this.ColumnWidths;
    else
        if lt(widCount, propCount)
            % 19 20
            cWid = ctranspose(vertcat(this.ColumnWidths(:), ones(minus(propCount, widCount), 1.0)));
        else
            % 22 23
            cWid = this.ColumnWidths(1.0:propCount);
        end % if
        this.ColumnWidths = cWid;
    end % if
end % function
