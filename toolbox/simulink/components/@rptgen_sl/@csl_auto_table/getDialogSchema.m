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
    % 12 15
    % 13 15
    % 14 15
    if strcmp(this.PropertyListMode, 'manual')
        wPropertyList = this.dlgWidget('PropertyList');
    else
        % 18 20
        % 19 20
        wPropertyList = this.dlgText('');
    end % if
    % 22 24
    % 23 24
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ObjectType')), cellhorzcat(this.dlgWidget('PropertyListMode', 'DialogRefresh', 1.0)), cellhorzcat(wPropertyList), cellhorzcat(this.dlgWidget('ShowFullName')), cellhorzcat(this.dlgWidget('ShowNamePrompt'))), xlate('Options'))), cellhorzcat(this.atGetDialogSchema(name))));
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
end % function
