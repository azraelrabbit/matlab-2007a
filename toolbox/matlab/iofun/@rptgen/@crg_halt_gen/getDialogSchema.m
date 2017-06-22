function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('isPrompt', 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('PromptString', 'Enabled', this.isPrompt)), cellhorzcat(this.dlgWidget('HaltString', 'Enabled', this.isPrompt)), cellhorzcat(this.dlgWidget('ContString', 'Enabled', this.isPrompt))), xlate('Confirmation Properties'), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0]);
    % 8 18
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
