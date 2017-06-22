function applyPresetTable(this, tableName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this.pt_applyPresetTable(tableName);
    % 11 12
    if not(isempty(findprop(this, 'DlgInfo'))) && not(isempty(this.DlgInfo)) && ishandle(this.DlgInfo.SingleValueMode)
        % 13 16
        % 14 16
        % 15 16
        nRows = getTableDims(this);
        % 17 18
        set(this.DlgInfo.SingleValueMode, 'value', this.SingleValueMode);
        set(this.DlgInfo.presetpop, 'Value', 1.0)
        set(this.DlgInfo.presetaddbtn, 'enable', 'off');
        set(this.DlgInfo.slider(1.0), 'value', .5);
        set(this.DlgInfo.slider(2.0), 'Min', 0.0, 'Max', nRows, 'value', mrdivide(nRows, 2.0));
        % 23 26
        % 24 26
        % 25 26
        set(this.DlgInfo.Figure, 'Name', this.getOutlineString);
        % 27 28
        this.dlgEditor('Redraw');
        this.dlgEditor('CellSelect', 1.0, 1.0, 0.0);
    else
        this.setCurrentCell(1.0, 1.0);
    end % if
end % function
