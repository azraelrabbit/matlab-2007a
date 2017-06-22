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
    M = dspGetLeafWidgetBase('edit', 'M-ary number:', 'M', this, 'M');
    M.DialogRefresh = 1.0;
    % 17 19
    M.Visible = 1.0;
    M.Entries = set(this, 'M');
    % 20 23
    % 21 23
    OutType = dspGetLeafWidgetBase('combobox', 'Output type:', 'OutType', this, 'OutType');
    % 23 25
    OutType.DialogRefresh = 1.0;
    % 25 27
    OutType.Visible = 1.0;
    OutType.Entries = ctranspose(set(this, 'OutType'));
    % 28 31
    % 29 31
    Dec = dspGetLeafWidgetBase('combobox', 'Constellation ordering:', 'Dec', this, 'Dec');
    % 31 34
    % 32 34
    Dec.Visible = 1.0;
    Dec.Entries = ctranspose(set(this, 'Dec'));
    % 35 38
    % 36 38
    PowType = dspGetLeafWidgetBase('combobox', 'Normalization method:', 'PowType', this, 'PowType');
    % 38 41
    % 39 41
    PowType.DialogRefresh = 1.0;
    % 41 43
    PowType.Visible = 1.0;
    PowType.Entries = ctranspose(set(this, 'PowType'));
    % 44 47
    % 45 47
    MinDist = dspGetLeafWidgetBase('edit', 'Minimum distance:', 'MinDist', this, 'MinDist');
    % 47 49
    if strcmpi(this.PowType, 'min. distance between symbols')
        MinDist.Visible = 1.0;
    else
        MinDist.Visible = 0.0;
    end % if
    MinDist.Entries = set(this, 'MinDist');
    % 54 57
    % 55 57
    AvgPow = dspGetLeafWidgetBase('edit', 'Average power (watts):', 'AvgPow', this, 'AvgPow');
    % 57 59
    if strcmpi(this.PowType, 'average power')
        AvgPow.Visible = 1.0;
    else
        AvgPow.Visible = 0.0;
    end % if
    AvgPow.Entries = set(this, 'AvgPow');
    % 64 67
    % 65 67
    PeakPow = dspGetLeafWidgetBase('edit', 'Peak power (watts):', 'PeakPow', this, 'PeakPow');
    % 67 69
    if strcmpi(this.PowType, 'peak power')
        PeakPow.Visible = 1.0;
    else
        PeakPow.Visible = 0.0;
    end % if
    PeakPow.Entries = set(this, 'PeakPow');
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    mainParamsPanel = dspGetContainerWidgetBase('panel', 'Parameters', 'mainParamsPanel');
    mainParamsPanel.Items = cellhorzcat(M, OutType, Dec, PowType, MinDist, AvgPow, PeakPow);
    % 81 83
    mainPane = dspGetContainerWidgetBase('group', 'Parameters', 'mainPane');
    mainPane.Items = cellhorzcat(mainParamsPanel);
    mainPane.RowSpan = [2.0 2.0];
    mainPane.ColSpan = [1.0 1.0];
    % 86 104
    % 87 104
    % 88 104
    % 89 104
    % 90 104
    % 91 104
    % 92 104
    % 93 104
    % 94 104
    % 95 104
    % 96 104
    % 97 104
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    dtOutputBlnk1RowSpan = [1.0 1.0];
    dtOutputDTypeRowSpan = [2.0 2.0];
    dtOutputBlnk2RowSpan = [3.0 3.0];
    dtOutputDTypeColSpan = [1.0 4.0];
    % 107 111
    % 108 111
    % 109 111
    dtOutputBlankLinePre = getMPAMPromptWidget('', 'dtOutputBlankLinePre', dtOutputBlnk1RowSpan, dtOutputDTypeColSpan);
    % 111 120
    % 112 120
    % 113 120
    % 114 120
    % 115 120
    % 116 120
    % 117 120
    % 118 120
    outDtype1 = dspGetLeafWidgetBase('combobox', 'Output:', 'outDtype1', this, 'outDtype1');
    % 120 122
    outDtype1.Entries = ctranspose(set(this, 'outDtype1'));
    outDtype1.RowSpan = dtOutputDTypeRowSpan;
    outDtype1.ColSpan = dtOutputDTypeColSpan;
    % 124 127
    % 125 127
    outDtype2 = dspGetLeafWidgetBase('combobox', 'Output:', 'outDtype2', this, 'outDtype2');
    % 127 129
    outDtype2.Entries = ctranspose(set(this, 'outDtype2'));
    outDtype2.RowSpan = dtOutputDTypeRowSpan;
    outDtype2.ColSpan = dtOutputDTypeColSpan;
    % 131 134
    % 132 134
    if strcmpi(this.OutType, 'bit')
        % 134 136
        outDtype1.Visible = 1.0;
        outDtype2.Visible = 0.0;
    else
        % 138 140
        outDtype1.Visible = 0.0;
        outDtype2.Visible = 1.0;
    end % if
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    dtOutputBlankLinePost = getMPAMPromptWidget('', 'dtOutputBlankLinePost', dtOutputBlnk2RowSpan, dtOutputDTypeColSpan);
    % 147 164
    % 148 164
    % 149 164
    % 150 164
    % 151 164
    % 152 164
    % 153 164
    % 154 164
    % 155 164
    % 156 164
    % 157 164
    % 158 164
    % 159 164
    % 160 164
    % 161 164
    % 162 164
    fixptDiscTextRowSpan = [1.0 1.0];
    fixptBlnkLineRowSpan = [2.0 2.0];
    fixptTitleRowSpan = [3.0 3.0];
    fixptDenormFactorRowSpan = [4.0 4.0];
    fixptProductOutRowSpan = [5.0 5.0];
    fixptSumRowSpan = [6.0 6.0];
    % 169 172
    % 170 172
    fixptDTRowPromptColSpan = [1.0 2.0];
    fixptDTModeColSpan = [3.0 4.0];
    fixptSignedStatusColSpan = [5.0 5.0];
    fixptWordLengthColSpan = [6.0 6.0];
    fixptFracLengthColSpan = [7.0 7.0];
    fixptRoundingModeColSpan = [8.0 8.0];
    fixptOverflowModeColSpan = [9.0 9.0];
    fixptOnlyMaxColSpan = [1.0 9.0];
    % 179 182
    % 180 182
    fixptWLEditWidthMax = 84.0;
    fixptWLEditHeightMax = 50.0;
    % 183 187
    % 184 187
    % 185 187
    fixptOnlyDisclaimerText = getMPAMPromptWidget('Settings below apply only when block inputs are fixed-point signals.', 'fixptDiscText', fixptDiscTextRowSpan, fixptOnlyMaxColSpan);
    % 187 194
    % 188 194
    % 189 194
    % 190 194
    % 191 194
    % 192 194
    fixptBlankLineText = getMPAMPromptWidget('', 'fixptBlankLineText', fixptBlnkLineRowSpan, fixptOnlyMaxColSpan);
    % 194 201
    % 195 201
    % 196 201
    % 197 201
    % 198 201
    % 199 201
    modeTitle = getMPAMTitleWidget('Mode', 'modeTitle', fixptTitleRowSpan, fixptDTModeColSpan);
    % 201 204
    % 202 204
    sgnTitle = getMPAMTitleWidget('Signed', 'sgnTitle', fixptTitleRowSpan, fixptSignedStatusColSpan);
    % 204 207
    % 205 207
    wlTitle = getMPAMTitleWidget('Word Length', 'wlTitle', fixptTitleRowSpan, fixptWordLengthColSpan);
    % 207 210
    % 208 210
    flTitle = getMPAMTitleWidget('Fraction Length', 'flTitle', fixptTitleRowSpan, fixptFracLengthColSpan);
    % 210 213
    % 211 213
    rdTitle = getMPAMTitleWidget('Rounding', 'rdTitle', fixptTitleRowSpan, fixptRoundingModeColSpan);
    % 213 216
    % 214 216
    ofTitle = getMPAMTitleWidget('Overflow', 'ofTitle', fixptTitleRowSpan, fixptOverflowModeColSpan);
    % 216 222
    % 217 222
    % 218 222
    % 219 222
    % 220 222
    denormFactorPrompt = getMPAMPromptWidget('Denormalization factor:', 'denormFactorPrompt', fixptDenormFactorRowSpan, fixptDTRowPromptColSpan);
    % 222 225
    % 223 225
    denormFactorDTMode = getMPAMPopupWidget(this, 'denormFactorDTMode', fixptDenormFactorRowSpan, fixptDTModeColSpan);
    % 225 229
    % 226 229
    % 227 229
    denormFactorSignedText = getMPAMTitleWidget('Yes', 'denormFactorSignedText', fixptDenormFactorRowSpan, fixptSignedStatusColSpan);
    % 229 233
    % 230 233
    % 231 233
    denormFactorWordLenText = getMPAMTitleWidget('Same as input', 'denormFactorWordLenText', fixptDenormFactorRowSpan, fixptWordLengthColSpan);
    % 233 237
    % 234 237
    % 235 237
    denormFactorWordLenEdit = dspGetLeafWidgetBase('edit', '', 'denormFactorWordLen', this, 'denormFactorWordLen');
    denormFactorWordLenEdit.Entries = set(this, 'denormFactorWordLen');
    denormFactorWordLenEdit.RowSpan = fixptDenormFactorRowSpan;
    denormFactorWordLenEdit.ColSpan = fixptWordLengthColSpan;
    denormFactorWordLenEdit.Alignment = 5.0;
    denormFactorWordLenEdit.MaximumSize = horzcat(fixptWLEditWidthMax, fixptWLEditHeightMax);
    % 242 245
    % 243 245
    if strcmpi(this.denormFactorDTMode, 'specify word length')
        denormFactorWordLenEdit.Visible = 1.0;
        denormFactorWordLenText.Visible = 0.0;
    else
        denormFactorWordLenEdit.Visible = 0.0;
        denormFactorWordLenText.Visible = 1.0;
    end % if
    % 251 253
    denormFactorFracLenText = getMPAMTitleWidget('Best precision', 'denormFactorFracLenText', fixptDenormFactorRowSpan, fixptFracLengthColSpan);
    % 253 257
    % 254 257
    % 255 257
    denormFactorRoundModeText = getMPAMTitleWidget('Nearest', 'denormFactorRoundModeText', fixptDenormFactorRowSpan, fixptRoundingModeColSpan);
    % 257 261
    % 258 261
    % 259 261
    denormFactorOvrflModeText = getMPAMTitleWidget('Saturate', 'denormFactorOvrflModeText', fixptDenormFactorRowSpan, fixptOverflowModeColSpan);
    % 261 268
    % 262 268
    % 263 268
    % 264 268
    % 265 268
    % 266 268
    prodOutPrompt = getMPAMPromptWidget('Product output:', 'prodOutPrompt', fixptProductOutRowSpan, fixptDTRowPromptColSpan);
    % 268 271
    % 269 271
    prodOutDTMode = getMPAMPopupWidget(this, 'prodOutDTMode', fixptProductOutRowSpan, fixptDTModeColSpan);
    % 271 275
    % 272 275
    % 273 275
    prodOutSignedText = getMPAMTitleWidget('Yes', 'prodOutSignedText', fixptProductOutRowSpan, fixptSignedStatusColSpan);
    % 275 279
    % 276 279
    % 277 279
    prodOutWordLenText = getMPAMTitleWidget('Inherited', 'prodOutWordLenText', fixptProductOutRowSpan, fixptWordLengthColSpan);
    % 279 283
    % 280 283
    % 281 283
    prodOutWordLenEdit = dspGetLeafWidgetBase('edit', '', 'prodOutWordLen', this, 'prodOutWordLen');
    prodOutWordLenEdit.DialogRefresh = 1.0;
    % 284 286
    prodOutWordLenEdit.Entries = set(this, 'prodOutWordLen');
    prodOutWordLenEdit.RowSpan = fixptProductOutRowSpan;
    prodOutWordLenEdit.ColSpan = fixptWordLengthColSpan;
    prodOutWordLenEdit.Alignment = 5.0;
    prodOutWordLenEdit.MaximumSize = horzcat(fixptWLEditWidthMax, fixptWLEditHeightMax);
    % 290 293
    % 291 293
    if strcmpi(this.prodOutDTMode, 'specify word length')
        prodOutWordLenEdit.Visible = 1.0;
        prodOutWordLenText.Visible = 0.0;
    else
        prodOutWordLenEdit.Visible = 0.0;
        prodOutWordLenText.Visible = 1.0;
    end % if
    % 299 301
    prodOutFracLenText = getMPAMTitleWidget('2', 'prodOutFracLenText', fixptProductOutRowSpan, fixptFracLengthColSpan);
    % 301 304
    % 302 304
    prodOutRoundingMode = getMPAMPopupWidget(this, 'prodOutRoundingMode', fixptProductOutRowSpan, fixptRoundingModeColSpan);
    % 304 308
    % 305 308
    % 306 308
    prodOutOverflowMode = getMPAMPopupWidget(this, 'prodOutOverflowMode', fixptProductOutRowSpan, fixptOverflowModeColSpan);
    % 308 315
    % 309 315
    % 310 315
    % 311 315
    % 312 315
    % 313 315
    sumPrompt = getMPAMPromptWidget('Sum:', 'sumPrompt', fixptSumRowSpan, fixptDTRowPromptColSpan);
    % 315 318
    % 316 318
    sumDTMode = getMPAMPopupWidget(this, 'sumDTMode', fixptSumRowSpan, fixptDTModeColSpan);
    % 318 322
    % 319 322
    % 320 322
    sumSignedText = getMPAMTitleWidget('Yes', 'sumSignedText', fixptSumRowSpan, fixptSignedStatusColSpan);
    % 322 327
    % 323 327
    % 324 327
    % 325 327
    if strcmpi(this.sumDTMode, 'same as product output') && strcmpi(this.prodOutDTMode, 'specify word length')
        sumWLTextStr = get(this, 'prodOutWordLen');
    else
        sumWLTextStr = 'Inherited';
    end % if
    sumWordLenText = getMPAMTitleWidget(sumWLTextStr, 'sumWordLenText', fixptSumRowSpan, fixptWordLengthColSpan);
    % 332 335
    % 333 335
    sumWordLenEdit = dspGetLeafWidgetBase('edit', '', 'sumWordLen', this, 'sumWordLen');
    sumWordLenEdit.Entries = set(this, 'sumWordLen');
    sumWordLenEdit.RowSpan = fixptSumRowSpan;
    sumWordLenEdit.ColSpan = fixptWordLengthColSpan;
    sumWordLenEdit.Alignment = 5.0;
    sumWordLenEdit.MaximumSize = horzcat(fixptWLEditWidthMax, fixptWLEditHeightMax);
    % 340 343
    % 341 343
    if strcmpi(this.sumDTMode, 'specify word length')
        sumWordLenEdit.Visible = 1.0;
        sumWordLenText.Visible = 0.0;
    else
        sumWordLenEdit.Visible = 0.0;
        sumWordLenText.Visible = 1.0;
    end % if
    % 349 351
    sumFracLenText = getMPAMTitleWidget('2', 'sumFracLenText', fixptSumRowSpan, fixptFracLengthColSpan);
    % 351 354
    % 352 354
    sumRoundModeText = getMPAMTitleWidget('Nearest', 'sumRoundModeText', fixptSumRowSpan, fixptRoundingModeColSpan);
    % 354 357
    % 355 357
    sumOvrflModeText = getMPAMTitleWidget('Saturate', 'sumOvrflModeText', fixptSumRowSpan, fixptOverflowModeColSpan);
    % 357 363
    % 358 363
    % 359 363
    % 360 363
    % 361 363
    fixptParamsPanel = dspGetContainerWidgetBase('panel', '', 'fixptParamsPanel');
    fixptParamsPanel.LayoutGrid = [6.0 9.0];
    fixptParamsPanel.Items = cellhorzcat(fixptOnlyDisclaimerText, fixptBlankLineText, modeTitle, sgnTitle, wlTitle, flTitle, rdTitle, ofTitle, denormFactorPrompt, denormFactorDTMode, denormFactorSignedText, denormFactorWordLenEdit, denormFactorWordLenText, denormFactorFracLenText, denormFactorRoundModeText, denormFactorOvrflModeText, prodOutPrompt, prodOutDTMode, prodOutSignedText, prodOutWordLenEdit, prodOutWordLenText, prodOutFracLenText, prodOutRoundingMode, prodOutOverflowMode, sumPrompt, sumDTMode, sumSignedText, sumWordLenEdit, sumWordLenText, sumFracLenText, sumRoundModeText, sumOvrflModeText);
    % 365 400
    % 366 400
    % 367 400
    % 368 400
    % 369 400
    % 370 400
    % 371 400
    % 372 400
    % 373 400
    % 374 400
    % 375 400
    % 376 400
    % 377 400
    % 378 400
    % 379 400
    % 380 400
    % 381 400
    % 382 400
    % 383 400
    % 384 400
    % 385 400
    % 386 400
    % 387 400
    % 388 400
    % 389 400
    % 390 400
    % 391 400
    % 392 400
    % 393 400
    % 394 400
    % 395 400
    % 396 400
    % 397 400
    % 398 400
    fixptParamsPane = dspGetContainerWidgetBase('group', 'Fixed-point algorithm parameters', 'fixptParamsPane');
    fixptParamsPane.Items = cellhorzcat(fixptParamsPanel);
    fixptParamsPane.RowSpan = [4.0 4.0];
    fixptParamsPane.ColSpan = fixptOnlyMaxColSpan;
    % 403 414
    % 404 414
    % 405 414
    % 406 414
    % 407 414
    % 408 414
    % 409 414
    % 410 414
    % 411 414
    % 412 414
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [3.0 1.0];
    mainTab.RowStretch = [0.0 0.0 1.0];
    % 417 420
    % 418 420
    dtypesTab.Name = 'Data Types';
    dtypesTab.Items = cellhorzcat(dtOutputBlankLinePre, outDtype1, outDtype2, dtOutputBlankLinePost, fixptParamsPane);
    % 421 425
    % 422 425
    % 423 425
    dtypesTabTotNumRows = 4.0;
    dtypesTabTotNumCols = max(fixptOnlyMaxColSpan);
    dtypesTab.LayoutGrid = horzcat(dtypesTabTotNumRows, dtypesTabTotNumCols);
    dtypesTab.RowStretch = horzcat(zeros(1.0, minus(dtypesTabTotNumRows, 1.0)), 1.0);
    % 428 431
    % 429 431
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, dtypesTab);
    % 434 439
    % 435 439
    % 436 439
    % 437 439
    dlgStruct = getBaseSchemaStruct(this, tabbedPane);
