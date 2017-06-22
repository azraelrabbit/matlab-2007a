function dlgStruct = getDialogSchema(this, dummy)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    MStr = dspGetLeafWidgetBase('text', 'M-ary number:', 'MStr', 0.0);
    MStr.RowSpan = [1.0 1.0];
    MStr.ColSpan = [1.0 1.0];
    % 19 22
    % 20 22
    M = dspGetLeafWidgetBase('edit', '', 'M', this, 'M');
    M.Entries = set(this, 'M');
    M.RowSpan = [1.0 1.0];
    M.ColSpan = [2.0 2.0];
    % 25 28
    % 26 28
    PowTypeStr = dspGetLeafWidgetBase('text', 'Normalization method:', 'PowTypeStr', 0.0);
    PowTypeStr.RowSpan = [2.0 2.0];
    PowTypeStr.ColSpan = [1.0 1.0];
    % 30 33
    % 31 33
    PowType = dspGetLeafWidgetBase('combobox', '', 'PowType', this, 'PowType');
    PowType.DialogRefresh = 1.0;
    % 34 37
    % 35 37
    PowType.Entries = ctranspose(set(this, 'PowType'));
    PowType.RowSpan = [2.0 2.0];
    PowType.ColSpan = [2.0 2.0];
    % 39 42
    % 40 42
    MinDistStr = dspGetLeafWidgetBase('text', 'Minimum distance:', 'MinDistStr', 0.0);
    % 42 44
    MinDistStr.RowSpan = [3.0 3.0];
    MinDistStr.ColSpan = [1.0 1.0];
    % 45 48
    % 46 48
    MinDist = dspGetLeafWidgetBase('edit', '', 'MinDist', this, 'MinDist');
    % 48 50
    MinDist.Entries = set(this, 'MinDist');
    MinDist.RowSpan = [3.0 3.0];
    MinDist.ColSpan = [2.0 2.0];
    % 52 55
    % 53 55
    AvgPowStr = dspGetLeafWidgetBase('text', 'Average power (watts):', 'AvgPowStr', 0.0);
    AvgPowStr.RowSpan = [3.0 3.0];
    AvgPowStr.ColSpan = [1.0 1.0];
    % 57 60
    % 58 60
    AvgPow = dspGetLeafWidgetBase('edit', '', 'AvgPow', this, 'AvgPow');
    % 60 62
    AvgPow.Entries = set(this, 'AvgPow');
    AvgPow.RowSpan = [3.0 3.0];
    AvgPow.ColSpan = [2.0 2.0];
    % 64 67
    % 65 67
    PeakPowStr = dspGetLeafWidgetBase('text', 'Peak power (watts):', 'PeakPowStr', 0.0);
    PeakPowStr.RowSpan = [3.0 3.0];
    PeakPowStr.ColSpan = [1.0 1.0];
    % 69 72
    % 70 72
    PeakPow = dspGetLeafWidgetBase('edit', '', 'PeakPow', this, 'PeakPow');
    % 72 74
    PeakPow.Entries = set(this, 'PeakPow');
    PeakPow.RowSpan = [3.0 3.0];
    PeakPow.ColSpan = [2.0 2.0];
    % 76 79
    % 77 79
    MinDistStr.Visible = 0.0;
    MinDist.Visible = 0.0;
    AvgPowStr.Visible = 0.0;
    AvgPow.Visible = 0.0;
    PeakPowStr.Visible = 0.0;
    PeakPow.Visible = 0.0;
    % 84 86
    if strcmpi(this.PowType, 'min. distance between symbols')
        MinDistStr.Visible = 1.0;
        MinDist.Visible = 1.0;
    else
        if strcmpi(this.PowType, 'average power')
            AvgPowStr.Visible = 1.0;
            AvgPow.Visible = 1.0;
        else
            PeakPowStr.Visible = 1.0;
            PeakPow.Visible = 1.0;
        end % if
        % 96 99
        % 97 99
    end % if
    PhStr = dspGetLeafWidgetBase('text', 'Phase offset (rad):', 'PhStr', 0.0);
    PhStr.RowSpan = [4.0 4.0];
    PhStr.ColSpan = [1.0 1.0];
    % 102 104
    Ph = dspGetLeafWidgetBase('edit', '', 'Ph', this, 'Ph');
    Ph.Entries = set(this, 'Ph');
    Ph.RowSpan = [4.0 4.0];
    Ph.ColSpan = [2.0 2.0];
    % 107 110
    % 108 110
    DecStr = dspGetLeafWidgetBase('text', 'Constellation ordering:', 'DecStr', 0.0);
    DecStr.RowSpan = [5.0 5.0];
    DecStr.ColSpan = [1.0 1.0];
    % 112 115
    % 113 115
    Dec = dspGetLeafWidgetBase('combobox', '', 'Dec', this, 'Dec');
    % 115 117
    Dec.DialogRefresh = 1.0;
    % 117 120
    % 118 120
    Dec.Entries = ctranspose(set(this, 'Dec'));
    Dec.RowSpan = [5.0 5.0];
    Dec.ColSpan = [2.0 2.0];
    % 122 125
    % 123 125
    MappingStr = dspGetLeafWidgetBase('text', 'Constellation mapping:', 'MappingStr', 0.0);
    % 125 127
    MappingStr.RowSpan = [6.0 6.0];
    MappingStr.ColSpan = [1.0 1.0];
    % 128 131
    % 129 131
    Mapping = dspGetLeafWidgetBase('edit', '', 'Mapping', this, 'Mapping');
    % 131 133
    Mapping.Entries = ctranspose(set(this, 'Mapping'));
    Mapping.RowSpan = [6.0 6.0];
    Mapping.ColSpan = [2.0 2.0];
    % 135 137
    if strcmpi(this.Dec, 'user-defined')
        MappingStr.Visible = 1.0;
        Mapping.Visible = 1.0;
    else
        MappingStr.Visible = 0.0;
        Mapping.Visible = 0.0;
    end % if
    % 143 146
    % 144 146
    lineSpace = dspGetLeafWidgetBase('text', ' ', 'lineSpace', 0.0);
    lineSpace.RowSpan = [7.0 7.0];
    lineSpace.ColSpan = [1.0 2.0];
    % 148 151
    % 149 151
    OutTypeStr = dspGetLeafWidgetBase('text', 'Output type:', 'OutTypeStr', 0.0);
    OutTypeStr.RowSpan = [8.0 8.0];
    OutTypeStr.ColSpan = [1.0 1.0];
    % 153 156
    % 154 156
    OutType = dspGetLeafWidgetBase('combobox', '', 'OutType', this, 'OutType');
    % 156 158
    OutType.DialogRefresh = 1.0;
    % 158 161
    % 159 161
    OutType.Entries = ctranspose(set(this, 'OutType'));
    OutType.RowSpan = [8.0 8.0];
    OutType.ColSpan = [2.0 2.0];
    % 163 167
    % 164 167
    % 165 167
    DecTypeStr = dspGetLeafWidgetBase('text', 'Decision type:', 'DecTypeStr', 0.0);
    DecTypeStr.RowSpan = [9.0 9.0];
    DecTypeStr.ColSpan = [1.0 1.0];
    % 169 172
    % 170 172
    DecType = dspGetLeafWidgetBase('combobox', '', 'DecType', this, 'DecType');
    % 172 174
    DecType.DialogRefresh = 1.0;
    % 174 177
    % 175 177
    DecType.Entries = ctranspose(set(this, 'DecType'));
    DecType.RowSpan = [9.0 9.0];
    DecType.ColSpan = [2.0 2.0];
    % 179 181
    if strcmpi(this.OutType, 'bit')
        DecTypeStr.Visible = 1.0;
        DecType.Visible = 1.0;
    else
        DecTypeStr.Visible = 0.0;
        DecType.Visible = 0.0;
    end % if
    % 187 190
    % 188 190
    VarSourceStr = dspGetLeafWidgetBase('text', 'Noise variance source:', 'VarSourceStr', 0.0);
    % 190 192
    VarSourceStr.RowSpan = [10.0 10.0];
    VarSourceStr.ColSpan = [1.0 1.0];
    % 193 196
    % 194 196
    VarSource = dspGetLeafWidgetBase('combobox', '', 'VarSource', this, 'VarSource');
    % 196 198
    VarSource.DialogRefresh = 1.0;
    % 198 202
    % 199 202
    % 200 202
    VarSource.Entries = ctranspose(set(this, 'VarSource'));
    VarSource.RowSpan = [10.0 10.0];
    VarSource.ColSpan = [2.0 2.0];
    % 204 206
    if eq(DecType.Visible, 1.0) && not(strcmpi(this.DecType, 'hard decision'))
        VarSourceStr.Visible = 1.0;
        VarSource.Visible = 1.0;
    else
        VarSourceStr.Visible = 0.0;
        VarSource.Visible = 0.0;
    end % if
    % 212 215
    % 213 215
    VarianceStr = dspGetLeafWidgetBase('text', 'Noise variance:', 'VarianceStr', 0.0);
    VarianceStr.RowSpan = [11.0 11.0];
    VarianceStr.ColSpan = [1.0 1.0];
    % 217 220
    % 218 220
    Variance = dspGetLeafWidgetBase('edit', '', 'Variance', this, 'Variance');
    % 220 222
    Variance.Entries = set(this, 'Variance');
    Variance.RowSpan = [11.0 11.0];
    Variance.ColSpan = [2.0 2.0];
    % 224 226
    if eq(VarSource.Visible, 1.0) && strcmpi(this.VarSource, 'dialog')
        VarianceStr.Visible = 1.0;
        Variance.Visible = 1.0;
        Variance.Tunable = 1.0;
    else
        VarianceStr.Visible = 0.0;
        Variance.Visible = 0.0;
        Variance.Tunable = 0.0;
    end % if
    % 234 240
    % 235 240
    % 236 240
    % 237 240
    % 238 240
    mainParamsPanel = dspGetContainerWidgetBase('group', 'Parameters', 'mainParamsPanel');
    mainParamsPanel.Items = cellhorzcat(MStr, M, PowTypeStr, PowType, MinDistStr, MinDist, AvgPowStr, AvgPow, PeakPowStr, PeakPow, PhStr, Ph, DecStr, Dec, MappingStr, Mapping, lineSpace, OutTypeStr, OutType, DecTypeStr, DecType, VarSourceStr, VarSource, VarianceStr, Variance);
    % 241 253
    % 242 253
    % 243 253
    % 244 253
    % 245 253
    % 246 253
    % 247 253
    % 248 253
    % 249 253
    % 250 253
    % 251 253
    mainParamsPanel.LayoutGrid = [11.0 2.0];
    mainParamsPanel.RowSpan = [2.0 2.0];
    mainParamsPanel.ColSpan = [1.0 1.0];
    mainParamsPanel.ColStretch = [0.0 1.0];
    % 256 273
    % 257 273
    % 258 273
    % 259 273
    % 260 273
    % 261 273
    % 262 273
    % 263 273
    % 264 273
    % 265 273
    % 266 273
    % 267 273
    % 268 273
    % 269 273
    % 270 273
    % 271 273
    dtOutputBlnk1RowSpan = [1.0 1.0];
    dtOutputDTypeRowSpan = [2.0 2.0];
    dtOutputBlnk2RowSpan = [3.0 3.0];
    dtOutputDTypeColSpan = [1.0 4.0];
    % 276 280
    % 277 280
    % 278 280
    dtOutputBlankLinePre = dspGetLeafWidgetBase('text', '', 'dtOutputBlankLinePre', 0.0);
    % 280 282
    dtOutputBlankLinePre.RowSpan = dtOutputBlnk1RowSpan;
    dtOutputBlankLinePre.ColSpan = dtOutputDTypeColSpan;
    % 283 290
    % 284 290
    % 285 290
    % 286 290
    % 287 290
    % 288 290
    outDtype1 = dspGetLeafWidgetBase('combobox', 'Output:', 'outDtype1', this, 'outDtype1');
    % 290 292
    outDtype1.Entries = ctranspose(set(this, 'outDtype1'));
    outDtype1.RowSpan = dtOutputDTypeRowSpan;
    outDtype1.ColSpan = dtOutputDTypeColSpan;
    % 294 297
    % 295 297
    outDtype2 = dspGetLeafWidgetBase('combobox', 'Output:', 'outDtype2', this, 'outDtype2');
    % 297 299
    outDtype2.Entries = ctranspose(set(this, 'outDtype2'));
    outDtype2.RowSpan = dtOutputDTypeRowSpan;
    outDtype2.ColSpan = dtOutputDTypeColSpan;
    % 301 304
    % 302 304
    outDtype3 = dspGetLeafWidgetBase('text', 'Output: Same as input', 'outDtype3', 0.0);
    % 304 306
    outDtype3.RowSpan = dtOutputDTypeRowSpan;
    outDtype3.ColSpan = dtOutputDTypeColSpan;
    % 307 310
    % 308 310
    if strcmpi(this.OutType, 'bit')
        % 310 312
        outDtype2.Visible = 0.0;
        if strcmpi(this.DecType, 'hard decision')
            outDtype1.Visible = 1.0;
            outDtype3.Visible = 0.0;
        else
            outDtype1.Visible = 0.0;
            outDtype3.Visible = 1.0;
        end % if
    else
        % 320 322
        outDtype1.Visible = 0.0;
        outDtype2.Visible = 1.0;
        outDtype3.Visible = 0.0;
    end % if
    % 325 330
    % 326 330
    % 327 330
    % 328 330
    dtOutputBlankLinePost = dspGetLeafWidgetBase('text', '', 'dtOutputBlankLinePost', 0.0);
    % 330 332
    dtOutputBlankLinePost.RowSpan = dtOutputBlnk2RowSpan;
    dtOutputBlankLinePost.ColSpan = dtOutputDTypeColSpan;
    % 333 350
    % 334 350
    % 335 350
    % 336 350
    % 337 350
    % 338 350
    % 339 350
    % 340 350
    % 341 350
    % 342 350
    % 343 350
    % 344 350
    % 345 350
    % 346 350
    % 347 350
    % 348 350
    fixptDiscTextRowSpan = [1.0 1.0];
    fixptBlnkLineRowSpan = [2.0 2.0];
    fixptTitleRowSpan = [3.0 3.0];
    fixptDerotateFactorRowSpan = [4.0 4.0];
    fixptDenormFactorRowSpan = [5.0 5.0];
    fixptProductOutRowSpan = [6.0 6.0];
    fixptSumRowSpan = [7.0 7.0];
    fixptOnlyMaxRowIndex = 7.0;
    % 357 360
    % 358 360
    fixptDTRowPromptColSpan = [1.0 2.0];
    fixptDTModeColSpan = [3.0 4.0];
    fixptSignedStatusColSpan = [5.0 5.0];
    fixptWordLengthColSpan = [6.0 6.0];
    fixptFracLengthColSpan = [7.0 7.0];
    fixptRoundingModeColSpan = [8.0 8.0];
    fixptOverflowModeColSpan = [9.0 9.0];
    fixptOnlyMaxColSpan = [1.0 9.0];
    fixptOnlyMaxColIndex = 9.0;
    % 368 371
    % 369 371
    fixptWLEditWidthMax = 84.0;
    fixptWLEditHeightMax = 50.0;
    % 372 376
    % 373 376
    % 374 376
    fixptOnlyDisclaimerText = getRQAMPromptWidget('Settings below apply only when block inputs are fixed-point signals.', 'fixptDiscText', fixptDiscTextRowSpan, fixptOnlyMaxColSpan);
    % 376 383
    % 377 383
    % 378 383
    % 379 383
    % 380 383
    % 381 383
    fixptBlankLineText = getRQAMPromptWidget('', 'fixptBlankLineText', fixptBlnkLineRowSpan, fixptOnlyMaxColSpan);
    % 383 389
    % 384 389
    % 385 389
    % 386 389
    % 387 389
    modeTitle = getRQAMTitleWidget('Mode', 'modeTitle', fixptTitleRowSpan, fixptDTModeColSpan);
    % 389 392
    % 390 392
    sgnTitle = getRQAMTitleWidget('Signed', 'sgnTitle', fixptTitleRowSpan, fixptSignedStatusColSpan);
    % 392 395
    % 393 395
    wlTitle = getRQAMTitleWidget('Word Length', 'wlTitle', fixptTitleRowSpan, fixptWordLengthColSpan);
    % 395 398
    % 396 398
    flTitle = getRQAMTitleWidget('Fraction Length', 'flTitle', fixptTitleRowSpan, fixptFracLengthColSpan);
    % 398 401
    % 399 401
    rdTitle = getRQAMTitleWidget('Rounding', 'rdTitle', fixptTitleRowSpan, fixptRoundingModeColSpan);
    % 401 404
    % 402 404
    ofTitle = getRQAMTitleWidget('Overflow', 'ofTitle', fixptTitleRowSpan, fixptOverflowModeColSpan);
    % 404 410
    % 405 410
    % 406 410
    % 407 410
    % 408 410
    derotateFactorPrompt = getRQAMPromptWidget('Derotate factor:', 'derotateFactorPrompt', fixptDerotateFactorRowSpan, fixptDTRowPromptColSpan);
    % 410 413
    % 411 413
    derotateFactorDTMode = getRQAMPopupWidget(this, 'derotateFactorDTMode', fixptDerotateFactorRowSpan, fixptDTModeColSpan);
    % 413 417
    % 414 417
    % 415 417
    derotateFactorSignedText = getRQAMTitleWidget('Yes', 'derotateFactorSignedText', fixptDerotateFactorRowSpan, fixptSignedStatusColSpan);
    % 417 421
    % 418 421
    % 419 421
    derotateFactorWordLenText = getRQAMTitleWidget('Same as input', 'derotateFactorWordLenText', fixptDerotateFactorRowSpan, fixptWordLengthColSpan);
    % 421 425
    % 422 425
    % 423 425
    derotateFactorWordLenEdit = dspGetLeafWidgetBase('edit', '', 'derotateFactorWordLen', this, 'derotateFactorWordLen');
    % 425 427
    derotateFactorWordLenEdit.Entries = set(this, 'derotateFactorWordLen');
    derotateFactorWordLenEdit.RowSpan = fixptDerotateFactorRowSpan;
    derotateFactorWordLenEdit.ColSpan = fixptWordLengthColSpan;
    derotateFactorWordLenEdit.Alignment = 5.0;
    derotateFactorWordLenEdit.MaximumSize = horzcat(fixptWLEditWidthMax, fixptWLEditHeightMax);
    % 431 434
    % 432 434
    if strcmpi(this.derotateFactorDTMode, 'specify word length')
        derotateFactorWordLenEdit.Visible = 1.0;
        derotateFactorWordLenText.Visible = 0.0;
    else
        derotateFactorWordLenEdit.Visible = 0.0;
        derotateFactorWordLenText.Visible = 1.0;
    end % if
    % 440 442
    derotateFactorFracLenText = getRQAMTitleWidget('Best precision', 'derotateFactorFracLenText', fixptDerotateFactorRowSpan, fixptFracLengthColSpan);
    % 442 446
    % 443 446
    % 444 446
    derotateFactorRoundModeText = getRQAMTitleWidget('Nearest', 'derotateFactorRoundModeText', fixptDerotateFactorRowSpan, fixptRoundingModeColSpan);
    % 446 450
    % 447 450
    % 448 450
    derotateFactorOvrflModeText = getRQAMTitleWidget('Saturate', 'derotateFactorOvrflModeText', fixptDerotateFactorRowSpan, fixptOverflowModeColSpan);
    % 450 457
    % 451 457
    % 452 457
    % 453 457
    % 454 457
    % 455 457
    denormFactorPrompt = getRQAMPromptWidget('Denormalization factor:', 'denormFactorPrompt', fixptDenormFactorRowSpan, fixptDTRowPromptColSpan);
    % 457 460
    % 458 460
    denormFactorDTMode = getRQAMPopupWidget(this, 'denormFactorDTMode', fixptDenormFactorRowSpan, fixptDTModeColSpan);
    % 460 464
    % 461 464
    % 462 464
    denormFactorSignedText = getRQAMTitleWidget('Yes', 'denormFactorSignedText', fixptDenormFactorRowSpan, fixptSignedStatusColSpan);
    % 464 468
    % 465 468
    % 466 468
    denormFactorWordLenText = getRQAMTitleWidget('Same as input', 'denormFactorWordLenText', fixptDenormFactorRowSpan, fixptWordLengthColSpan);
    % 468 472
    % 469 472
    % 470 472
    denormFactorWordLenEdit = dspGetLeafWidgetBase('edit', '', 'denormFactorWordLen', this, 'denormFactorWordLen');
    denormFactorWordLenEdit.Entries = set(this, 'denormFactorWordLen');
    denormFactorWordLenEdit.RowSpan = fixptDenormFactorRowSpan;
    denormFactorWordLenEdit.ColSpan = fixptWordLengthColSpan;
    denormFactorWordLenEdit.Alignment = 5.0;
    denormFactorWordLenEdit.MaximumSize = horzcat(fixptWLEditWidthMax, fixptWLEditHeightMax);
    % 477 480
    % 478 480
    if strcmpi(this.denormFactorDTMode, 'specify word length')
        denormFactorWordLenEdit.Visible = 1.0;
        denormFactorWordLenText.Visible = 0.0;
    else
        denormFactorWordLenEdit.Visible = 0.0;
        denormFactorWordLenText.Visible = 1.0;
    end % if
    % 486 488
    denormFactorFracLenText = getRQAMTitleWidget('Best precision', 'denormFactorFracLenText', fixptDenormFactorRowSpan, fixptFracLengthColSpan);
    % 488 492
    % 489 492
    % 490 492
    denormFactorRoundModeText = getRQAMTitleWidget('Nearest', 'denormFactorRoundModeText', fixptDenormFactorRowSpan, fixptRoundingModeColSpan);
    % 492 496
    % 493 496
    % 494 496
    denormFactorOvrflModeText = getRQAMTitleWidget('Saturate', 'denormFactorOvrflModeText', fixptDenormFactorRowSpan, fixptOverflowModeColSpan);
    % 496 503
    % 497 503
    % 498 503
    % 499 503
    % 500 503
    % 501 503
    prodOutPrompt = getRQAMPromptWidget('Product output:', 'prodOutPrompt', fixptProductOutRowSpan, fixptDTRowPromptColSpan);
    % 503 506
    % 504 506
    prodOutDTMode = getRQAMPopupWidget(this, 'prodOutDTMode', fixptProductOutRowSpan, fixptDTModeColSpan);
    % 506 510
    % 507 510
    % 508 510
    prodOutSignedText = getRQAMTitleWidget('Yes', 'prodOutSignedText', fixptProductOutRowSpan, fixptSignedStatusColSpan);
    % 510 514
    % 511 514
    % 512 514
    prodOutWordLenText = getRQAMTitleWidget('Inherited', 'prodOutWordLenText', fixptProductOutRowSpan, fixptWordLengthColSpan);
    % 514 518
    % 515 518
    % 516 518
    prodOutWordLenEdit = dspGetLeafWidgetBase('edit', '', 'prodOutWordLen', this, 'prodOutWordLen');
    prodOutWordLenEdit.DialogRefresh = 1.0;
    prodOutWordLenEdit.Entries = set(this, 'prodOutWordLen');
    prodOutWordLenEdit.RowSpan = fixptProductOutRowSpan;
    prodOutWordLenEdit.ColSpan = fixptWordLengthColSpan;
    prodOutWordLenEdit.Alignment = 5.0;
    prodOutWordLenEdit.MaximumSize = horzcat(fixptWLEditWidthMax, fixptWLEditHeightMax);
    % 524 527
    % 525 527
    if strcmpi(this.prodOutDTMode, 'specify word length')
        prodOutWordLenEdit.Visible = 1.0;
        prodOutWordLenText.Visible = 0.0;
    else
        prodOutWordLenEdit.Visible = 0.0;
        prodOutWordLenText.Visible = 1.0;
    end % if
    % 533 535
    prodOutFracLenText = getRQAMTitleWidget('2', 'prodOutFracLenText', fixptProductOutRowSpan, fixptFracLengthColSpan);
    % 535 539
    % 536 539
    % 537 539
    prodOutRoundingMode = getRQAMPopupWidget(this, 'prodOutRoundingMode', fixptProductOutRowSpan, fixptRoundingModeColSpan);
    % 539 543
    % 540 543
    % 541 543
    prodOutOverflowMode = getRQAMPopupWidget(this, 'prodOutOverflowMode', fixptProductOutRowSpan, fixptOverflowModeColSpan);
    % 543 550
    % 544 550
    % 545 550
    % 546 550
    % 547 550
    % 548 550
    sumPrompt = getRQAMPromptWidget('Sum:', 'sumPrompt', fixptSumRowSpan, fixptDTRowPromptColSpan);
    % 550 554
    % 551 554
    % 552 554
    sumDTMode = getRQAMPopupWidget(this, 'sumDTMode', fixptSumRowSpan, fixptDTModeColSpan);
    % 554 558
    % 555 558
    % 556 558
    sumSignedText = getRQAMTitleWidget('Yes', 'sumSignedText', fixptSumRowSpan, fixptSignedStatusColSpan);
    % 558 563
    % 559 563
    % 560 563
    % 561 563
    if strcmpi(this.sumDTMode, 'same as product output') && strcmpi(this.prodOutDTMode, 'specify word length')
        sumWLTextStr = get(this, 'prodOutWordLen');
    else
        sumWLTextStr = 'Inherited';
    end % if
    sumWordLenText = getRQAMTitleWidget(sumWLTextStr, 'sumWordLenText', fixptSumRowSpan, fixptWordLengthColSpan);
    % 568 571
    % 569 571
    sumWordLenEdit = dspGetLeafWidgetBase('edit', '', 'sumWordLen', this, 'sumWordLen');
    sumWordLenEdit.Entries = set(this, 'sumWordLen');
    sumWordLenEdit.RowSpan = fixptSumRowSpan;
    sumWordLenEdit.ColSpan = fixptWordLengthColSpan;
    sumWordLenEdit.Alignment = 5.0;
    sumWordLenEdit.MaximumSize = horzcat(fixptWLEditWidthMax, fixptWLEditHeightMax);
    % 576 579
    % 577 579
    if strcmpi(this.sumDTMode, 'specify word length')
        sumWordLenEdit.Visible = 1.0;
        sumWordLenText.Visible = 0.0;
    else
        sumWordLenEdit.Visible = 0.0;
        sumWordLenText.Visible = 1.0;
    end % if
    % 585 587
    sumFracLenText = getRQAMTitleWidget('2', 'sumFracLenText', fixptSumRowSpan, fixptFracLengthColSpan);
    % 587 590
    % 588 590
    sumRoundModeText = getRQAMTitleWidget('Nearest', 'sumRoundModeText', fixptSumRowSpan, fixptRoundingModeColSpan);
    % 590 593
    % 591 593
    sumOvrflModeText = getRQAMTitleWidget('Saturate', 'sumOvrflModeText', fixptSumRowSpan, fixptOverflowModeColSpan);
    % 593 599
    % 594 599
    % 595 599
    % 596 599
    % 597 599
    fixptParamsPanel = dspGetContainerWidgetBase('panel', '', 'fixptParamsPanel');
    fixptParamsPanel.LayoutGrid = horzcat(fixptOnlyMaxRowIndex, fixptOnlyMaxColIndex);
    fixptParamsPanel.Items = cellhorzcat(fixptOnlyDisclaimerText, fixptBlankLineText, modeTitle, sgnTitle, wlTitle, flTitle, rdTitle, ofTitle, derotateFactorPrompt, derotateFactorDTMode, derotateFactorSignedText, derotateFactorWordLenEdit, derotateFactorWordLenText, derotateFactorFracLenText, derotateFactorRoundModeText, derotateFactorOvrflModeText, denormFactorPrompt, denormFactorDTMode, denormFactorSignedText, denormFactorWordLenEdit, denormFactorWordLenText, denormFactorFracLenText, denormFactorRoundModeText, denormFactorOvrflModeText, prodOutPrompt, prodOutDTMode, prodOutSignedText, prodOutWordLenEdit, prodOutWordLenText, prodOutFracLenText, prodOutRoundingMode, prodOutOverflowMode, sumPrompt, sumDTMode, sumSignedText, sumWordLenEdit, sumWordLenText, sumFracLenText, sumRoundModeText, sumOvrflModeText);
    % 601 644
    % 602 644
    % 603 644
    % 604 644
    % 605 644
    % 606 644
    % 607 644
    % 608 644
    % 609 644
    % 610 644
    % 611 644
    % 612 644
    % 613 644
    % 614 644
    % 615 644
    % 616 644
    % 617 644
    % 618 644
    % 619 644
    % 620 644
    % 621 644
    % 622 644
    % 623 644
    % 624 644
    % 625 644
    % 626 644
    % 627 644
    % 628 644
    % 629 644
    % 630 644
    % 631 644
    % 632 644
    % 633 644
    % 634 644
    % 635 644
    % 636 644
    % 637 644
    % 638 644
    % 639 644
    % 640 644
    % 641 644
    % 642 644
    fixptParamsPane = dspGetContainerWidgetBase('group', 'Fixed-point algorithm parameters', 'fixptParamsPane');
    fixptParamsPane.Items = cellhorzcat(fixptParamsPanel);
    fixptParamsPane.RowSpan = [4.0 4.0];
    % 646 648
    fixptParamsPane.ColSpan = fixptOnlyMaxColSpan;
    % 648 650
    if eq(DecType.Visible, 1.0) && not(strcmpi(this.DecType, 'hard decision'))
        % 650 653
        % 651 653
        fixptParamsPane.Visible = 0.0;
    else
        % 654 657
        % 655 657
        fixptParamsPane.Visible = 1.0;
    end % if
    % 658 668
    % 659 668
    % 660 668
    % 661 668
    % 662 668
    % 663 668
    % 664 668
    % 665 668
    % 666 668
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainParamsPanel);
    mainTab.LayoutGrid = [2.0 1.0];
    mainTab.RowStretch = [0.0 1.0];
    % 671 674
    % 672 674
    dtypesTab.Name = 'Data Types';
    dtypesTab.Items = cellhorzcat(dtOutputBlankLinePre, outDtype1, outDtype2, outDtype3, dtOutputBlankLinePost, fixptParamsPane);
    % 675 679
    % 676 679
    % 677 679
    dtypesTabTotNumRows = 4.0;
    dtypesTabTotNumCols = fixptOnlyMaxColIndex;
    dtypesTab.LayoutGrid = horzcat(dtypesTabTotNumRows, dtypesTabTotNumCols);
    % 681 684
    % 682 684
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, dtypesTab);
    % 687 692
    % 688 692
    % 689 692
    % 690 692
    dlgStruct = getBaseSchemaStruct(this, tabbedPane);
    % 692 702
    % 693 702
    % 694 702
    % 695 702
    % 696 702
    % 697 702
    % 698 702
    % 699 702
    % 700 702
    blkh = this.Block.Handle;
    mask_enables = get_param(blkh, 'MaskEnables');
    old_mask_enables = mask_enables;
    % 704 707
    % 705 707
    minDistIdx = getblockmaskparamindex(blkh, 'MinDist');
    avgPowIdx = getblockmaskparamindex(blkh, 'AvgPow');
    peakPowIdx = getblockmaskparamindex(blkh, 'PeakPow');
    mappingIdx = getblockmaskparamindex(blkh, 'Mapping');
    varianceIdx = getblockmaskparamindex(blkh, 'Variance');
    % 711 713
    if eq(MinDist.Visible, 1.0)
        mask_enables{minDistIdx} = 'on';
    else
        mask_enables{minDistIdx} = 'off';
    end % if
    if eq(AvgPow.Visible, 1.0)
        mask_enables{avgPowIdx} = 'on';
    else
        mask_enables{avgPowIdx} = 'off';
    end % if
    if eq(PeakPow.Visible, 1.0)
        mask_enables{peakPowIdx} = 'on';
    else
        mask_enables{peakPowIdx} = 'off';
    end % if
    if eq(Mapping.Visible, 1.0)
        mask_enables{mappingIdx} = 'on';
    else
        mask_enables{mappingIdx} = 'off';
    end % if
    if eq(Variance.Visible, 1.0)
        mask_enables{varianceIdx} = 'on';
    else
        mask_enables{varianceIdx} = 'off';
    end % if
    % 737 740
    % 738 740
    derotateFactorDTModeIdx = getblockmaskparamindex(blkh, 'derotateFactorDTMode');
    derotateFactorWordLenIdx = getblockmaskparamindex(blkh, 'derotateFactorWordLen');
    mask_enables{derotateFactorDTModeIdx} = 'on';
    if strcmpi(this.derotateFactorDTMode, 'specify word length')
        mask_enables{derotateFactorWordLenIdx} = 'on';
    else
        mask_enables{derotateFactorWordLenIdx} = 'off';
    end % if
    % 747 750
    % 748 750
    denormFactorDTModeIdx = getblockmaskparamindex(blkh, 'denormFactorDTMode');
    denormFactorWordLenIdx = getblockmaskparamindex(blkh, 'denormFactorWordLen');
    mask_enables{denormFactorDTModeIdx} = 'on';
    if strcmpi(this.denormFactorDTMode, 'specify word length')
        mask_enables{denormFactorWordLenIdx} = 'on';
    else
        mask_enables{denormFactorWordLenIdx} = 'off';
    end % if
    % 757 760
    % 758 760
    prodOutDTModeIdx = getblockmaskparamindex(blkh, 'prodOutDTMode');
    prodOutWordLenIdx = getblockmaskparamindex(blkh, 'prodOutWordLen');
    mask_enables{prodOutDTModeIdx} = 'on';
    if strcmpi(this.prodOutDTMode, 'specify word length')
        mask_enables{prodOutWordLenIdx} = 'on';
    else
        mask_enables{prodOutWordLenIdx} = 'off';
    end % if
    % 767 770
    % 768 770
    sumDTModeIdx = getblockmaskparamindex(blkh, 'sumDTMode');
    sumWordLenIdx = getblockmaskparamindex(blkh, 'sumWordLen');
    mask_enables{sumDTModeIdx} = 'on';
    if strcmpi(this.sumDTMode, 'specify word length')
        mask_enables{sumWordLenIdx} = 'on';
    else
        mask_enables{sumWordLenIdx} = 'off';
    end % if
    % 777 779
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end % if
    % 781 784
    % 782 784
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end % if
end % function
function titleText = getRQAMTitleWidget(textStr, tag, rowSpan, colSpan)
    % 788 793
    % 789 793
    % 790 793
    % 791 793
    titleText = getRQAMPromptWidget(textStr, tag, rowSpan, colSpan);
    titleText.Alignment = 5.0;
end % function
function promptText = getRQAMPromptWidget(promptStr, tag, rowSpan, colSpan)
    % 796 798
    promptText = dspGetLeafWidgetBase('text', promptStr, tag, 0.0);
    promptText.RowSpan = rowSpan;
    promptText.ColSpan = colSpan;
    promptText.Alignment = 4.0;
end % function
function popupWidget = getRQAMPopupWidget(this, tagAndProp, rowSpan, colSpan)
    % 803 805
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
