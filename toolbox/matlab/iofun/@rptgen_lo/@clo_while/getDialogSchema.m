function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    previewText = sprintf('%s\nwhile(%s)\n\t%%Run children\nend', this.EvalInitString, this.ConditionalString);
    % 8 11
    % 9 11
    % 10 11
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ConditionalString', 'DialogRefresh', 1.0, 'ColSpan', [1.0 3.0], 'RowSpan', [1.0 1.0], 'NameLocation', 2.0)), cellhorzcat(this.dlgWidget('isMaxIterations', 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0], 'DialogRefresh', 1.0)), cellhorzcat(this.dlgWidget('MaxIterations', 'ColSpan', [2.0 3.0], 'RowSpan', [2.0 2.0], 'Enabled', this.isMaxIterations)), cellhorzcat(this.dlgWidget('EvalInitString', 'DialogRefresh', 1.0, 'ColSpan', [1.0 3.0], 'RowSpan', [3.0 3.0], 'Type', 'editarea'))), xlate('Logic Properties'), 'LayoutGrid', [3.0 3.0], 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(previewText))), xlate('Preview'), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0]);
    % 12 37
    % 13 37
    % 14 37
    % 15 37
    % 16 37
    % 17 37
    % 18 37
    % 19 37
    % 20 37
    % 21 37
    % 22 37
    % 23 37
    % 24 37
    % 25 37
    % 26 37
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
end % function
