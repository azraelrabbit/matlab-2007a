function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        dlgStruct = this.buildErrorMessage(name, true);
        return;
        % 10 11
    end % if
    % 12 13
    w = this.dlgWidget;
    % 14 15
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgSet(w.TitleMode, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0], 'DialogRefresh', true)), cellhorzcat(this.dlgSet(w.Title, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0], 'Enabled', strcmp(this.TitleMode, 'manual')))), xlate('Title'), 'LayoutGrid', [2.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.ShowConditionHeader), cellhorzcat(w.ShowConditionNumber), cellhorzcat(w.ShowConditionCode), cellhorzcat(w.ShowConditionDescription), cellhorzcat(w.ConditionWrapLimit)), xlate('Condition Table'))), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.ShowActionHeader), cellhorzcat(w.ShowActionNumber), cellhorzcat(w.ShowActionCode), cellhorzcat(w.ShowActionDescription)), xlate('Action Table')))));
    % 16 39
    % 17 39
    % 18 39
    % 19 39
    % 20 39
    % 21 39
    % 22 39
    % 23 39
    % 24 39
    % 25 39
    % 26 39
    % 27 39
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
end % function
