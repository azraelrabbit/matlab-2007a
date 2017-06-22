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
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('StartSys')), cellhorzcat(this.dlgWidget('HighlightStartSys'))), xlate('Starting System'))), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ParentDepth')), cellhorzcat(this.dlgWidget('isPeers')), cellhorzcat(this.dlgWidget('ChildDepth'))), xlate('Display Systems'))), cellhorzcat(this.list_getDialogSchema(name))));
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
end % function
