function dlgDelete(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    props = this.Properties;
    propCount = length(props);
    cWid = this.getColumnWidths;
    cHead = this.getColumnHeaders;
    % 12 13
    newIdx = horzcat(1.0:minus(this.DlgCurrentPropertyIdx, 1.0), plus(this.DlgCurrentPropertyIdx, 1.0):propCount);
    % 14 16
    % 15 16
    this.Properties = props(newIdx);
    this.ColumnWidths = cWid(newIdx);
    this.ColumnHeaders = cHead(newIdx);
    % 19 20
    if eq(this.DlgCurrentPropertyIdx, propCount)
        this.DlgCurrentPropertyIdx = minus(this.DlgCurrentPropertyIdx, 1.0);
    end % if
end % function
