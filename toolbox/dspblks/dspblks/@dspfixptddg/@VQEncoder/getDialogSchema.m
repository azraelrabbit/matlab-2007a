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
    CBsource = dspGetLeafWidgetBase('combobox', 'Source of codebook:', 'CBsource', this, 'CBsource');
    % 14 15
    CBsource.Entries = ctranspose(set(this, 'CBsource'));
    CBsource.DialogRefresh = 1.0;
    % 17 18
    codebook = dspGetLeafWidgetBase('edit', 'Codebook:', 'codebook', this, 'codebook');
    % 19 20
    codebook.Tunable = 1.0;
    % 21 22
    distMeasure = dspGetLeafWidgetBase('combobox', 'Distortion measure:', 'distMeasure', this, 'distMeasure');
    % 23 24
    distMeasure.Entries = ctranspose(set(this, 'distMeasure'));
    distMeasure.DialogRefresh = 1.0;
    % 26 27
    wgtSrc = dspGetLeafWidgetBase('combobox', 'Source of weighting factor:', 'wgtSrc', this, 'wgtSrc');
    % 28 29
    wgtSrc.Entries = ctranspose(set(this, 'wgtSrc'));
    wgtSrc.DialogRefresh = 1.0;
    % 31 32
    weights = dspGetLeafWidgetBase('edit', 'Weighting factor:', 'weights', this, 'weights');
    % 33 34
    weights.Tunable = 1.0;
    % 35 36
    tieBreakRule = dspGetLeafWidgetBase('combobox', 'Tie-breaking rule:', 'tieBreakRule', this, 'tieBreakRule');
    % 37 38
    tieBreakRule.Entries = ctranspose(set(this, 'tieBreakRule'));
    % 39 40
    outQU = dspGetLeafWidgetBase('checkbox', 'Output codeword', 'outQU', this, 'outQU');
    % 41 43
    % 42 43
    outQError = dspGetLeafWidgetBase('checkbox', 'Output quantization error', 'outQError', this, 'outQError');
    % 44 46
    % 45 46
    idtype = dspGetLeafWidgetBase('combobox', 'Index output data type:', 'idtype', this, 'idtype');
    % 47 48
    idtype.Entries = ctranspose(set(this, 'idtype'));
    % 49 50
    if strcmp(this.CBsource, 'Specify via dialog')
        codebook.Visible = 1.0;
    else
        codebook.Visible = 0.0;
    end % if
    % 55 56
    if strcmp(this.distMeasure, 'Weighted squared error')
        wgtSrc.Visible = 1.0;
        if strcmp(this.wgtSrc, 'Specify via dialog')
            weights.Visible = 1.0;
        else
            weights.Visible = 0.0;
        end % if
    else
        wgtSrc.Visible = 0.0;
        weights.Visible = 0.0;
    end % if
    % 67 68
    items = cellhorzcat(CBsource, codebook, distMeasure, wgtSrc, weights, tieBreakRule, outQU, outQError, idtype);
    % 69 79
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    dlgStruct = this.getRootSchemaStruct(items);
end % function
