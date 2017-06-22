function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this.getRefentryInfo;
    % 8 9
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgAddContainer('RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgValueContainer('RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgPreviewContainer('RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgHelpContainer('RowSpan', [4.0 4.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [4.0 1.0], 'RowStretch', [0.0 1.0 0.0 0.0], 'DialogTitle', xlate('Edit Stylesheet: Data'));
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
end % function
