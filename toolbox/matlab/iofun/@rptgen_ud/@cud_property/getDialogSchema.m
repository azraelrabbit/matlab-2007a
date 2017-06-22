function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('UddType')), cellhorzcat(this.dlgWidget('PropertyName'))), xlate('Property to Display'))), cellhorzcat(this.vdGetDialogSchema(name))));
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
end % function
