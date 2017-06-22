function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        dlgStruct = this.buildErrorMessage(name, true);
        return;
        % 11 12
    end % if
    % 13 15
    % 14 15
    w = this.dlgWidget;
    % 16 17
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.minNumBlocks), cellhorzcat(w.minNumSubSystems), cellhorzcat(w.isMask)), xlate('Properties')))));
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
end % function
