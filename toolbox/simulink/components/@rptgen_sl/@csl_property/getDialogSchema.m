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
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ObjectType', 'DialogRefresh', 1.0)), cellhorzcat(this.dlgWidget(horzcat(this.ObjectType, 'Property')))), xlate('Simulink Object and Parameter'))), cellhorzcat(this.vdGetDialogSchema(name))));
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
end % function