end % function
function titleText = getMPAMTitleWidget(textStr, tag, rowSpan, colSpan)
    % 441 443
    titleText = getMPAMPromptWidget(textStr, tag, rowSpan, colSpan);
    titleText.Alignment = 5.0;
end % function
function promptText = getMPAMPromptWidget(promptStr, tag, rowSpan, colSpan)
    % 446 448
    promptText = dspGetLeafWidgetBase('text', promptStr, tag, 0.0);
    promptText.RowSpan = rowSpan;
    promptText.ColSpan = colSpan;
    promptText.Alignment = 4.0;
end % function
function popupWidget = getMPAMPopupWidget(this, tagAndProp, rowSpan, colSpan)
    % 453 455
    popupWidget.Type = 'combobox';
    popupWidget.Tag = tagAndProp;
    popupWidget.ObjectProperty = tagAndProp;
    popupWidget.RowSpan = rowSpan;
    popupWidget.ColSpan = colSpan;
    popupWidget.Entries = ctranspose(set(this, tagAndProp));
    popupWidget.MatlabMethod = 'dspDDGSync';
    popupWidget.MatlabArgs = cellhorzcat(this, '%dialog', '%tag');
    popupWidget.Mode = 1.0;
    popupWidget.Tunable = 0.0;
    popupWidget.Visible = 1.0;
    popupWidget.DialogRefresh = 1.0;
end % function
