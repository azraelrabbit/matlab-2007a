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
    otype = dspGetLeafWidgetBase('combobox', 'Mode:', 'otype', this, 'otype');
    % 15 16
    otype.Entries = transpose(set(this, 'otype'));
    % 17 19
    % 18 19
    dir = dspGetLeafWidgetBase('combobox', 'Sort order:', 'dir', this, 'dir');
    % 20 21
    dir.Entries = transpose(set(this, 'dir'));
    dir.Tunable = 1.0;
    % 23 25
    % 24 25
    sortAlg = dspGetLeafWidgetBase('combobox', 'Sort algorithm:', 'sortAlg', this, 'sortAlg');
    % 26 27
    sortAlg.Entries = transpose(set(this, 'sortAlg'));
    % 28 29
    items = cellhorzcat(otype, dir, sortAlg);
    % 30 31
    dlgStruct = this.getRootSchemaStruct(items);
end % function
