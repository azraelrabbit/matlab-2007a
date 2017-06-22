function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    w = this.dlgWidget;
    % 8 9
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.ListType), cellhorzcat(w.ShowLocal), cellhorzcat(w.ShowInherited)), xlate('Properties')))));
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
end % function
