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
    methodInputRange = dspGetLeafWidgetBase('combobox', 'Adjust pixel values from:', 'methodInputRange', this, 'methodInputRange');
    % 14 18
    % 15 18
    % 16 18
    method.Entries = ctranspose(set(this, 'methodInputRange'));
    methodInputRange.DialogRefresh = 1.0;
    % 19 21
    rangeIn = dspGetLeafWidgetBase('edit', 'Range [low high]:', 'rangeIn', this, 'rangeIn');
    % 21 23
    rangeIn.DialogRefresh = 1.0;
    rangeIn.Tunable = 1.0;
    % 24 26
    fracSaturate = dspGetLeafWidgetBase('edit', 'Percentage of pixels to saturate [low high] (in %):', 'fracSaturate', this, 'fracSaturate');
    % 26 29
    % 27 29
    fracSaturate.DialogRefresh = 1.0;
    fracSaturate.Tunable = 1.0;
    % 30 32
    isBinNum = dspGetLeafWidgetBase('checkbox', 'Specify number of histogram bins (used to calculate the range when outliers are eliminated)', 'isBinNum', this, 'isBinNum');
    % 32 35
    % 33 35
    isBinNum.DialogRefresh = 1.0;
    % 35 37
    binNum = dspGetLeafWidgetBase('edit', 'Number of histogram bins:', 'binNum', this, 'binNum');
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    methodOutputRange = dspGetLeafWidgetBase('combobox', 'Adjust pixel values to:', 'methodOutputRange', this, 'methodOutputRange');
    % 42 45
    % 43 45
    methodOutputRange.DialogRefresh = 1.0;
    % 45 47
    rangeOut = dspGetLeafWidgetBase('edit', 'Range [low high]:', 'rangeOut', this, 'rangeOut');
    % 47 49
    rangeOut.DialogRefresh = 1.0;
    rangeOut.Tunable = 1.0;
    % 50 52
    rangeIn.Visible = 0.0;
    fracSaturate.Visible = 0.0;
    isBinNum.Visible = 0.0;
    binNum.Visible = 0.0;
    rangeOut.Visible = 0.0;
    % 56 58
    if strcmp(this.methodInputRange, xlate('User-defined range'))
        rangeIn.Visible = 1.0;
        this.FixptDialog.DataTypeRows(2.0).Visible = 0.0;
    else
        if strcmp(this.methodInputRange, xlate('Range determined by saturating outlier pixels'))
            fracSaturate.Visible = 1.0;
            isBinNum.Visible = 1.0;
            binNum.Visible = 1.0;
            if this.isBinNum
                binNum.Enabled = 1.0;
            else
                binNum.Enabled = 0.0;
            end % if
            this.FixptDialog.DataTypeRows(2.0).Visible = 1.0;
        else
            this.FixptDialog.DataTypeRows(2.0).Visible = 0.0;
        end % if
        % 74 76
    end % if
    if strcmp(this.methodOutputRange, xlate('User-defined range'))
        rangeOut.Visible = 1.0;
    end % if
    items = cellhorzcat(methodInputRange, rangeIn, fracSaturate, isBinNum, binNum, methodOutputRange, rangeOut);
    % 80 82
    dlgStruct = this.getRootSchemaStruct(items);
end % function
