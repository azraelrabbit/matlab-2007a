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
    myblk = horzcat(this.Block.Path, '/', this.Block.Name);
    dialog = findDialog(myblk);
    if not(isempty(dialog))
        create_new_dialog = false;
    else
        create_new_dialog = true;
    end % if
    % 19 22
    % 20 22
    lprompt = 1.0;
    rprompt = 4.0;
    lwidget = plus(rprompt, 1.0);
    rwidget = 18.0;
    numgrid = 20.0;
    middle = 9.0;
    lprompt2 = plus(plus(middle, 1.0), 1.0);
    rprompt2 = plus(plus(middle, 1.0), rprompt);
    lwidget1 = plus(rprompt, 1.0);
    rwidget1 = middle;
    lwidget2 = plus(rprompt2, 2.0);
    rwidget2 = rwidget;
    lbutton = 19.0;
    rbutton = numgrid;
    maxrows = 0.0;
    % 36 40
    % 37 40
    % 38 40
    netparamData = dspGetLeafWidgetBase('edit', '', 'NetParamData', this, 'NetParamData');
    % 40 42
    netparamData.RowSpan = [1.0 1.0];
    netparamData.ColSpan = horzcat(lwidget, rwidget);
    % 43 45
    netparamDataprompt = dspGetLeafWidgetBase('text', 'Z-Parameters:', 'NetParamDataPrompt', 0.0);
    % 45 47
    netparamDataprompt.RowSpan = [1.0 1.0];
    netparamDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 48 51
    % 49 51
    netparamFreq = dspGetLeafWidgetBase('edit', '', 'NetParamFreq', this, 'NetParamFreq');
    % 51 53
    netparamFreq.RowSpan = [2.0 2.0];
    netparamFreq.ColSpan = horzcat(lwidget, rwidget);
    % 54 56
    netparamFreqprompt = dspGetLeafWidgetBase('text', 'Frequency (Hz):', 'NetParamFreqPrompt', 0.0);
    % 56 58
    netparamFreqprompt.RowSpan = [2.0 2.0];
    netparamFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 59 62
    % 60 62
    interpMethod = dspGetLeafWidgetBase('combobox', '', 'InterpMethod', this, 'InterpMethod');
    % 62 64
    interpMethod.Entries = ctranspose(set(this, 'InterpMethod'));
    interpMethod.RowSpan = [3.0 3.0];
    interpMethod.ColSpan = horzcat(lwidget, rwidget);
    % 66 68
    interpMethodprompt = dspGetLeafWidgetBase('text', 'Interpolation method:', 'InterpMethodPrompt', 0.0);
    % 68 70
    interpMethodprompt.RowSpan = [3.0 3.0];
    interpMethodprompt.ColSpan = horzcat(lprompt, rprompt);
    % 71 73
    spacerMain = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerMain.RowSpan = [4.0 4.0];
    spacerMain.ColSpan = horzcat(lprompt, rprompt);
    % 75 79
    % 76 79
    % 77 79
    noisesource = dspGetLeafWidgetBase('combobox', '', 'NoiseDefinedBy', this, 'NoiseDefinedBy');
    % 79 81
    noisesource.Entries = ctranspose(set(this, 'NoiseDefinedBy'));
    noisesource.RowSpan = [1.0 1.0];
    noisesource.ColSpan = horzcat(lwidget, rwidget);
    noisesource.DialogRefresh = 1.0;
    % 84 86
    noisesourceprompt = dspGetLeafWidgetBase('text', 'Noise type:', 'NoiseDefinedByPrompt', 0.0);
    % 86 88
    noisesourceprompt.RowSpan = [1.0 1.0];
    noisesourceprompt.ColSpan = horzcat(lprompt, rprompt);
    % 89 92
    % 90 92
    nf = dspGetLeafWidgetBase('edit', '', 'NF', this, 'NF');
    nf.RowSpan = [2.0 2.0];
    nf.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 94 96
    nfprompt = dspGetLeafWidgetBase('text', 'Noise figure (dB):', 'NFPrompt', 0.0);
    % 96 98
    nfprompt.RowSpan = [2.0 2.0];
    nfprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 99 102
    % 100 102
    fmin = dspGetLeafWidgetBase('edit', '', 'FMIN', this, 'FMIN');
    fmin.RowSpan = [3.0 3.0];
    fmin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 104 106
    fminprompt = dspGetLeafWidgetBase('text', 'Minimum noise figure (dB):', 'FMINPrompt', 0.0);
    % 106 108
    fminprompt.RowSpan = [3.0 3.0];
    fminprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 109 112
    % 110 112
    gammaopt = dspGetLeafWidgetBase('edit', '', 'GammaOpt', this, 'GammaOpt');
    gammaopt.RowSpan = [4.0 4.0];
    gammaopt.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 114 116
    gammaoptprompt = dspGetLeafWidgetBase('text', 'Optimal reflection coefficient:', 'GammaOptPrompt', 0.0);
    % 116 118
    gammaoptprompt.RowSpan = [4.0 4.0];
    gammaoptprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 119 122
    % 120 122
    rn = dspGetLeafWidgetBase('edit', '', 'RN', this, 'RN');
    rn.RowSpan = [5.0 5.0];
    rn.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 124 126
    rnprompt = dspGetLeafWidgetBase('text', 'Equivalent normalized noise resistance:', 'RNPrompt', 0.0);
    % 126 128
    rnprompt.RowSpan = [5.0 5.0];
    rnprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 129 132
    % 130 132
    nfactor = dspGetLeafWidgetBase('edit', '', 'NFactor', this, 'NFactor');
    nfactor.RowSpan = [6.0 6.0];
    nfactor.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 134 136
    nfactorprompt = dspGetLeafWidgetBase('text', 'Noise factor:', 'NFactorPrompt', 0.0);
    % 136 138
    nfactorprompt.RowSpan = [6.0 6.0];
    nfactorprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 139 142
    % 140 142
    ntemp = dspGetLeafWidgetBase('edit', '', 'NTemp', this, 'NTemp');
    ntemp.RowSpan = [7.0 7.0];
    ntemp.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 144 146
    ntempprompt = dspGetLeafWidgetBase('text', 'Noise temperature (K):', 'NTempPrompt', 0.0);
    % 146 148
    ntempprompt.RowSpan = [7.0 7.0];
    ntempprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 149 151
    spacerNoise = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerNoise.RowSpan = [8.0 8.0];
    spacerNoise.ColSpan = horzcat(lprompt, rprompt);
    % 153 157
    % 154 157
    % 155 157
    iP3Type = dspGetLeafWidgetBase('combobox', '', 'IP3Type', this, 'IP3Type');
    iP3Type.Entries = ctranspose(set(this, 'IP3Type'));
    iP3Type.RowSpan = [1.0 1.0];
    iP3Type.ColSpan = horzcat(lwidget, rwidget);
    iP3Type.DialogRefresh = 1.0;
    % 161 163
    iP3Typeprompt = dspGetLeafWidgetBase('text', 'IP3 type:', 'IP3TypePrompt', 0.0);
    % 163 165
    iP3Typeprompt.RowSpan = [1.0 1.0];
    iP3Typeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 166 169
    % 167 169
    oIP3 = dspGetLeafWidgetBase('edit', '', 'OIP3', this, 'OIP3');
    oIP3.RowSpan = [2.0 2.0];
    oIP3.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    oIP3.Enabled = 0.0;
    oIP3.Visible = 1.0;
    % 173 175
    oIP3prompt = dspGetLeafWidgetBase('text', 'IP3 (dBm):', 'OIP3Prompt', 0.0);
    % 175 177
    oIP3prompt.RowSpan = [2.0 2.0];
    oIP3prompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 178 181
    % 179 181
    iIP3 = dspGetLeafWidgetBase('edit', '', 'IIP3', this, 'IIP3');
    iIP3.RowSpan = [2.0 2.0];
    iIP3.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    iIP3.Enabled = 0.0;
    iIP3.Visible = 0.0;
    % 185 187
    iIP3prompt = dspGetLeafWidgetBase('text', 'IIP3 (dBm):', 'IIP3Prompt', 0.0);
    iIP3prompt.RowSpan = [2.0 2.0];
    iIP3prompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    iIP3prompt.Visible = 0.0;
    % 190 193
    % 191 193
    p1dB = dspGetLeafWidgetBase('edit', '', 'P1dB', this, 'P1dB');
    p1dB.RowSpan = [3.0 3.0];
    p1dB.ColSpan = horzcat(lwidget, rwidget);
    % 195 197
    p1dBprompt = dspGetLeafWidgetBase('text', '1dB gain compression power (dBm):', 'P1dBPrompt', 0.0);
    % 197 199
    p1dBprompt.RowSpan = [3.0 3.0];
    p1dBprompt.ColSpan = horzcat(lprompt, rprompt);
    % 200 203
    % 201 203
    pSat = dspGetLeafWidgetBase('edit', '', 'PSat', this, 'PSat');
    pSat.RowSpan = [4.0 4.0];
    pSat.ColSpan = horzcat(lwidget, rwidget);
    % 205 207
    pSatprompt = dspGetLeafWidgetBase('text', 'Output saturation power (dBm):', 'PSatPrompt', 0.0);
    % 207 209
    pSatprompt.RowSpan = [4.0 4.0];
    pSatprompt.ColSpan = horzcat(lprompt, rprompt);
    % 210 213
    % 211 213
    GCSat = dspGetLeafWidgetBase('edit', '', 'GCSat', this, 'GCSat');
    GCSat.RowSpan = [5.0 5.0];
    GCSat.ColSpan = horzcat(lwidget, rwidget);
    GCSat.Visible = 0.0;
    % 216 218
    GCSatprompt = dspGetLeafWidgetBase('text', 'Gain compression at saturation (dB):', 'GCSatPrompt', 0.0);
    % 218 220
    GCSatprompt.RowSpan = [5.0 5.0];
    GCSatprompt.ColSpan = horzcat(lprompt, rprompt);
    GCSatprompt.Visible = 0.0;
    % 222 224
    spacerNonlinear = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerNonlinear.RowSpan = [6.0 6.0];
    spacerNonlinear.ColSpan = horzcat(lprompt, rprompt);
    % 226 230
    % 227 230
    % 228 230
    sourceFreq = dspGetLeafWidgetBase('combobox', '', 'SourceFreq', this, 'SourceFreq');
    sourceFreq.RowSpan = [1.0 1.0];
    sourceFreq.ColSpan = horzcat(lwidget, rwidget);
    sourceFreq.DialogRefresh = 1.0;
    % 233 235
    sourceFreqprompt = dspGetLeafWidgetBase('text', 'Source of frequency data:', 'SourceFreqPrompt', 0.0);
    % 235 237
    sourceFreqprompt.RowSpan = [1.0 1.0];
    sourceFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 238 241
    % 239 241
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && not(isempty(Udata.Ckt.SimulationFreq))
        % 242 244
        sourceFreq.Entries = ctranspose(set(this, 'SourceFreq'));
    else
        sourceFreq.Entries = {'Same as the z-parameters frequency','User-specified'};
        % 246 248
    end % if
    % 248 251
    % 249 251
    freq = dspGetLeafWidgetBase('edit', '', 'Freq', this, 'Freq');
    freq.RowSpan = [2.0 2.0];
    freq.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 253 255
    freqprompt = dspGetLeafWidgetBase('text', 'Frequency data (Hz):', 'FreqPrompt', 0.0);
    % 255 257
    freqprompt.RowSpan = [2.0 2.0];
    freqprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 258 261
    % 259 261
    if strcmpi(this.SourceFreq, 'User-specified')
        freq.Enabled = 1.0;
    else
        freq.Enabled = 0.0;
    end % if
    % 265 268
    % 266 268
    sourcePin = dspGetLeafWidgetBase('combobox', '', 'SourcePin', this, 'SourcePin');
    sourcePin.Entries = ctranspose(set(this, 'SourcePin'));
    sourcePin.RowSpan = [3.0 3.0];
    sourcePin.ColSpan = horzcat(lwidget, rwidget);
    sourcePin.DialogRefresh = 1.0;
    % 272 274
    sourcePinprompt = dspGetLeafWidgetBase('text', 'Source of input power data:', 'SourcePinPrompt', 0.0);
    % 274 276
    sourcePinprompt.RowSpan = [3.0 3.0];
    sourcePinprompt.ColSpan = horzcat(lprompt, rprompt);
    % 277 280
    % 278 280
    pin = dspGetLeafWidgetBase('edit', '', 'Pin', this, 'Pin');
    pin.RowSpan = [4.0 4.0];
    pin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 282 284
    pinprompt = dspGetLeafWidgetBase('text', 'Input power data (dBm):', 'PinPrompt', 0.0);
    % 284 286
    pinprompt.RowSpan = [4.0 4.0];
    pinprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 287 290
    % 288 290
    if strcmpi(this.SourcePin, 'User-specified')
        pin.Enabled = 1.0;
    else
        pin.Enabled = 0.0;
    end % if
    % 294 296
    sourcePinprompt.Visible = 0.0;
    sourcePin.Visible = 0.0;
    pinprompt.Visible = 0.0;
    pin.Visible = 0.0;
    % 299 302
    % 300 302
    plotZ0 = dspGetLeafWidgetBase('edit', '', 'PlotZ0', this, 'PlotZ0');
    plotZ0.RowSpan = [5.0 5.0];
    plotZ0.ColSpan = horzcat(lwidget, rwidget);
    % 304 306
    plotZ0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'PlotZ0Prompt', 0.0);
    % 306 308
    plotZ0prompt.RowSpan = [5.0 5.0];
    plotZ0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 309 312
    % 310 312
    allPlotType = dspGetLeafWidgetBase('combobox', '', 'AllPlotType', this, 'AllPlotType');
    % 312 314
    allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
    allPlotType.RowSpan = [6.0 6.0];
    allPlotType.ColSpan = horzcat(lwidget, rwidget);
    allPlotType.DialogRefresh = 1.0;
    % 317 319
    allPlotTypeprompt = dspGetLeafWidgetBase('text', 'Plot type:', 'AllPlotTypePrompt', 0.0);
    % 319 321
    allPlotTypeprompt.RowSpan = [6.0 6.0];
    allPlotTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 322 325
    % 323 325
    networkData = dspGetLeafWidgetBase('combobox', '', 'NetworkData1', this);
    % 325 327
    networkData.RowSpan = [7.0 7.0];
    networkData.ColSpan = horzcat(lwidget1, rwidget1);
    networkData.DialogRefresh = 1.0;
    networkData.MatlabMethod = 'storePlotControl';
    % 330 332
    networkDataprompt = dspGetLeafWidgetBase('text', 'Y parameter1:', 'NetworkDataPrompt', 0.0);
    % 332 334
    networkDataprompt.RowSpan = [7.0 7.0];
    networkDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 335 338
    % 336 338
    complexFormat = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat1', this);
    % 338 340
    complexFormat.RowSpan = [7.0 7.0];
    complexFormat.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat.MatlabMethod = 'storePlotControl';
    % 342 344
    complexFormatprompt = dspGetLeafWidgetBase('text', 'Y format1:', 'ComplexFormatPrompt', 0.0);
    % 344 346
    complexFormatprompt.RowSpan = [7.0 7.0];
    complexFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 347 350
    % 348 350
    networkData2 = dspGetLeafWidgetBase('combobox', '', 'NetworkData2', this);
    % 350 352
    networkData2.RowSpan = [8.0 8.0];
    networkData2.ColSpan = horzcat(lwidget1, rwidget1);
    networkData2.DialogRefresh = 1.0;
    networkData2.MatlabMethod = 'storePlotControl';
    % 355 357
    networkData2prompt = dspGetLeafWidgetBase('text', 'Y parameter2:', 'NetworkData2Prompt', 0.0);
    % 357 359
    networkData2prompt.RowSpan = [8.0 8.0];
    networkData2prompt.ColSpan = horzcat(lprompt, rprompt);
    % 360 363
    % 361 363
    complexFormat2 = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat2', this);
    % 363 365
    complexFormat2.RowSpan = [8.0 8.0];
    complexFormat2.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat2.MatlabMethod = 'storePlotControl';
    % 367 369
    complexFormat2prompt = dspGetLeafWidgetBase('text', 'Y format2:', 'ComplexFormat2Prompt', 0.0);
    % 369 371
    complexFormat2prompt.RowSpan = [8.0 8.0];
    complexFormat2prompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 372 375
    % 373 375
    xParameter = dspGetLeafWidgetBase('combobox', '', 'XParameter', this);
    % 375 377
    xParameter.RowSpan = [9.0 9.0];
    xParameter.ColSpan = horzcat(lwidget1, rwidget1);
    xParameter.DialogRefresh = 1.0;
    xParameter.MatlabMethod = 'storePlotControl';
    % 380 382
    xParameterprompt = dspGetLeafWidgetBase('text', 'X parameter:', 'XParameterPrompt', 0.0);
    % 382 384
    xParameterprompt.RowSpan = [9.0 9.0];
    xParameterprompt.ColSpan = horzcat(lprompt, rprompt);
    % 385 388
    % 386 388
    xFormat = dspGetLeafWidgetBase('combobox', '', 'XFormat', this);
    % 388 390
    xFormat.RowSpan = [9.0 9.0];
    xFormat.ColSpan = horzcat(lwidget2, rwidget2);
    xFormat.MatlabMethod = 'storePlotControl';
    % 392 394
    xFormatprompt = dspGetLeafWidgetBase('text', 'X format:', 'XFormatPrompt', 0.0);
    % 394 396
    xFormatprompt.RowSpan = [9.0 9.0];
    xFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 397 400
    % 398 400
    yoption = dspGetLeafWidgetBase('combobox', '', 'YOption', this, 'YOption');
    % 400 402
    yoption.RowSpan = [10.0 10.0];
    yoption.ColSpan = horzcat(lwidget1, rwidget1);
    % 403 405
    yoptionprompt = dspGetLeafWidgetBase('text', 'Y scale:', 'YOptionPrompt', 0.0);
    % 405 407
    yoptionprompt.RowSpan = [10.0 10.0];
    yoptionprompt.ColSpan = horzcat(lprompt, rprompt);
    % 408 411
    % 409 411
    xoption = dspGetLeafWidgetBase('combobox', '', 'XOption', this, 'XOption');
    % 411 413
    xoption.RowSpan = [10.0 10.0];
    xoption.ColSpan = horzcat(lwidget2, rwidget2);
    % 414 416
    xoptionprompt = dspGetLeafWidgetBase('text', 'X scale:', 'XOptionPrompt', 0.0);
    % 416 418
    xoptionprompt.RowSpan = [10.0 10.0];
    xoptionprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 419 422
    % 420 422
    plotButton = dspGetLeafWidgetBase('pushbutton', 'Plot', 'PlotButton', this, 'PlotButton');
    % 422 424
    plotButton.RowSpan = [12.0 12.0];
    plotButton.ColSpan = horzcat(minus(rwidget, 1.0), rwidget);
    % 425 427
    spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerVisualization.RowSpan = [11.0 11.0];
    spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
    % 429 432
    % 430 432
    switch this.IP3Type
    case 'IIP3'
        iIP3.Enabled = 1.0;
        iIP3.Visible = 1.0;
        oIP3.Enabled = 0.0;
        oIP3.Visible = 0.0;
    case 'OIP3'
        iIP3.Enabled = 0.0;
        iIP3.Visible = 0.0;
        oIP3.Enabled = 1.0;
        oIP3.Visible = 1.0;
    end % switch
    p1dB.Enabled = 1.0;
    pSat.Enabled = 1.0;
    GCSat.Enabled = 1.0;
    % 446 449
    % 447 449
    switch this.NoiseDefinedBy
    case 'Noise figure'
        nf.Enabled = 1.0;
        fmin.Enabled = 0.0;
        gammaopt.Enabled = 0.0;
        rn.Enabled = 0.0;
        nfactor.Enabled = 0.0;
        ntemp.Enabled = 0.0;
    case 'Spot noise data'
        nf.Enabled = 0.0;
        fmin.Enabled = 1.0;
        gammaopt.Enabled = 1.0;
        rn.Enabled = 1.0;
        nfactor.Enabled = 0.0;
        ntemp.Enabled = 0.0;
    case 'Noise factor'
        nf.Enabled = 0.0;
        fmin.Enabled = 0.0;
        gammaopt.Enabled = 0.0;
        rn.Enabled = 0.0;
        nfactor.Enabled = 1.0;
        ntemp.Enabled = 0.0;
    case 'Noise temperature'
        nf.Enabled = 0.0;
        fmin.Enabled = 0.0;
        gammaopt.Enabled = 0.0;
        rn.Enabled = 0.0;
        nfactor.Enabled = 0.0;
        ntemp.Enabled = 1.0;
    end % switch
    % 478 481
    % 479 481
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && isa(Udata.Ckt.AnalyzedResult, 'rfdata.data')
        % 482 484
        mydata = Udata.Ckt.AnalyzedResult;
    else
        mydata = rfdata.data('S_Parameters', [0.0 0.0 ;  1.0 0.0], 'Freq', 1e+09);
    end % if
    switch this.AllPlotType
    case 'X-Y plane'
        networkData.Enabled = 1.0;
        networkData.Entries = listparam(mydata);
        % 491 493
        complexFormat.Enabled = 1.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 1.0;
        xoption.Enabled = 1.0;
        yoption.Enabled = 1.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
    case 'Composite data'
        % 500 502
        networkData.Enabled = 0.0;
        networkData.Entries = listparam(mydata);
        complexFormat.Enabled = 0.0;
        networkData2.Enabled = 0.0;
        complexFormat2.Enabled = 0.0;
        xoption.Enabled = 0.0;
        yoption.Enabled = 0.0;
        xParameter.Enabled = 0.0;
        xFormat.Enabled = 0.0;
    case 'Polar plane'
        % 511 513
        networkData.Enabled = 1.0;
        allparam = listparam(mydata);
        if any(strcmpi(allparam, 'LS11'))
            networkData.Entries = {'S11';'S12';'S21';'S22';'LS11';'LS12';'LS21';'LS22'};
        else
            % 517 519
            networkData.Entries = {'S11';'S12';'S21';'S22'};
        end % if
        complexFormat.Enabled = 0.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 0.0;
        xoption.Enabled = 0.0;
        yoption.Enabled = 0.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
    case {'Z Smith chart','Y Smith chart','ZY Smith chart'}
        % 528 530
        networkData.Enabled = 1.0;
        allparam = listparam(mydata);
        if any(strcmpi(allparam, 'LS11'))
            networkData.Entries = {'S11';'S22';'LS11';'LS22'};
        else
            networkData.Entries = {'S11';'S22'};
        end % if
        complexFormat.Enabled = 0.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 0.0;
        xoption.Enabled = 0.0;
        yoption.Enabled = 0.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
        % 543 545
    end % switch
    networkData2.Entries = cellhorzcat('   ', networkData.Entries{:});
    % 546 548
    if create_new_dialog && not(isempty(this.Block.AppliedNetworkData)) && not(isempty(this.Block.AppliedXParameter))
        % 548 550
        complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData));
        if not(isempty(strtrim(this.Block.AppliedNetworkData2)))
            complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData2));
        else
            complexFormat2.Entries = {'   '};
        end % if
        xParameter.Entries = listxparam(mydata, this.Block.AppliedNetworkData);
        xFormat.Entries = listxformat(mydata, this.Block.AppliedXParameter);
        % 557 559
        networkData.Value = this.Block.AppliedNetworkData;
        networkData2.Value = this.Block.AppliedNetworkData2;
        complexFormat.Value = this.Block.AppliedComplexFormat;
        complexFormat2.Value = this.Block.AppliedComplexFormat2;
        xParameter.Value = this.Block.AppliedXParameter;
        xFormat.Value = this.Block.AppliedXFormat;
        % 564 566
        if not(strcmpi(get_param(bdroot, 'BlockDiagramType'), 'library'))
            this.Block.UserData.NetworkData1 = this.Block.AppliedNetworkData;
            this.Block.UserData.NetworkData2 = this.Block.AppliedNetworkData2;
            this.Block.UserData.ComplexFormat1 = this.Block.AppliedComplexFormat;
            this.Block.UserData.ComplexFormat2 = this.Block.AppliedComplexFormat2;
            this.Block.UserData.XParameter = this.Block.AppliedXParameter;
            this.Block.UserData.XFormat = this.Block.AppliedXFormat;
        end % if
    else
        if all(isfield(this.Block.UserData, {'NetworkData1','XParameter'})) && not(isempty(this.Block.UserData.NetworkData1)) && not(isempty(this.Block.UserData.XParameter))
            % 575 578
            % 576 578
            complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData1));
            if not(isempty(strtrim(this.Block.UserData.NetworkData2)))
                complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData2));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, this.Block.UserData.NetworkData1);
            xFormat.Entries = listxformat(mydata, this.Block.UserData.XParameter);
            % 585 587
            if any(strcmp(this.Block.UserData.NetworkData1, networkData.Entries))
                networkData.Value = this.Block.UserData.NetworkData1;
            else
                networkData.Value = networkData.Entries{1.0};
                this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
            end % if
            if any(strcmp(this.Block.UserData.NetworkData2, networkData2.Entries))
                networkData2.Value = this.Block.UserData.NetworkData2;
            else
                networkData2.Value = networkData2.Entries{1.0};
                this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
            end % if
            if any(strcmp(this.Block.UserData.ComplexFormat1, complexFormat.Entries))
                complexFormat.Value = this.Block.UserData.ComplexFormat1;
            else
                complexFormat.Value = complexFormat.Entries{1.0};
                this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
            end % if
            if any(strcmp(this.Block.UserData.ComplexFormat2, complexFormat2.Entries))
                complexFormat2.Value = this.Block.UserData.ComplexFormat2;
            else
                complexFormat2.Value = complexFormat2.Entries{1.0};
                this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
            end % if
            if any(strcmp(this.Block.UserData.XParameter, xParameter.Entries))
                xParameter.Value = this.Block.UserData.XParameter;
            else
                xParameter.Value = xParameter.Entries{1.0};
                this.Block.UserData.XParameter = xParameter.Entries{1.0};
            end % if
            if any(strcmp(this.Block.UserData.XFormat, xFormat.Entries))
                xFormat.Value = this.Block.UserData.XFormat;
            else
                xFormat.Value = xFormat.Entries{1.0};
                this.Block.UserData.XFormat = xFormat.Entries{1.0};
            end % if
        else
            % 623 625
            complexFormat.Entries = simplifyformats(listformat(mydata, networkData.Entries{1.0}));
            if not(isempty(strtrim(networkData2.Entries{1.0})))
                complexFormat2.Entries = simplifyformats(listformat(mydata, networkData2.Entries{1.0}));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, networkData.Entries{1.0});
            xFormat.Entries = listxformat(mydata, xParameter.Entries{1.0});
            % 632 634
            networkData.Value = 0.0;
            networkData2.Value = 0.0;
            complexFormat.Value = 0.0;
            complexFormat2.Value = 0.0;
            xParameter.Value = 0.0;
            xFormat.Value = 0.0;
            % 639 641
            this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
            this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
            this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
            this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
            this.Block.UserData.XParameter = xParameter.Entries{1.0};
            this.Block.UserData.XFormat = xFormat.Entries{1.0};
            % 646 648
        end % if
        % 648 650
    end % if
    networkData.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData.Entries);
    complexFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat.Entries);
    networkData2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData2.Entries);
    complexFormat2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat2.Entries);
    xParameter.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xParameter.Entries);
    xFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xFormat.Entries);
    plotButton.MatlabMethod = 'plotParam';
    plotButton.MatlabArgs = cellhorzcat(horzcat(this.Block.Path, '/', this.Block.Name), '%dialog', networkData.Entries, complexFormat.Entries, networkData2.Entries, complexFormat2.Entries, xParameter.Entries, xFormat.Entries);
    % 658 665
    % 659 665
    % 660 665
    % 661 665
    % 662 665
    % 663 665
    mainPane = dspGetContainerWidgetBase('panel', '', 'MainPane');
    mainPane.Items = cellhorzcat(netparamData, netparamDataprompt, netparamFreq, netparamFreqprompt, interpMethod, interpMethodprompt, spacerMain);
    % 666 668
    mainPane.LayoutGrid = horzcat(4.0, numgrid);
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    mainPane.RowStretch = horzcat(zeros(1.0, 3.0), 1.0);
    % 671 674
    % 672 674
    noisePane = dspGetContainerWidgetBase('panel', '', 'NoisePane');
    noisePane.Items = cellhorzcat(noisesource, noisesourceprompt, nf, nfprompt, fmin, fminprompt, gammaopt, gammaoptprompt, rn, rnprompt, nfactor, ntemp, nfactorprompt, ntempprompt, spacerNoise);
    % 675 678
    % 676 678
    noisePane.LayoutGrid = horzcat(8.0, numgrid);
    noisePane.RowSpan = [1.0 1.0];
    noisePane.ColSpan = [1.0 1.0];
    noisePane.RowStretch = horzcat(zeros(1.0, 7.0), 1.0);
    % 681 684
    % 682 684
    nonlinearPane = dspGetContainerWidgetBase('panel', '', 'NonlinearPane');
    nonlinearPane.Items = cellhorzcat(iP3Type, iP3Typeprompt, iIP3, iIP3prompt, oIP3, oIP3prompt, p1dB, p1dBprompt, pSat, pSatprompt, GCSat, GCSatprompt, spacerNonlinear);
    % 685 688
    % 686 688
    nonlinearPane.LayoutGrid = horzcat(6.0, numgrid);
    nonlinearPane.RowSpan = [1.0 1.0];
    nonlinearPane.ColSpan = [1.0 1.0];
    nonlinearPane.RowStretch = horzcat(zeros(1.0, 5.0), 1.0);
    % 691 694
    % 692 694
    visualizationPane = dspGetContainerWidgetBase('panel', '', 'VisualizationPane');
    visualizationPane.Items = cellhorzcat(sourceFreq, sourceFreqprompt, freq, freqprompt, allPlotType, allPlotTypeprompt, networkData, networkDataprompt, complexFormat, complexFormatprompt, networkData2, networkData2prompt, complexFormat2, complexFormat2prompt, yoption, yoptionprompt, xoption, xoptionprompt, plotButton, xParameter, xParameterprompt, xFormat, xFormatprompt, sourcePin, sourcePinprompt, pin, pinprompt, plotZ0, plotZ0prompt, spacerVisualization);
    % 695 702
    % 696 702
    % 697 702
    % 698 702
    % 699 702
    % 700 702
    visualizationPane.LayoutGrid = horzcat(12.0, numgrid);
    visualizationPane.RowSpan = [1.0 1.0];
    visualizationPane.ColSpan = [1.0 1.0];
    visualizationPane.RowStretch = horzcat(zeros(1.0, 10.0), 1.0, 0.0);
    % 705 710
    % 706 710
    % 707 710
    % 708 710
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [1.0 1.0];
    mainTab.RowStretch = 0.0;
    mainTab.ColStretch = 0.0;
    % 714 717
    % 715 717
    noiseTab.Name = 'Noise Data';
    noiseTab.Items = cellhorzcat(noisePane);
    noiseTab.LayoutGrid = [1.0 1.0];
    noiseTab.RowStretch = 0.0;
    noiseTab.ColStretch = 0.0;
    % 721 724
    % 722 724
    nonlinearTab.Name = 'Nonlinearity Data';
    nonlinearTab.Items = cellhorzcat(nonlinearPane);
    nonlinearTab.LayoutGrid = [1.0 1.0];
    nonlinearTab.RowStretch = 0.0;
    nonlinearTab.ColStretch = 0.0;
    % 728 731
    % 729 731
    visualizationTab.Name = 'Visualization';
    visualizationTab.Items = cellhorzcat(visualizationPane);
    visualizationTab.LayoutGrid = [1.0 1.0];
    visualizationTab.RowStretch = 0.0;
    visualizationTab.ColStretch = 0.0;
    % 735 738
    % 736 738
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'TabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, noiseTab, nonlinearTab, visualizationTab);
    % 741 744
    % 742 744
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
