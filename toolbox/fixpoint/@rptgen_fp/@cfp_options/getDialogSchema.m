function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgWidget('DataTypeOverride', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'Type', 'radiobutton')), cellhorzcat(this.dlgWidget('MinMaxOverflowLogging', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'Type', 'radiobutton')), cellhorzcat(this.dlgWidget('MinMaxOverflowArchiveMode', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0], 'Type', 'radiobutton'))), 'LayoutGrid', [4.0 1.0], 'RowStretch', [0.0 0.0 0.0 1.0]);
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
end % function
