function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ConditionalString', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'NameLocation', 2.0)), cellhorzcat(this.dlgWidget('TrueText', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'Type', 'editarea', 'NameLocation', 2.0))), xlate('Properties'), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0]))));
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
end % function
