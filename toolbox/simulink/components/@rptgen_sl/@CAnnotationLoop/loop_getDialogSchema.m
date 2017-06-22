function dlgStruct = loop_getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        dlgStruct = this.buildErrorMessage('panel', true);
        return;
    end % if
    % 11 12
    dlgStruct = vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(this.loop_getContextString, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0]))), xlate('Report On'), 'LayoutGrid', [1.0 1.0], 'RowStretch', 0.0)), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('SortBy', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), xlate('Loop Options'), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0])));
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
end % function
