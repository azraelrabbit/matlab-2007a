function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgText(this.MessageLong, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'WordWrap', true))), 'DialogTitle', this.MessageShort, 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0], 'StandaloneButtonSet', {'OK'}, 'EmbeddedButtonSet', {});
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
end % function
