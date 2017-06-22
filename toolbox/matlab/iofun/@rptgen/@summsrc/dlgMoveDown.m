function dlgMoveDown(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    props = this.Properties;
    propCount = length(props);
    % 9 10
    if lt(this.DlgCurrentPropertyIdx, propCount)
        cWid = this.getColumnWidths;
        cHead = this.getColumnHeaders;
        % 13 14
        newIdx = horzcat(1.0:minus(this.DlgCurrentPropertyIdx, 1.0), plus(this.DlgCurrentPropertyIdx, 1.0), this.DlgCurrentPropertyIdx, plus(this.DlgCurrentPropertyIdx, 2.0):propCount);
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        this.Properties = props(newIdx);
        this.ColumnWidths = cWid(newIdx);
        this.ColumnHeaders = cHead(newIdx);
        % 22 23
        this.DlgCurrentPropertyIdx = plus(this.DlgCurrentPropertyIdx, 1.0);
    end % if
end % function
