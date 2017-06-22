function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(dlgWidget(this, 'TitleType', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'DialogRefresh', true)), cellhorzcat(dlgWidget(this, 'ParaTitle', 'Enabled', strcmp(this.TitleType, 'specify'), 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0]))), xlate('Title Options'), 'LayoutGrid', [1.0 2.0], 'ColStretch', [0.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(dlgWidget(this, 'ParaText', 'Type', 'editarea'))), xlate('Paragraph Text')))));
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
end % function
