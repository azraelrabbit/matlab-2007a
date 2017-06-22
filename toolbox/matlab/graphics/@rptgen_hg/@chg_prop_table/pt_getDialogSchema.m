function wLocal = pt_getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    wFilter = this.dlgWidget('FilterByClass', 'DialogRefresh', true, 'ColSpan', [1.0 2.0], 'RowSpan', [2.0 2.0]);
    % 9 12
    % 10 12
    % 11 12
    wFilter.Name = horzcat(wFilter.Name, ': ');
    % 13 14
    wLocal = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ObjectType', 'DialogRefresh', true, 'ColSpan', [1.0 10.0], 'RowSpan', [1.0 1.0])), cellhorzcat(wFilter), cellhorzcat(this.dlgWidget('FilterClass', 'Enabled', this.FilterByClass, 'ColSpan', [3.0 10.0], 'RowSpan', [2.0 2.0]))), xlate('Select Graphics Object'), 'LayoutGrid', [2.0 10.0]);
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
end % function
