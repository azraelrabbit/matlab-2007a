function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('TrueText', 'Type', 'editarea'))), xlate('Properties')))));
    % 9 13
    % 10 13
    % 11 13
    % 12 13
end % function
