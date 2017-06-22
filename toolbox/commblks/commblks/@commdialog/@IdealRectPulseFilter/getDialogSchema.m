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
    pulseLen = dspGetLeafWidgetBase('edit', 'Pulse length (number of samples):', 'pulseLen', this, 'pulseLen');
    % 17 18
    pulseLen.Entries = set(this, 'pulseLen');
    % 19 21
    % 20 21
    pulseDelay = dspGetLeafWidgetBase('edit', 'Pulse delay (number of samples):', 'pulseDelay', this, 'pulseDelay');
    % 22 23
    pulseDelay.Entries = set(this, 'pulseDelay');
    % 24 26
    % 25 26
    sampMode = dspGetLeafWidgetBase('combobox', 'Input sampling mode:', 'sampMode', this, 'sampMode');
    % 27 28
    sampMode.Entries = ctranspose(set(this, 'sampMode'));
    % 29 31
    % 30 31
    normCheck = dspGetLeafWidgetBase('checkbox', 'Normalization method', 'normCheck', this, 'normCheck');
    % 32 33
    normCheck.DialogRefresh = 1.0;
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    normMode = dspGetLeafWidgetBase('combobox', 'Normalization method:', 'normMode', this, 'normMode');
    % 39 40
    normMode.Entries = ctranspose(set(this, 'normMode'));
    % 41 42
    if this.normCheck
        normMode.Visible = 1.0;
    else
        normMode.Visible = 0.0;
    end % if
    % 47 49
    % 48 49
    filterGain = dspGetLeafWidgetBase('edit', 'Linear amplitude gain:', 'filterGain', this, 'filterGain');
    % 50 51
    filterGain.Entries = set(this, 'filterGain');
    % 52 53
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(pulseLen, pulseDelay, sampMode, normCheck, normMode, filterGain));
end % function
