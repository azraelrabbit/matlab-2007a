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
    end % if
    % 11 12
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('StateflowProperty'))), xlate('Property to Display'))), cellhorzcat(this.vdGetDialogSchema(name))));
    % 13 17
    % 14 17
    % 15 17
    % 16 17
end % function
