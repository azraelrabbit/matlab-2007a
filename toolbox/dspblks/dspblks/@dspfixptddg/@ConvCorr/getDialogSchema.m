function dlgStruct = getDialogSchema(this, name)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    domain = dspGetLeafWidgetBase('combobox', 'Computation domain:', 'domain', this, 'domain');
    domain.Entries = ctranspose(set(this, 'domain'));
    % 17 18
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(domain));
end % function
