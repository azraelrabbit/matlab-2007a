function dlgStruct = getDialogSchema(this, dummy_arg)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    sortAlg = dspGetLeafWidgetBase('combobox', 'Sort algorithm:', 'sortAlg', this, 'sortAlg');
    % 15 16
    sortAlg.Entries = transpose(set(this, 'sortAlg'));
    % 17 18
    items = cellhorzcat(sortAlg);
    % 19 20
    dlgStruct = this.getRootSchemaStruct(items);
end % function
