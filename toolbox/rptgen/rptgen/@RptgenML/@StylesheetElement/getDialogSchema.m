function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgAddContainer('RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgValueContainer('RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgPreviewContainer('RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 1.0 0.0], 'DialogTitle', xlate('Edit Stylesheet: Data'));
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
end % function
