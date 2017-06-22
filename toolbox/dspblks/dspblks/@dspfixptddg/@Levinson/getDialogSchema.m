function dlgStruct = getDialogSchema(this, dummy)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    coeffOutFcn = dspGetLeafWidgetBase('combobox', 'Output(s):', 'coeffOutFcn', this, 'coeffOutFcn');
    % 14 15
    coeffOutFcn.Entries = ctranspose(set(this, 'coeffOutFcn'));
    % 16 17
    outP = dspGetLeafWidgetBase('checkbox', 'Output prediction error power (P)', 'outP', this, 'outP');
    % 18 20
    % 19 20
    prompt = 'If the value of lag 0 is zero, A=[1 zeros], K=[zeros], P=0';
    zeroInpHandling = dspGetLeafWidgetBase('checkbox', prompt, 'zeroInpHandling', this, 'zeroInpHandling');
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    items = cellhorzcat(coeffOutFcn, outP, zeroInpHandling);
    % 27 28
    dlgStruct = this.getRootSchemaStruct(items);
end % function
