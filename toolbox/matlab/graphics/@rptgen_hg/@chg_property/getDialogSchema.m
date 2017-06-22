function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ObjectType', 'DialogRefresh', true)), cellhorzcat(this.dlgWidget(horzcat(this.ObjectType, 'Property')))), xlate('Property Selection'))), cellhorzcat(this.vdGetDialogSchema(name))));
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
end % function
