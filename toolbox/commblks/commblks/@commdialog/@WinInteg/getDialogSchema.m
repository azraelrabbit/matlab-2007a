function dlgStruct = getDialogSchema(this, dummy)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    integperiod = dspGetLeafWidgetBase('edit', 'Integration period (number of samples):', 'integperiod', this, 'integperiod');
    % 17 18
    integperiod.Entries = ctranspose(set(this, 'integperiod'));
    % 19 21
    % 20 21
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(integperiod));
end % function
