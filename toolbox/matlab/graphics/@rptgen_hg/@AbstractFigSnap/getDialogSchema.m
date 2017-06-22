function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainerFormat('RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainerPrint('RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.gr_dlgDisplayOptions([], [], 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
end % function
