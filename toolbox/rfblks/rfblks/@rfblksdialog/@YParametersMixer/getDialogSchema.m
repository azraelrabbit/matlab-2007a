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
    netparamDataprompt = dspGetLeafWidgetBase('text', 'Y-Parameters:', 'NetParamDataPrompt', 0.0);
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
    % 71 74
    % 72 74
    mixerType = dspGetLeafWidgetBase('combobox', '', 'MixerType', this, 'MixerType');
    % 74 76
    mixerType.Entries = ctranspose(set(this, 'MixerType'));
    mixerType.RowSpan = [4.0 4.0];
    mixerType.ColSpan = horzcat(lwidget, rwidget);
    % 78 80
    mixerTypeprompt = dspGetLeafWidgetBase('text', 'Mixer type:', 'MixerTypePrompt', 0.0);
    % 80 82
    mixerTypeprompt.RowSpan = [4.0 4.0];
    mixerTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 83 86
    % 84 86
    flo = dspGetLeafWidgetBase('edit', '', 'FLO', this, 'FLO');
    flo.RowSpan = [5.0 5.0];
    flo.ColSpan = horzcat(lwidget, rwidget);
    % 88 90
    floprompt = dspGetLeafWidgetBase('text', 'LO frequency (Hz):', 'FLOPrompt', 0.0);
    % 90 92
    floprompt.RowSpan = [5.0 5.0];
    floprompt.ColSpan = horzcat(lprompt, rprompt);
    % 93 95
    spacerMain = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerMain.RowSpan = [6.0 6.0];
    spacerMain.ColSpan = horzcat(lprompt, rprompt);
    % 97 101
    % 98 101
    % 99 101
    noisesource = dspGetLeafWidgetBase('combobox', '', 'NoiseDefinedBy', this, 'NoiseDefinedBy');
    % 101 103
    noisesource.Entries = ctranspose(set(this, 'NoiseDefinedBy'));
    noisesource.RowSpan = [3.0 3.0];
    noisesource.ColSpan = horzcat(lwidget, rwidget);
    noisesource.DialogRefresh = 1.0;
    % 106 108
    noisesourceprompt = dspGetLeafWidgetBase('text', 'Noise type:', 'NoiseDefinedByPrompt', 0.0);
    % 108 110
    noisesourceprompt.RowSpan = [3.0 3.0];
    noisesourceprompt.ColSpan = horzcat(lprompt, rprompt);
    % 111 114
    % 112 114
    nf = dspGetLeafWidgetBase('edit', '', 'NF', this, 'NF');
    nf.RowSpan = [4.0 4.0];
    nf.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 116 118
    nfprompt = dspGetLeafWidgetBase('text', 'Noise figure (dB):', 'NFPrompt', 0.0);
    % 118 120
    nfprompt.RowSpan = [4.0 4.0];
    nfprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 121 124
    % 122 124
    fmin = dspGetLeafWidgetBase('edit', '', 'FMIN', this, 'FMIN');
    fmin.RowSpan = [5.0 5.0];
    fmin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 126 128
    fminprompt = dspGetLeafWidgetBase('text', 'Minimum noise figure (dB):', 'FMINPrompt', 0.0);
    % 128 130
    fminprompt.RowSpan = [5.0 5.0];
    fminprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 131 134
    % 132 134
    gammaopt = dspGetLeafWidgetBase('edit', '', 'GammaOpt', this, 'GammaOpt');
    gammaopt.RowSpan = [6.0 6.0];
    gammaopt.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 136 138
    gammaoptprompt = dspGetLeafWidgetBase('text', 'Optimal reflection coefficient:', 'GammaOptPrompt', 0.0);
    % 138 140
    gammaoptprompt.RowSpan = [6.0 6.0];
    gammaoptprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 141 144
    % 142 144
    rn = dspGetLeafWidgetBase('edit', '', 'RN', this, 'RN');
    rn.RowSpan = [7.0 7.0];
    rn.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 146 148
    rnprompt = dspGetLeafWidgetBase('text', 'Equivalent normalized noise resistance:', 'RNPrompt', 0.0);
    % 148 150
    rnprompt.RowSpan = [7.0 7.0];
    rnprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 151 154
    % 152 154
    nfactor = dspGetLeafWidgetBase('edit', '', 'NFactor', this, 'NFactor');
    nfactor.RowSpan = [8.0 8.0];
    nfactor.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 156 158
    nfactorprompt = dspGetLeafWidgetBase('text', 'Noise factor:', 'NFactorPrompt', 0.0);
    % 158 160
    nfactorprompt.RowSpan = [8.0 8.0];
    nfactorprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 161 164
    % 162 164
    ntemp = dspGetLeafWidgetBase('edit', '', 'NTemp', this, 'NTemp');
    ntemp.RowSpan = [9.0 9.0];
    ntemp.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 166 168
    ntempprompt = dspGetLeafWidgetBase('text', 'Noise temperature (K):', 'NTempPrompt', 0.0);
    % 168 170
    ntempprompt.RowSpan = [9.0 9.0];
    ntempprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 171 174
    % 172 174
    freqOffset = dspGetLeafWidgetBase('edit', '', 'FreqOffset', this, 'FreqOffset');
    % 174 176
    freqOffset.RowSpan = [1.0 1.0];
    freqOffset.ColSpan = horzcat(lwidget, rwidget);
    % 177 179
    freqOffsetprompt = dspGetLeafWidgetBase('text', 'Phase noise frequency offset (Hz):', 'FreqOffsetPrompt', 0.0);
    % 179 182
    % 180 182
    freqOffsetprompt.RowSpan = [1.0 1.0];
    freqOffsetprompt.ColSpan = horzcat(lprompt, rprompt);
    % 183 186
    % 184 186
    phaseNoiseLevel = dspGetLeafWidgetBase('edit', '', 'PhaseNoiseLevel', this, 'PhaseNoiseLevel');
    % 186 188
    phaseNoiseLevel.RowSpan = [2.0 2.0];
    phaseNoiseLevel.ColSpan = horzcat(lwidget, rwidget);
    % 189 191
    phaseNoiseLevelprompt = dspGetLeafWidgetBase('text', 'Phase noise level (dBc/Hz):', 'PhaseNoiseLevelPrompt', 0.0);
    % 191 194
    % 192 194
    phaseNoiseLevelprompt.RowSpan = [2.0 2.0];
    phaseNoiseLevelprompt.ColSpan = horzcat(lprompt, rprompt);
    % 195 197
    spacerNoise = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerNoise.RowSpan = [10.0 10.0];
    spacerNoise.ColSpan = horzcat(lprompt, rprompt);
    % 199 203
    % 200 203
    % 201 203
    iP3Type = dspGetLeafWidgetBase('combobox', '', 'IP3Type', this, 'IP3Type');
    iP3Type.Entries = ctranspose(set(this, 'IP3Type'));
    iP3Type.RowSpan = [1.0 1.0];
    iP3Type.ColSpan = horzcat(lwidget, rwidget);
    iP3Type.DialogRefresh = 1.0;
    % 207 209
    iP3Typeprompt = dspGetLeafWidgetBase('text', 'IP3 type:', 'IP3TypePrompt', 0.0);
    % 209 211
    iP3Typeprompt.RowSpan = [1.0 1.0];
    iP3Typeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 212 215
    % 213 215
    oIP3 = dspGetLeafWidgetBase('edit', '', 'OIP3', this, 'OIP3');
    oIP3.RowSpan = [2.0 2.0];
    oIP3.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    oIP3.Enabled = 0.0;
    oIP3.Visible = 1.0;
    % 219 221
    oIP3prompt = dspGetLeafWidgetBase('text', 'IP3 (dBm):', 'OIP3Prompt', 0.0);
    % 221 223
    oIP3prompt.RowSpan = [2.0 2.0];
    oIP3prompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 224 227
    % 225 227
    iIP3 = dspGetLeafWidgetBase('edit', '', 'IIP3', this, 'IIP3');
    iIP3.RowSpan = [2.0 2.0];
    iIP3.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    iIP3.Enabled = 0.0;
    iIP3.Visible = 0.0;
    % 231 233
    iIP3prompt = dspGetLeafWidgetBase('text', 'IIP3 (dBm):', 'IIP3Prompt', 0.0);
    iIP3prompt.RowSpan = [2.0 2.0];
    iIP3prompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    iIP3prompt.Visible = 0.0;
    % 236 239
    % 237 239
    p1dB = dspGetLeafWidgetBase('edit', '', 'P1dB', this, 'P1dB');
    p1dB.RowSpan = [3.0 3.0];
    p1dB.ColSpan = horzcat(lwidget, rwidget);
    % 241 243
    p1dBprompt = dspGetLeafWidgetBase('text', '1dB gain compression power (dBm):', 'P1dBPrompt', 0.0);
    % 243 245
    p1dBprompt.RowSpan = [3.0 3.0];
    p1dBprompt.ColSpan = horzcat(lprompt, rprompt);
    % 246 249
    % 247 249
    pSat = dspGetLeafWidgetBase('edit', '', 'PSat', this, 'PSat');
    pSat.RowSpan = [4.0 4.0];
    pSat.ColSpan = horzcat(lwidget, rwidget);
    % 251 253
    pSatprompt = dspGetLeafWidgetBase('text', 'Output saturation power (dBm):', 'PSatPrompt', 0.0);
    % 253 255
    pSatprompt.RowSpan = [4.0 4.0];
    pSatprompt.ColSpan = horzcat(lprompt, rprompt);
    % 256 259
    % 257 259
    GCSat = dspGetLeafWidgetBase('edit', '', 'GCSat', this, 'GCSat');
    GCSat.RowSpan = [5.0 5.0];
    GCSat.ColSpan = horzcat(lwidget, rwidget);
    GCSat.Visible = 0.0;
    % 262 264
    GCSatprompt = dspGetLeafWidgetBase('text', 'Gain compression at saturation (dB):', 'GCSatPrompt', 0.0);
    % 264 266
    GCSatprompt.RowSpan = [5.0 5.0];
    GCSatprompt.ColSpan = horzcat(lprompt, rprompt);
    GCSatprompt.Visible = 0.0;
    % 268 270
    spacerNonlinear = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerNonlinear.RowSpan = [6.0 6.0];
    spacerNonlinear.ColSpan = horzcat(lprompt, rprompt);
    % 272 276
    % 273 276
    % 274 276
    sourceFreq = dspGetLeafWidgetBase('combobox', '', 'SourceFreq', this, 'SourceFreq');
    sourceFreq.RowSpan = [1.0 1.0];
    sourceFreq.ColSpan = horzcat(lwidget, rwidget);
    sourceFreq.DialogRefresh = 1.0;
    % 279 281
    sourceFreqprompt = dspGetLeafWidgetBase('text', 'Source of frequency data:', 'SourceFreqPrompt', 0.0);
    % 281 283
    sourceFreqprompt.RowSpan = [1.0 1.0];
    sourceFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 284 287
    % 285 287
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && not(isempty(Udata.Ckt.SimulationFreq))
        % 288 290
        sourceFreq.Entries = ctranspose(set(this, 'SourceFreq'));
    else
        sourceFreq.Entries = {'Same as the y-parameters frequency','User-specified'};
        % 292 294
    end % if
    % 294 297
    % 295 297
    freq = dspGetLeafWidgetBase('edit', '', 'Freq', this, 'Freq');
    freq.RowSpan = [2.0 2.0];
    freq.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 299 301
    freqprompt = dspGetLeafWidgetBase('text', 'Frequency data (Hz):', 'FreqPrompt', 0.0);
    % 301 303
    freqprompt.RowSpan = [2.0 2.0];
    freqprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 304 307
    % 305 307
    if strcmpi(this.SourceFreq, 'User-specified')
        freq.Enabled = 1.0;
    else
        freq.Enabled = 0.0;
    end % if
    % 311 314
    % 312 314
    sourcePin = dspGetLeafWidgetBase('combobox', '', 'SourcePin', this, 'SourcePin');
    sourcePin.Entries = ctranspose(set(this, 'SourcePin'));
    sourcePin.RowSpan = [3.0 3.0];
    sourcePin.ColSpan = horzcat(lwidget, rwidget);
    sourcePin.DialogRefresh = 1.0;
    % 318 320
    sourcePinprompt = dspGetLeafWidgetBase('text', 'Source of input power data:', 'SourcePinPrompt', 0.0);
    % 320 322
    sourcePinprompt.RowSpan = [3.0 3.0];
    sourcePinprompt.ColSpan = horzcat(lprompt, rprompt);
    % 323 326
    % 324 326
    pin = dspGetLeafWidgetBase('edit', '', 'Pin', this, 'Pin');
    pin.RowSpan = [4.0 4.0];
    pin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 328 330
    pinprompt = dspGetLeafWidgetBase('text', 'Input power data (dBm):', 'PinPrompt', 0.0);
    % 330 332
    pinprompt.RowSpan = [4.0 4.0];
    pinprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 333 336
    % 334 336
    if strcmpi(this.SourcePin, 'User-specified')
        pin.Enabled = 1.0;
    else
        pin.Enabled = 0.0;
    end % if
    % 340 342
    sourcePinprompt.Visible = 0.0;
    sourcePin.Visible = 0.0;
    pinprompt.Visible = 0.0;
    pin.Visible = 0.0;
    % 345 348
    % 346 348
    plotZ0 = dspGetLeafWidgetBase('edit', '', 'PlotZ0', this, 'PlotZ0');
    plotZ0.RowSpan = [5.0 5.0];
    plotZ0.ColSpan = horzcat(lwidget, rwidget);
    % 350 352
    plotZ0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'PlotZ0Prompt', 0.0);
    % 352 354
    plotZ0prompt.RowSpan = [5.0 5.0];
    plotZ0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 355 358
    % 356 358
    allPlotType = dspGetLeafWidgetBase('combobox', '', 'AllPlotType', this, 'AllPlotType');
    % 358 360
    allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
    allPlotType.RowSpan = [6.0 6.0];
    allPlotType.ColSpan = horzcat(lwidget, rwidget);
    allPlotType.DialogRefresh = 1.0;
    % 363 365
    allPlotTypeprompt = dspGetLeafWidgetBase('text', 'Plot type:', 'AllPlotTypePrompt', 0.0);
    % 365 367
    allPlotTypeprompt.RowSpan = [6.0 6.0];
    allPlotTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 368 371
    % 369 371
    networkData = dspGetLeafWidgetBase('combobox', '', 'NetworkData1', this);
    % 371 373
    networkData.RowSpan = [7.0 7.0];
    networkData.ColSpan = horzcat(lwidget1, rwidget1);
    networkData.DialogRefresh = 1.0;
    networkData.MatlabMethod = 'storePlotControl';
    % 376 378
    networkDataprompt = dspGetLeafWidgetBase('text', 'Y parameter1:', 'NetworkDataPrompt', 0.0);
    % 378 380
    networkDataprompt.RowSpan = [7.0 7.0];
    networkDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 381 384
    % 382 384
    complexFormat = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat1', this);
    % 384 386
    complexFormat.RowSpan = [7.0 7.0];
    complexFormat.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat.MatlabMethod = 'storePlotControl';
    % 388 390
    complexFormatprompt = dspGetLeafWidgetBase('text', 'Y format1:', 'ComplexFormatPrompt', 0.0);
    % 390 392
    complexFormatprompt.RowSpan = [7.0 7.0];
    complexFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 393 396
    % 394 396
    networkData2 = dspGetLeafWidgetBase('combobox', '', 'NetworkData2', this);
    % 396 398
    networkData2.RowSpan = [8.0 8.0];
    networkData2.ColSpan = horzcat(lwidget1, rwidget1);
    networkData2.DialogRefresh = 1.0;
    networkData2.MatlabMethod = 'storePlotControl';
    % 401 403
    networkData2prompt = dspGetLeafWidgetBase('text', 'Y parameter2:', 'NetworkData2Prompt', 0.0);
    % 403 405
    networkData2prompt.RowSpan = [8.0 8.0];
    networkData2prompt.ColSpan = horzcat(lprompt, rprompt);
    % 406 409
    % 407 409
    complexFormat2 = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat2', this);
    % 409 411
    complexFormat2.RowSpan = [8.0 8.0];
    complexFormat2.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat2.MatlabMethod = 'storePlotControl';
    % 413 415
    complexFormat2prompt = dspGetLeafWidgetBase('text', 'Y format2:', 'ComplexFormat2Prompt', 0.0);
    % 415 417
    complexFormat2prompt.RowSpan = [8.0 8.0];
    complexFormat2prompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 418 421
    % 419 421
    xParameter = dspGetLeafWidgetBase('combobox', '', 'XParameter', this);
    % 421 423
    xParameter.RowSpan = [9.0 9.0];
    xParameter.ColSpan = horzcat(lwidget1, rwidget1);
    xParameter.DialogRefresh = 1.0;
    xParameter.MatlabMethod = 'storePlotControl';
    % 426 428
    xParameterprompt = dspGetLeafWidgetBase('text', 'X parameter:', 'XParameterPrompt', 0.0);
    % 428 430
    xParameterprompt.RowSpan = [9.0 9.0];
    xParameterprompt.ColSpan = horzcat(lprompt, rprompt);
    % 431 434
    % 432 434
    xFormat = dspGetLeafWidgetBase('combobox', '', 'XFormat', this);
    % 434 436
    xFormat.RowSpan = [9.0 9.0];
    xFormat.ColSpan = horzcat(lwidget2, rwidget2);
    xFormat.MatlabMethod = 'storePlotControl';
    % 438 440
    xFormatprompt = dspGetLeafWidgetBase('text', 'X format:', 'XFormatPrompt', 0.0);
    % 440 442
    xFormatprompt.RowSpan = [9.0 9.0];
    xFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 443 446
    % 444 446
    yoption = dspGetLeafWidgetBase('combobox', '', 'YOption', this, 'YOption');
    % 446 448
    yoption.RowSpan = [10.0 10.0];
    yoption.ColSpan = horzcat(lwidget1, rwidget1);
    % 449 451
    yoptionprompt = dspGetLeafWidgetBase('text', 'Y scale:', 'YOptionPrompt', 0.0);
    % 451 453
    yoptionprompt.RowSpan = [10.0 10.0];
    yoptionprompt.ColSpan = horzcat(lprompt, rprompt);
    % 454 457
    % 455 457
    xoption = dspGetLeafWidgetBase('combobox', '', 'XOption', this, 'XOption');
    % 457 459
    xoption.RowSpan = [10.0 10.0];
    xoption.ColSpan = horzcat(lwidget2, rwidget2);
    % 460 462
    xoptionprompt = dspGetLeafWidgetBase('text', 'X scale:', 'XOptionPrompt', 0.0);
    % 462 464
    xoptionprompt.RowSpan = [10.0 10.0];
    xoptionprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 465 468
    % 466 468
    plotButton = dspGetLeafWidgetBase('pushbutton', 'Plot', 'PlotButton', this, 'PlotButton');
    % 468 470
    plotButton.RowSpan = [12.0 12.0];
    plotButton.ColSpan = horzcat(minus(rwidget, 1.0), rwidget);
    % 471 473
    spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerVisualization.RowSpan = [11.0 11.0];
    spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
    % 475 478
    % 476 478
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
    % 492 495
    % 493 495
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
    % 524 527
    % 525 527
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && isa(Udata.Ckt.AnalyzedResult, 'rfdata.data')
        % 528 530
        mydata = Udata.Ckt.AnalyzedResult;
    else
        mydata = rfdata.data('S_Parameters', [0.0 0.0 ;  1.0 0.0], 'Freq', 1e+09);
    end % if
    switch this.AllPlotType
    case 'X-Y plane'
        networkData.Enabled = 1.0;
        networkData.Entries = listparam(mydata);
        % 537 539
        complexFormat.Enabled = 1.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 1.0;
        xoption.Enabled = 1.0;
        yoption.Enabled = 1.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
    case 'Composite data'
        % 546 548
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
        % 557 559
        networkData.Enabled = 1.0;
        allparam = listparam(mydata);
        if any(strcmpi(allparam, 'LS11'))
            networkData.Entries = {'S11';'S12';'S21';'S22';'LS11';'LS12';'LS21';'LS22'};
        else
            % 563 565
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
        % 574 576
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
        % 589 591
    end % switch
    networkData2.Entries = cellhorzcat('   ', networkData.Entries{:});
    % 592 594
    if create_new_dialog && not(isempty(this.Block.AppliedNetworkData)) && not(isempty(this.Block.AppliedXParameter))
        % 594 596
        complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData));
        if not(isempty(strtrim(this.Block.AppliedNetworkData2)))
            complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData2));
        else
            complexFormat2.Entries = {'   '};
        end % if
        xParameter.Entries = listxparam(mydata, this.Block.AppliedNetworkData);
        xFormat.Entries = listxformat(mydata, this.Block.AppliedXParameter);
        % 603 605
        networkData.Value = this.Block.AppliedNetworkData;
        networkData2.Value = this.Block.AppliedNetworkData2;
        complexFormat.Value = this.Block.AppliedComplexFormat;
        complexFormat2.Value = this.Block.AppliedComplexFormat2;
        xParameter.Value = this.Block.AppliedXParameter;
        xFormat.Value = this.Block.AppliedXFormat;
        % 610 612
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
            % 621 624
            % 622 624
            complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData1));
            if not(isempty(strtrim(this.Block.UserData.NetworkData2)))
                complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData2));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, this.Block.UserData.NetworkData1);
            xFormat.Entries = listxformat(mydata, this.Block.UserData.XParameter);
            % 631 633
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
            % 669 671
            complexFormat.Entries = simplifyformats(listformat(mydata, networkData.Entries{1.0}));
            if not(isempty(strtrim(networkData2.Entries{1.0})))
                complexFormat2.Entries = simplifyformats(listformat(mydata, networkData2.Entries{1.0}));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, networkData.Entries{1.0});
            xFormat.Entries = listxformat(mydata, xParameter.Entries{1.0});
            % 678 680
            networkData.Value = 0.0;
            networkData2.Value = 0.0;
            complexFormat.Value = 0.0;
            complexFormat2.Value = 0.0;
            xParameter.Value = 0.0;
            xFormat.Value = 0.0;
            % 685 687
            this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
            this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
            this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
            this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
            this.Block.UserData.XParameter = xParameter.Entries{1.0};
            this.Block.UserData.XFormat = xFormat.Entries{1.0};
            % 692 694
        end % if
        % 694 696
    end % if
    networkData.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData.Entries);
    complexFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat.Entries);
    networkData2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData2.Entries);
    complexFormat2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat2.Entries);
    xParameter.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xParameter.Entries);
    xFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xFormat.Entries);
    plotButton.MatlabMethod = 'plotParam';
    plotButton.MatlabArgs = cellhorzcat(horzcat(this.Block.Path, '/', this.Block.Name), '%dialog', networkData.Entries, complexFormat.Entries, networkData2.Entries, complexFormat2.Entries, xParameter.Entries, xFormat.Entries);
    % 704 709
    % 705 709
    % 706 709
    % 707 709
    if strcmpi(networkData.Value, 'PhaseNoise') || strcmpi(networkData2.Value, 'PhaseNoise')
        freq.Enabled = 0.0;
    end % if
    % 711 715
    % 712 715
    % 713 715
    mainPane = dspGetContainerWidgetBase('panel', '', 'MainPane');
    mainPane.Items = cellhorzcat(netparamData, netparamDataprompt, netparamFreq, netparamFreqprompt, interpMethod, interpMethodprompt, mixerType, mixerTypeprompt, flo, floprompt, spacerMain);
    % 716 719
    % 717 719
    mainPane.LayoutGrid = horzcat(6.0, numgrid);
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    mainPane.RowStretch = horzcat(zeros(1.0, 5.0), 1.0);
    % 722 725
    % 723 725
    noisePane = dspGetContainerWidgetBase('panel', '', 'NoisePane');
    noisePane.Items = cellhorzcat(noisesource, noisesourceprompt, nf, nfprompt, fmin, fminprompt, gammaopt, gammaoptprompt, rn, rnprompt, freqOffset, freqOffsetprompt, phaseNoiseLevel, phaseNoiseLevelprompt, nfactor, ntemp, nfactorprompt, ntempprompt, spacerNoise);
    % 726 730
    % 727 730
    % 728 730
    noisePane.LayoutGrid = horzcat(10.0, numgrid);
    noisePane.RowSpan = [1.0 1.0];
    noisePane.ColSpan = [1.0 1.0];
    noisePane.RowStretch = horzcat(zeros(1.0, 9.0), 1.0);
    % 733 736
    % 734 736
    nonlinearPane = dspGetContainerWidgetBase('panel', '', 'NonlinearPane');
    nonlinearPane.Items = cellhorzcat(iP3Type, iP3Typeprompt, iIP3, iIP3prompt, oIP3, oIP3prompt, p1dB, p1dBprompt, pSat, pSatprompt, GCSat, GCSatprompt, spacerNonlinear);
    % 737 740
    % 738 740
    nonlinearPane.LayoutGrid = horzcat(6.0, numgrid);
    nonlinearPane.RowSpan = [1.0 1.0];
    nonlinearPane.ColSpan = [1.0 1.0];
    nonlinearPane.RowStretch = horzcat(zeros(1.0, 5.0), 1.0);
    % 743 746
    % 744 746
    visualizationPane = dspGetContainerWidgetBase('panel', '', 'VisualizationPane');
    visualizationPane.Items = cellhorzcat(sourceFreq, sourceFreqprompt, freq, freqprompt, allPlotType, allPlotTypeprompt, networkData, networkDataprompt, complexFormat, complexFormatprompt, networkData2, networkData2prompt, complexFormat2, complexFormat2prompt, yoption, yoptionprompt, xoption, xoptionprompt, plotButton, xParameter, xParameterprompt, xFormat, xFormatprompt, sourcePin, sourcePinprompt, pin, pinprompt, plotZ0, plotZ0prompt, spacerVisualization);
    % 747 754
    % 748 754
    % 749 754
    % 750 754
    % 751 754
    % 752 754
    visualizationPane.LayoutGrid = horzcat(12.0, numgrid);
    visualizationPane.RowSpan = [1.0 1.0];
    visualizationPane.ColSpan = [1.0 1.0];
    visualizationPane.RowStretch = horzcat(zeros(1.0, 10.0), 1.0, 0.0);
    % 757 761
    % 758 761
    % 759 761
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [1.0 1.0];
    mainTab.RowStretch = 0.0;
    mainTab.ColStretch = 0.0;
    % 765 768
    % 766 768
    noiseTab.Name = 'Noise Data';
    noiseTab.Items = cellhorzcat(noisePane);
    noiseTab.LayoutGrid = [1.0 1.0];
    noiseTab.RowStretch = 0.0;
    noiseTab.ColStretch = 0.0;
    % 772 775
    % 773 775
    nonlinearTab.Name = 'Nonlinearity Data';
    nonlinearTab.Items = cellhorzcat(nonlinearPane);
    nonlinearTab.LayoutGrid = [1.0 1.0];
    nonlinearTab.RowStretch = 0.0;
    nonlinearTab.ColStretch = 0.0;
    % 779 782
    % 780 782
    visualizationTab.Name = 'Visualization';
    visualizationTab.Items = cellhorzcat(visualizationPane);
    visualizationTab.LayoutGrid = [1.0 1.0];
    visualizationTab.RowStretch = 0.0;
    visualizationTab.ColStretch = 0.0;
    % 786 789
    % 787 789
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'TabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, noiseTab, nonlinearTab, visualizationTab);
    % 792 795
    % 793 795
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
