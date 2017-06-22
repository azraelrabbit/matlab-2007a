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
    trellis = dspGetLeafWidgetBase('edit', 'Trellis structure:', 'trellis', this, 'trellis');
    % 15 16
    trellis.Entries = ctranspose(set(this, 'trellis'));
    trellis.RowSpan = [1.0 1.0];
    trellis.ColSpan = [1.0 4.0];
    % 19 21
    % 20 21
    isPunctured = dspGetLeafWidgetBase('checkbox', 'Punctured code', 'isPunctured', this, 'isPunctured');
    % 22 23
    isPunctured.DialogRefresh = 1.0;
    isPunctured.RowSpan = [2.0 2.0];
    isPunctured.ColSpan = [1.0 4.0];
    % 26 29
    % 27 29
    % 28 29
    indentPVStr = dspGetLeafWidgetBase('text', ' ', 'IndentPVStr', 0.0);
    indentPVStr.RowSpan = [3.0 3.0];
    indentPVStr.ColSpan = [1.0 1.0];
    indentPVStr.MinimumSize = [24.0 0.0];
    indentPVStr.MaximumSize = [24.0 24.0];
    % 34 35
    punctureVectorStr = dspGetLeafWidgetBase('text', 'Puncture vector:', 'punctureVectorStr', 0.0);
    % 36 37
    punctureVectorStr.RowSpan = [3.0 3.0];
    punctureVectorStr.ColSpan = [2.0 2.0];
    % 39 40
    indentPV = dspGetLeafWidgetBase('text', ' ', 'IndentPV', 0.0);
    indentPV.RowSpan = [3.0 3.0];
    indentPV.ColSpan = [3.0 3.0];
    indentPV.MinimumSize = [24.0 0.0];
    indentPV.MaximumSize = [24.0 24.0];
    % 45 46
    punctureVector = dspGetLeafWidgetBase('edit', '', 'punctureVector', this, 'punctureVector');
    % 47 48
    punctureVector.Entries = ctranspose(set(this, 'punctureVector'));
    punctureVector.RowSpan = [3.0 3.0];
    punctureVector.ColSpan = [4.0 4.0];
    % 51 53
    % 52 53
    erasures = dspGetLeafWidgetBase('checkbox', 'Enable erasures input port', 'erasures', this, 'erasures');
    % 54 55
    erasures.RowSpan = [4.0 4.0];
    erasures.ColSpan = [1.0 4.0];
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    % 61 62
    dectype = dspGetLeafWidgetBase('combobox', 'Decision type:', 'dectype', this, 'dectype');
    % 63 64
    dectype.Entries = ctranspose(set(this, 'dectype'));
    dectype.DialogRefresh = 1.0;
    dectype.RowSpan = [1.0 1.0];
    dectype.ColSpan = [1.0 4.0];
    % 68 71
    % 69 71
    % 70 71
    indentnsStr = dspGetLeafWidgetBase('text', ' ', 'indentnsStr', 0.0);
    indentnsStr.RowSpan = [2.0 2.0];
    indentnsStr.ColSpan = [1.0 1.0];
    indentnsStr.MinimumSize = [24.0 0.0];
    indentnsStr.MaximumSize = [24.0 24.0];
    % 76 77
    nsdecbStr = dspGetLeafWidgetBase('text', 'Number of soft decision bits:', 'nsdecbStr', 0.0);
    % 78 79
    nsdecbStr.RowSpan = [2.0 2.0];
    nsdecbStr.ColSpan = [2.0 2.0];
    % 81 82
    indentns = dspGetLeafWidgetBase('text', ' ', 'indentns', 0.0);
    indentns.RowSpan = [2.0 2.0];
    indentns.ColSpan = [3.0 3.0];
    indentns.MinimumSize = [24.0 0.0];
    indentns.MaximumSize = [24.0 24.0];
    % 87 88
    nsdecb = dspGetLeafWidgetBase('edit', '', 'nsdecb', this, 'nsdecb');
    nsdecb.Entries = ctranspose(set(this, 'nsdecb'));
    nsdecb.RowSpan = [2.0 2.0];
    nsdecb.ColSpan = [4.0 4.0];
    % 92 95
    % 93 95
    % 94 95
    indentRsvec = dspGetLeafWidgetBase('text', ' ', 'indentRsvec', 0.0);
    indentRsvec.RowSpan = [3.0 3.0];
    indentRsvec.ColSpan = [1.0 1.0];
    indentRsvec.MinimumSize = [24.0 0.0];
    indentRsvec.MaximumSize = [24.0 24.0];
    % 100 101
    runSigValErrCheck = dspGetLeafWidgetBase('checkbox', 'Error if quantized input values are out of range', 'runSigValErrCheck', this, 'runSigValErrCheck');
    % 102 104
    % 103 104
    runSigValErrCheck.RowSpan = [3.0 3.0];
    runSigValErrCheck.ColSpan = [2.0 4.0];
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    % 110 111
    tbdepth = dspGetLeafWidgetBase('edit', 'Traceback depth:', 'tbdepth', this, 'tbdepth');
    % 112 113
    tbdepth.Entries = ctranspose(set(this, 'tbdepth'));
    tbdepth.RowSpan = [1.0 1.0];
    tbdepth.ColSpan = [1.0 4.0];
    % 116 118
    % 117 118
    opmode = dspGetLeafWidgetBase('combobox', 'Operation mode:', 'opmode', this, 'opmode');
    % 119 120
    opmode.Entries = ctranspose(set(this, 'opmode'));
    opmode.DialogRefresh = 1.0;
    opmode.RowSpan = [2.0 2.0];
    opmode.ColSpan = [1.0 4.0];
    % 124 127
    % 125 127
    % 126 127
    indentRst = dspGetLeafWidgetBase('text', ' ', 'indentRst', 0.0);
    indentRst.RowSpan = [3.0 3.0];
    indentRst.ColSpan = [1.0 1.0];
    indentRst.MinimumSize = [24.0 0.0];
    indentRst.MaximumSize = [24.0 24.0];
    % 132 133
    reset = dspGetLeafWidgetBase('checkbox', 'Enable reset input port', 'reset', this, 'reset');
    % 134 135
    reset.RowSpan = [3.0 3.0];
    reset.ColSpan = [2.0 4.0];
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    % 141 142
    fxpDisclaimer = dspGetLeafWidgetBase('text', 'Settings in this group only apply for Hard and Soft decisions with fixed-point input signals.', 'fxpDiscText', 0.0);
    % 143 147
    % 144 147
    % 145 147
    % 146 147
    smWordLength = dspGetLeafWidgetBase('edit', 'State metric word length:', 'smWordLength', this, 'smWordLength');
    % 148 149
    smWordLength.Entries = ctranspose(set(this, 'smWordLength'));
    % 150 152
    % 151 152
    outDataType = dspGetLeafWidgetBase('combobox', 'Output data type:', 'outDataType', this, 'outDataType');
    % 153 154
    outDataType.Entries = ctranspose(set(this, 'outDataType'));
    % 155 159
    % 156 159
    % 157 159
    % 158 159
    if strcmpi(this.dectype, 'Unquantized')
        indentnsStr.Visible = 0.0;
        nsdecbStr.Visible = 0.0;
        indentns.Visible = 0.0;
        nsdecb.Visible = 0.0;
        % 164 165
        indentRsvec.Visible = 0.0;
        runSigValErrCheck.Visible = 0.0;
        fxpDisclaimer.Visible = 0.0;
        smWordLength.Visible = 0.0;
    else
        % 170 172
        % 171 172
        indentRsvec.Visible = 1.0;
        runSigValErrCheck.Visible = 1.0;
        % 174 175
        if strcmpi(this.dectype, 'Soft Decision')
            indentnsStr.Visible = 1.0;
            nsdecbStr.Visible = 1.0;
            indentns.Visible = 1.0;
            nsdecb.Visible = 1.0;
        else
            % 181 182
            indentnsStr.Visible = 0.0;
            nsdecbStr.Visible = 0.0;
            indentns.Visible = 0.0;
            nsdecb.Visible = 0.0;
        end % if
        fxpDisclaimer.Visible = 1.0;
        smWordLength.Visible = 1.0;
    end % if
    % 190 191
    if strcmpi(this.opmode, 'Continuous')
        indentRst.Visible = 1.0;
        reset.Visible = 1.0;
    else
        indentRst.Visible = 0.0;
        reset.Visible = 0.0;
    end % if
    % 198 199
    if this.isPunctured
        indentPVStr.Visible = 1.0;
        punctureVectorStr.Visible = 1.0;
        indentPV.Visible = 1.0;
        punctureVector.Visible = 1.0;
    else
        indentPVStr.Visible = 0.0;
        punctureVectorStr.Visible = 0.0;
        indentPV.Visible = 0.0;
        punctureVector.Visible = 0.0;
    end % if
    % 210 214
    % 211 214
    % 212 214
    % 213 214
    CodeParameterPane = dspGetContainerWidgetBase('group', 'Encoded data parameters', 'CodeParameterPane');
    % 215 217
    % 216 217
    CodeParameterPane.Items = cellhorzcat(trellis, isPunctured, indentPVStr, punctureVectorStr, indentPV, punctureVector, erasures);
    % 218 220
    % 219 220
    CodeParameterPane.LayoutGrid = [4.0 4.0];
    CodeParameterPane.RowSpan = [1.0 1.0];
    CodeParameterPane.ColSpan = [1.0 1.0];
    CodeParameterPane.ColStretch = [0.0 0.0 0.0 1.0];
    % 224 226
    % 225 226
    BMCParameterPane = dspGetContainerWidgetBase('group', 'Branch metric computation parameters', 'BMCParameterPane');
    % 227 229
    % 228 229
    BMCParameterPane.Items = cellhorzcat(dectype, indentnsStr, nsdecbStr, indentns, nsdecb, indentRsvec, runSigValErrCheck);
    % 230 232
    % 231 232
    BMCParameterPane.LayoutGrid = [3.0 4.0];
    BMCParameterPane.RowSpan = [2.0 2.0];
    BMCParameterPane.ColSpan = [1.0 1.0];
    BMCParameterPane.ColStretch = [0.0 0.0 0.0 0.0];
    % 236 238
    % 237 238
    TBDParameterPane = dspGetContainerWidgetBase('group', 'Traceback decoding parameters', 'TBDParameterPane');
    % 239 241
    % 240 241
    TBDParameterPane.Items = cellhorzcat(tbdepth, opmode, indentRst, reset);
    TBDParameterPane.LayoutGrid = [3.0 4.0];
    TBDParameterPane.RowSpan = [3.0 3.0];
    TBDParameterPane.ColSpan = [1.0 1.0];
    TBDParameterPane.ColStretch = [0.0 0.0 0.0 1.0];
    % 246 248
    % 247 248
    fxpParameterPane = dspGetContainerWidgetBase('group', 'Fixed-point parameters', 'fxpParameterPane');
    % 249 251
    % 250 251
    fxpParameterPane.Items = cellhorzcat(fxpDisclaimer, smWordLength);
    fxpParameterPane.RowSpan = [1.0 1.0];
    fxpParameterPane.ColSpan = [1.0 1.0];
    % 254 256
    % 255 256
    outParameterPane = dspGetContainerWidgetBase('group', '', 'outParameterPane');
    outParameterPane.Items = cellhorzcat(outDataType);
    outParameterPane.RowSpan = [2.0 2.0];
    outParameterPane.ColSpan = [1.0 1.0];
    % 260 263
    % 261 263
    % 262 263
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(CodeParameterPane, BMCParameterPane, TBDParameterPane);
    mainTab.LayoutGrid = [3.0 1.0];
    mainTab.RowStretch = [0.0 0.0 0.0];
    mainTab.ColStretch = 0.0;
    % 268 270
    % 269 270
    dTypeTab.Name = 'Data Types';
    if not(strcmpi(this.dectype, 'Unquantized'))
        dTypeTab.Items = cellhorzcat(fxpParameterPane, outParameterPane);
        dTypeTab.LayoutGrid = [2.0 1.0];
    else
        dTypeTab.Items = cellhorzcat(outDataType);
        dTypeTab.LayoutGrid = [1.0 1.0];
    end % if
    dTypeTab.RowStretch = [0.0 0.0];
    dTypeTab.ColStretch = 0.0;
    % 280 282
    % 281 282
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, dTypeTab);
    % 286 288
    % 287 288
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
end % function
