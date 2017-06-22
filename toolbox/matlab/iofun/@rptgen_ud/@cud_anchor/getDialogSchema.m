function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    w = this.dlgWidget;
    % 8 9
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.LinkText), cellhorzcat(w.UddType)), xlate('Properties')))));
    % 10 14
    % 11 14
    % 12 14
    % 13 14
end % function
