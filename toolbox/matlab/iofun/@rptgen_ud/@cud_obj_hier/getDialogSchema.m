function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.hierGetDialogSchema(name)), cellhorzcat(this.list_getDialogSchema(name))));
    % 8 10
    % 9 10
end % function
