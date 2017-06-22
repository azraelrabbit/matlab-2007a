function dlgAdd(this, dlgH)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    newProp = this.PropSrc.DlgProperty;
    if isempty(newProp)
        newProp = 'Name';
    end % if
    % 13 14
    props = ctranspose(this.Properties(:));
    cWid = this.getColumnWidths;
    % 16 17
    cWid = horzcat(cWid(1.0:minus(this.DlgCurrentPropertyIdx, 1.0)), 1.0, cWid(this.DlgCurrentPropertyIdx:end));
    % 18 21
    % 19 21
    % 20 21
    this.ColumnWidths = cWid;
    % 22 23
    props = cellhorzcat(props{1.0:minus(this.DlgCurrentPropertyIdx, 1.0)}, newProp, props{this.DlgCurrentPropertyIdx:end});
    % 24 27
    % 25 27
    % 26 27
    this.Properties = props;
    % 28 30
    % 29 30
    cHead = this.getColumnHeaders;
    cHead = cellhorzcat(cHead{1.0:minus(this.DlgCurrentPropertyIdx, 1.0)}, '', cHead{this.DlgCurrentPropertyIdx:end});
    % 32 35
    % 33 35
    % 34 35
    this.ColumnHeaders = cHead;
end % function
