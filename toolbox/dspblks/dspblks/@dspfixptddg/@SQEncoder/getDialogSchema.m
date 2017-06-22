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
    paramSrc = dspGetLeafWidgetBase('combobox', 'Source of quantizer parameters:', 'paramSrc', this, 'paramSrc');
    % 14 15
    paramSrc.Entries = ctranspose(set(this, 'paramSrc'));
    paramSrc.DialogRefresh = 1.0;
    % 17 18
    partType = dspGetLeafWidgetBase('combobox', 'Partitioning:', 'partType', this, 'partType');
    % 19 20
    partType.Entries = ctranspose(set(this, 'partType'));
    partType.DialogRefresh = 1.0;
    % 22 23
    BBoundary = dspGetLeafWidgetBase('edit', 'Boundary points:', 'BBoundary', this, 'BBoundary');
    % 24 25
    BBoundary.Tunable = 1.0;
    % 26 27
    UBoundary = dspGetLeafWidgetBase('edit', 'Boundary points:', 'UBoundary', this, 'UBoundary');
    % 28 29
    UBoundary.Tunable = 1.0;
    % 30 31
    SearchMethod = dspGetLeafWidgetBase('combobox', 'Searching method:', 'SearchMethod', this, 'SearchMethod');
    % 32 33
    SearchMethod.Entries = ctranspose(set(this, 'SearchMethod'));
    % 34 35
    tieBreakRule = dspGetLeafWidgetBase('combobox', 'Tie-breaking rule:', 'tieBreakRule', this, 'tieBreakRule');
    % 36 37
    tieBreakRule.Entries = ctranspose(set(this, 'tieBreakRule'));
    % 38 39
    outQU = dspGetLeafWidgetBase('checkbox', 'Output codeword', 'outQU', this, 'outQU');
    % 40 41
    outQU.DialogRefresh = 1.0;
    % 42 43
    outQError = dspGetLeafWidgetBase('checkbox', 'Output quantization error', 'outQError', this, 'outQError');
    % 44 45
    outQError.DialogRefresh = 1.0;
    % 46 47
    codebook = dspGetLeafWidgetBase('edit', 'Codebook:', 'codebook', this, 'codebook');
    % 48 49
    codebook.Tunable = 1.0;
    % 50 51
    outStatus = dspGetLeafWidgetBase('checkbox', 'Output clipping status', 'outStatus', this, 'outStatus');
    % 52 54
    % 53 54
    invalidin = dspGetLeafWidgetBase('combobox', 'Action for out of range input:', 'invalidin', this, 'invalidin');
    % 55 56
    invalidin.Entries = ctranspose(set(this, 'invalidin'));
    % 57 58
    idtype = dspGetLeafWidgetBase('combobox', 'Index output data type:', 'idtype', this, 'idtype');
    % 59 60
    idtype.Entries = ctranspose(set(this, 'idtype'));
    % 61 62
    if strcmp(this.paramSrc, 'Specify via dialog')
        if strcmp(this.partType, 'Bounded')
            BBoundary.Visible = 1.0;
            UBoundary.Visible = 0.0;
        else
            BBoundary.Visible = 0.0;
            UBoundary.Visible = 1.0;
        end % if
        if this.outQU || this.outQError
            codebook.Visible = 1.0;
        else
            codebook.Visible = 0.0;
        end % if
    else
        BBoundary.Visible = 0.0;
        UBoundary.Visible = 0.0;
        codebook.Visible = 0.0;
    end % if
    % 80 81
    if strcmp(this.partType, 'Bounded')
        outStatus.Visible = 1.0;
        invalidin.Visible = 1.0;
    else
        outStatus.Visible = 0.0;
        invalidin.Visible = 0.0;
    end % if
    % 88 89
    items = cellhorzcat(paramSrc, partType, BBoundary, UBoundary, SearchMethod, tieBreakRule, outQU, outQError, codebook, outStatus, invalidin, idtype);
    % 90 103
    % 91 103
    % 92 103
    % 93 103
    % 94 103
    % 95 103
    % 96 103
    % 97 103
    % 98 103
    % 99 103
    % 100 103
    % 101 103
    % 102 103
    dlgStruct = this.getRootSchemaStruct(items);
end % function
