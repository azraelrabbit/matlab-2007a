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
    % 12 14
    % 13 14
    w = this.dlgWidget;
    % 15 16
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.ObjectType), cellhorzcat(w.repMinChildren), cellhorzcat(w.addAnchor)), xlate('Properties')))));
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
end % function
