function dlgStruct = getDialogSchema(this, dummy_arg)
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
    allPosLag = dspGetLeafWidgetBase('checkbox', 'Compute all non-negative lags', 'AllPositiveLags', this, 'AllPositiveLags');
    % 16 17
    allPosLag.DialogRefresh = 1.0;
    % 18 20
    % 19 20
    maxLagPrompt = 'Maximum non-negative lag (less than input length):';
    maxLag = dspGetLeafWidgetBase('edit', maxLagPrompt, 'maxlag', this, 'maxlag');
    if this.AllPositiveLags
        maxLag.Visible = 0.0;
    else
        maxLag.Visible = 1.0;
    end % if
    % 27 29
    % 28 29
    scaling = dspGetLeafWidgetBase('combobox', 'Scaling:', 'bias', this, 'bias');
    scaling.Entries = ctranspose(set(this, 'bias'));
    scaling.Tunable = 1.0;
    % 32 34
    % 33 34
    domain = dspGetLeafWidgetBase('combobox', 'Computation domain:', 'domain', this, 'domain');
    % 35 36
    domain.Entries = ctranspose(set(this, 'domain'));
    % 37 38
    items = cellhorzcat(allPosLag, maxLag, scaling, domain);
    % 39 40
    dlgStruct = this.getRootSchemaStruct(items);
end % function
