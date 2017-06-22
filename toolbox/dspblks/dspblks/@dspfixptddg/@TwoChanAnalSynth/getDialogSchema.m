function dlgStruct = getDialogSchema(this, dummy)
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
    lpf = dspGetLeafWidgetBase('edit', 'Lowpass FIR filter coefficients:', 'lpf', this, 'lpf');
    % 15 18
    % 16 18
    % 17 18
    hpf = dspGetLeafWidgetBase('edit', 'Highpass FIR filter coefficients:', 'hpf', this, 'hpf');
    % 19 20
    hpf.Tunable = 1.0;
    % 21 23
    % 22 23
    framing = dspGetLeafWidgetBase('combobox', 'Framing:', 'framing', this, 'framing');
    % 24 25
    framing.Entries = ctranspose(set(this, 'framing'));
    % 26 27
    items = cellhorzcat(lpf, hpf, framing);
    % 28 29
    dlgStruct = this.getRootSchemaStruct(items);
    % 30 31
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 33 34
end % function
