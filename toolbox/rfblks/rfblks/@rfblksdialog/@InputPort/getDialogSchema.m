function dlgStruct = getDialogSchema(this, dummy)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    lprompt = 1.0;
    rprompt = 4.0;
    lwidget = plus(rprompt, 1.0);
    rwidget = 18.0;
    numgrid = 20.0;
    % 15 17
    maxrows = 0.0;
    % 17 21
    % 18 21
    % 19 21
    maxLength = dspGetLeafWidgetBase('edit', '', 'MaxLength', this, 'MaxLength');
    maxLength.RowSpan = [1.0 1.0];
    maxLength.ColSpan = horzcat(lwidget, rwidget);
    % 23 25
    maxLengthprompt = dspGetLeafWidgetBase('text', 'Finite impulse response filter length:', 'MaxLengthPrompt', 0.0);
    % 25 27
    maxLengthprompt.RowSpan = [1.0 1.0];
    maxLengthprompt.ColSpan = horzcat(lprompt, rprompt);
    % 28 31
    % 29 31
    fc = dspGetLeafWidgetBase('edit', '', 'Fc', this, 'Fc');
    fc.RowSpan = [2.0 2.0];
    fc.ColSpan = horzcat(lwidget, rwidget);
    % 33 35
    fcprompt = dspGetLeafWidgetBase('text', 'Center frequency (Hz):', 'FcPrompt', 0.0);
    % 35 37
    fcprompt.RowSpan = [2.0 2.0];
    fcprompt.ColSpan = horzcat(lprompt, rprompt);
    % 38 41
    % 39 41
    ts = dspGetLeafWidgetBase('edit', '', 'Ts', this, 'Ts');
    ts.RowSpan = [3.0 3.0];
    ts.ColSpan = horzcat(lwidget, rwidget);
    % 43 45
    tsprompt = dspGetLeafWidgetBase('text', 'Sample time (s):', 'TsPrompt', 0.0);
    % 45 47
    tsprompt.RowSpan = [3.0 3.0];
    tsprompt.ColSpan = horzcat(lprompt, rprompt);
    % 48 51
    % 49 51
    zs = dspGetLeafWidgetBase('edit', '', 'Zs', this, 'Zs');
    zs.RowSpan = [4.0 4.0];
    zs.ColSpan = horzcat(lwidget, rwidget);
    % 53 55
    zsprompt = dspGetLeafWidgetBase('text', 'Source impedance:', 'ZsPrompt', 0.0);
    % 55 57
    zsprompt.RowSpan = [4.0 4.0];
    zsprompt.ColSpan = horzcat(lprompt, rprompt);
    % 58 61
    % 59 61
    noiseFlag = dspGetLeafWidgetBase('checkbox', 'Add noise', 'NoiseFlag', this, 'NoiseFlag');
    noiseFlag.RowSpan = [5.0 5.0];
    noiseFlag.ColSpan = horzcat(lprompt, rwidget);
    noiseFlag.DialogRefresh = 1.0;
    % 64 67
    % 65 67
    seed = dspGetLeafWidgetBase('edit', '', 'seed', this, 'seed');
    seed.RowSpan = [6.0 6.0];
    seed.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 69 71
    seedprompt = dspGetLeafWidgetBase('text', 'Initial seed:', 'SeedPrompt', 0.0);
    % 71 73
    seedprompt.RowSpan = [6.0 6.0];
    seedprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 74 76
    maxrows = max(horzcat(maxrows, seed.RowSpan(1.0)));
    % 76 79
    % 77 79
    if this.NoiseFlag
        seed.Enabled = 1.0;
    else
        seed.Enabled = 0.0;
    end % if
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    mainParamsPanel = dspGetContainerWidgetBase('group', 'Parameters', 'mainParamsPanel');
    mainParamsPanel.Items = cellhorzcat(maxLength, maxLengthprompt, fc, fcprompt, ts, tsprompt, zs, zsprompt, noiseFlag, seed, seedprompt);
    % 89 91
    mainParamsPanel.LayoutGrid = horzcat(maxrows, numgrid);
    mainParamsPanel.RowSpan = [2.0 2.0];
    mainParamsPanel.ColSpan = [1.0 1.0];
    % 93 96
    % 94 96
    dlgStruct = getBaseSchemaStruct(this, mainParamsPanel);
end % function
