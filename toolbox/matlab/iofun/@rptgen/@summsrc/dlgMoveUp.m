function dlgMoveUp(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(this.DlgCurrentPropertyIdx, 1.0)
        props = this.Properties;
        propCount = length(props);
        cWid = this.getColumnWidths;
        cHead = this.getColumnHeaders;
        % 13 14
        newIdx = horzcat(1.0:minus(this.DlgCurrentPropertyIdx, 2.0), this.DlgCurrentPropertyIdx, minus(this.DlgCurrentPropertyIdx, 1.0), plus(this.DlgCurrentPropertyIdx, 1.0):propCount);
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        this.Properties = props(newIdx);
        this.ColumnWidths = cWid(newIdx);
        this.ColumnHeaders = cHead(newIdx);
        % 22 23
        this.DlgCurrentPropertyIdx = minus(this.DlgCurrentPropertyIdx, 1.0);
    end % if
end % function
