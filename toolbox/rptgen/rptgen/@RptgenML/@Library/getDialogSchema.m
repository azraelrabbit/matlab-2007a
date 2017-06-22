function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgMain(name, this.dlgContainer(vertcat(cellhorzcat(this.dlgText(xlate('Drag components to the desired location'))))));
    % 8 11
    % 9 11
    % 10 11
    dlgStruct.DialogTitle = xlate('Available Components');
end % function
