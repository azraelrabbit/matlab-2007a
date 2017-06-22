function dlgStruct = getDialogSchema(this, dummy)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    Algo = dspGetLeafWidgetBase('combobox', 'Algorithm:', 'Algo', this, 'Algo');
    % 13 14
    Algo.Entries = ctranspose(set(this, 'Algo'));
    Algo.DialogRefresh = 1.0;
    % 16 18
    % 17 18
    L = dspGetLeafWidgetBase('edit', 'Filter length:', 'L', this, 'L');
    % 19 21
    % 20 21
    stepflag = dspGetLeafWidgetBase('combobox', 'Specify step size via:', 'stepflag', this, 'stepflag');
    % 22 23
    stepflag.Entries = ctranspose(set(this, 'stepflag'));
    stepflag.DialogRefresh = 1.0;
    % 25 27
    % 26 27
    mu = dspGetLeafWidgetBase('edit', 'Step size (mu):', 'mu', this, 'mu');
    mu.Tunable = 1.0;
    % 29 30
    if strcmp(this.stepflag, 'Dialog')
        mu.Visible = 1.0;
    else
        mu.Visible = 0.0;
    end % if
    % 35 37
    % 36 37
    leakage = dspGetLeafWidgetBase('edit', 'Leakage factor (0 to 1):', 'leakage', this, 'leakage');
    % 38 39
    leakage.Tunable = 1.0;
    % 40 43
    % 41 43
    % 42 43
    ic = dspGetLeafWidgetBase('edit', 'Initial value of filter weights:', 'ic', this, 'ic');
    % 44 47
    % 45 47
    % 46 47
    Adapt = dspGetLeafWidgetBase('checkbox', 'Adapt port', 'Adapt', this, 'Adapt');
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    resetflag = dspGetLeafWidgetBase('combobox', 'Reset port:', 'resetflag', this, 'resetflag');
    % 53 54
    resetflag.Entries = ctranspose(set(this, 'resetflag'));
    % 55 57
    % 56 57
    weights = dspGetLeafWidgetBase('checkbox', 'Output filter weights', 'weights', this, 'weights');
    % 58 60
    % 59 60
    items = cellhorzcat(Algo, L, stepflag, mu, leakage, ic, Adapt, resetflag, weights);
    % 61 72
    % 62 72
    % 63 72
    % 64 72
    % 65 72
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    % 71 72
    this.FixptDialog.DataTypeRows(1.0).Visible = mu.Visible;
    % 73 74
    dlgStruct = this.getRootSchemaStruct(items);
end % function
