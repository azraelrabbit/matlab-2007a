function dlgStruct = loop_getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    enableSearch = strcmp(this.Looptype, 'all');
    % 9 10
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('Looptype', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('ExcludeSubclasses', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'Enabled', enableSearch)), cellhorzcat(this.dlgWidget('IncludeHidden', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0], 'Enabled', enableSearch)), cellhorzcat(RptgenML.twoColumnTable(this, 'SearchTerms', '', 'Enabled', enableSearch, 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 1.0]))), xlate('Object Selection'), 'LayoutGrid', [4.0 1.0], 'RowStretch', [0.0 0.0 0.0 1.0]);
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
end % function
