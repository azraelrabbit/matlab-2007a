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
    netparamDataprompt = dspGetLeafWidgetBase('text', 'S-Parameters:', 'NetParamDataPrompt', 0.0);
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
    z0 = dspGetLeafWidgetBase('edit', '', 'Z0', this, 'Z0');
    z0.RowSpan = [3.0 3.0];
    z0.ColSpan = horzcat(lwidget, rwidget);
    % 64 66
    z0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'Z0Prompt', 0.0);
    % 66 68
    z0prompt.RowSpan = [3.0 3.0];
    z0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 69 72
    % 70 72
    interpMethod = dspGetLeafWidgetBase('combobox', '', 'InterpMethod', this, 'InterpMethod');
    % 72 74
    interpMethod.Entries = ctranspose(set(this, 'InterpMethod'));
    interpMethod.RowSpan = [4.0 4.0];
    interpMethod.ColSpan = horzcat(lwidget, rwidget);
    % 76 78
    interpMethodprompt = dspGetLeafWidgetBase('text', 'Interpolation method:', 'InterpMethodPrompt', 0.0);
    % 78 80
    interpMethodprompt.RowSpan = [4.0 4.0];
    interpMethodprompt.ColSpan = horzcat(lprompt, rprompt);
    % 81 84
    % 82 84
    mixerType = dspGetLeafWidgetBase('combobox', '', 'MixerType', this, 'MixerType');
    % 84 86
    mixerType.Entries = ctranspose(set(this, 'MixerType'));
    mixerType.RowSpan = [5.0 5.0];
    mixerType.ColSpan = horzcat(lwidget, rwidget);
    % 88 90
    mixerTypeprompt = dspGetLeafWidgetBase('text', 'Mixer type:', 'MixerTypePrompt', 0.0);
    % 90 92
    mixerTypeprompt.RowSpan = [5.0 5.0];
    mixerTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 93 96
    % 94 96
    flo = dspGetLeafWidgetBase('edit', '', 'FLO', this, 'FLO');
    flo.RowSpan = [6.0 6.0];
    flo.ColSpan = horzcat(lwidget, rwidget);
    % 98 100
    floprompt = dspGetLeafWidgetBase('text', 'LO frequency (Hz):', 'FLOPrompt', 0.0);
    % 100 102
    floprompt.RowSpan = [6.0 6.0];
    floprompt.ColSpan = horzcat(lprompt, rprompt);
    % 103 105
    spacerMain = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerMain.RowSpan = [7.0 7.0];
    spacerMain.ColSpan = horzcat(lprompt, rprompt);
    % 107 111
    % 108 111
    % 109 111
    noisesource = dspGetLeafWidgetBase('combobox', '', 'NoiseDefinedBy', this, 'NoiseDefinedBy');
    % 111 113
    noisesource.Entries = ctranspose(set(this, 'NoiseDefinedBy'));
    noisesource.RowSpan = [3.0 3.0];
    noisesource.ColSpan = horzcat(lwidget, rwidget);
    noisesource.DialogRefresh = 1.0;
    % 116 118
    noisesourceprompt = dspGetLeafWidgetBase('text', 'Noise type:', 'NoiseDefinedByPrompt', 0.0);
    % 118 120
    noisesourceprompt.RowSpan = [3.0 3.0];
    noisesourceprompt.ColSpan = horzcat(lprompt, rprompt);
    % 121 124
    % 122 124
    nf = dspGetLeafWidgetBase('edit', '', 'NF', this, 'NF');
    nf.RowSpan = [4.0 4.0];
    nf.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 126 128
    nfprompt = dspGetLeafWidgetBase('text', 'Noise figure (dB):', 'NFPrompt', 0.0);
    % 128 130
    nfprompt.RowSpan = [4.0 4.0];
    nfprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 131 134
    % 132 134
    fmin = dspGetLeafWidgetBase('edit', '', 'FMIN', this, 'FMIN');
    fmin.RowSpan = [5.0 5.0];
    fmin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 136 138
    fminprompt = dspGetLeafWidgetBase('text', 'Minimum noise figure (dB):', 'FMINPrompt', 0.0);
    % 138 140
    fminprompt.RowSpan = [5.0 5.0];
    fminprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 141 144
    % 142 144
    gammaopt = dspGetLeafWidgetBase('edit', '', 'GammaOpt', this, 'GammaOpt');
    gammaopt.RowSpan = [6.0 6.0];
    gammaopt.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 146 148
    gammaoptprompt = dspGetLeafWidgetBase('text', 'Optimal reflection coefficient:', 'GammaOptPrompt', 0.0);
    % 148 150
    gammaoptprompt.RowSpan = [6.0 6.0];
    gammaoptprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 151 154
    % 152 154
    rn = dspGetLeafWidgetBase('edit', '', 'RN', this, 'RN');
    rn.RowSpan = [7.0 7.0];
    rn.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 156 158
    rnprompt = dspGetLeafWidgetBase('text', 'Equivalent normalized noise resistance:', 'RNPrompt', 0.0);
    % 158 160
    rnprompt.RowSpan = [7.0 7.0];
    rnprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 161 164
    % 162 164
    nfactor = dspGetLeafWidgetBase('edit', '', 'NFactor', this, 'NFactor');
    nfactor.RowSpan = [8.0 8.0];
    nfactor.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 166 168
    nfactorprompt = dspGetLeafWidgetBase('text', 'Noise factor:', 'NFactorPrompt', 0.0);
    % 168 170
    nfactorprompt.RowSpan = [8.0 8.0];
    nfactorprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 171 174
    % 172 174
    ntemp = dspGetLeafWidgetBase('edit', '', 'NTemp', this, 'NTemp');
    ntemp.RowSpan = [9.0 9.0];
    ntemp.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 176 178
    ntempprompt = dspGetLeafWidgetBase('text', 'Noise temperature (K):', 'NTempPrompt', 0.0);
    % 178 180
    ntempprompt.RowSpan = [9.0 9.0];
    ntempprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 181 184
    % 182 184
    freqOffset = dspGetLeafWidgetBase('edit', '', 'FreqOffset', this, 'FreqOffset');
    % 184 186
    freqOffset.RowSpan = [1.0 1.0];
    freqOffset.ColSpan = horzcat(lwidget, rwidget);
    % 187 189
    freqOffsetprompt = dspGetLeafWidgetBase('text', 'Phase noise frequency offset (Hz):', 'FreqOffsetPrompt', 0.0);
    % 189 192
    % 190 192
    freqOffsetprompt.RowSpan = [1.0 1.0];
    freqOffsetprompt.ColSpan = horzcat(lprompt, rprompt);
    % 193 196
    % 194 196
    phaseNoiseLevel = dspGetLeafWidgetBase('edit', '', 'PhaseNoiseLevel', this, 'PhaseNoiseLevel');
    % 196 198
    phaseNoiseLevel.RowSpan = [2.0 2.0];
    phaseNoiseLevel.ColSpan = horzcat(lwidget, rwidget);
    % 199 201
    phaseNoiseLevelprompt = dspGetLeafWidgetBase('text', 'Phase noise level (dBc/Hz):', 'PhaseNoiseLevelPrompt', 0.0);
    % 201 204
    % 202 204
    phaseNoiseLevelprompt.RowSpan = [2.0 2.0];
    phaseNoiseLevelprompt.ColSpan = horzcat(lprompt, rprompt);
    % 205 207
    spacerNoise = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerNoise.RowSpan = [10.0 10.0];
    spacerNoise.ColSpan = horzcat(lprompt, rprompt);
    % 209 213
    % 210 213
    % 211 213
    iP3Type = dspGetLeafWidgetBase('combobox', '', 'IP3Type', this, 'IP3Type');
    iP3Type.Entries = ctranspose(set(this, 'IP3Type'));
    iP3Type.RowSpan = [1.0 1.0];
    iP3Type.ColSpan = horzcat(lwidget, rwidget);
    iP3Type.DialogRefresh = 1.0;
    % 217 219
    iP3Typeprompt = dspGetLeafWidgetBase('text', 'IP3 type:', 'IP3TypePrompt', 0.0);
    % 219 221
    iP3Typeprompt.RowSpan = [1.0 1.0];
    iP3Typeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 222 225
    % 223 225
    oIP3 = dspGetLeafWidgetBase('edit', '', 'OIP3', this, 'OIP3');
    oIP3.RowSpan = [2.0 2.0];
    oIP3.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    oIP3.Enabled = 0.0;
    oIP3.Visible = 1.0;
    % 229 231
    oIP3prompt = dspGetLeafWidgetBase('text', 'IP3 (dBm):', 'OIP3Prompt', 0.0);
    % 231 233
    oIP3prompt.RowSpan = [2.0 2.0];
    oIP3prompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 234 237
    % 235 237
    iIP3 = dspGetLeafWidgetBase('edit', '', 'IIP3', this, 'IIP3');
    iIP3.RowSpan = [2.0 2.0];
    iIP3.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    iIP3.Enabled = 0.0;
    iIP3.Visible = 0.0;
    % 241 243
    iIP3prompt = dspGetLeafWidgetBase('text', 'IIP3 (dBm):', 'IIP3Prompt', 0.0);
    iIP3prompt.RowSpan = [2.0 2.0];
    iIP3prompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    iIP3prompt.Visible = 0.0;
    % 246 249
    % 247 249
    p1dB = dspGetLeafWidgetBase('edit', '', 'P1dB', this, 'P1dB');
    p1dB.RowSpan = [3.0 3.0];
    p1dB.ColSpan = horzcat(lwidget, rwidget);
    % 251 253
    p1dBprompt = dspGetLeafWidgetBase('text', '1dB gain compression power (dBm):', 'P1dBPrompt', 0.0);
    % 253 255
    p1dBprompt.RowSpan = [3.0 3.0];
    p1dBprompt.ColSpan = horzcat(lprompt, rprompt);
    % 256 259
    % 257 259
    pSat = dspGetLeafWidgetBase('edit', '', 'PSat', this, 'PSat');
    pSat.RowSpan = [4.0 4.0];
    pSat.ColSpan = horzcat(lwidget, rwidget);
    % 261 263
    pSatprompt = dspGetLeafWidgetBase('text', 'Output saturation power (dBm):', 'PSatPrompt', 0.0);
    % 263 265
    pSatprompt.RowSpan = [4.0 4.0];
    pSatprompt.ColSpan = horzcat(lprompt, rprompt);
    % 266 269
    % 267 269
    GCSat = dspGetLeafWidgetBase('edit', '', 'GCSat', this, 'GCSat');
    GCSat.RowSpan = [5.0 5.0];
    GCSat.ColSpan = horzcat(lwidget, rwidget);
    GCSat.Visible = 0.0;
    % 272 274
    GCSatprompt = dspGetLeafWidgetBase('text', 'Gain compression at saturation (dB):', 'GCSatPrompt', 0.0);
    % 274 276
    GCSatprompt.RowSpan = [5.0 5.0];
    GCSatprompt.ColSpan = horzcat(lprompt, rprompt);
    GCSatprompt.Visible = 0.0;
    % 278 280
    spacerNonlinear = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerNonlinear.RowSpan = [6.0 6.0];
    spacerNonlinear.ColSpan = horzcat(lprompt, rprompt);
    % 282 286
    % 283 286
    % 284 286
    sourceFreq = dspGetLeafWidgetBase('combobox', '', 'SourceFreq', this, 'SourceFreq');
    sourceFreq.RowSpan = [1.0 1.0];
    sourceFreq.ColSpan = horzcat(lwidget, rwidget);
    sourceFreq.DialogRefresh = 1.0;
    % 289 291
    sourceFreqprompt = dspGetLeafWidgetBase('text', 'Source of frequency data:', 'SourceFreqPrompt', 0.0);
    % 291 293
    sourceFreqprompt.RowSpan = [1.0 1.0];
    sourceFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 294 297
    % 295 297
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && not(isempty(Udata.Ckt.SimulationFreq))
        % 298 300
        sourceFreq.Entries = ctranspose(set(this, 'SourceFreq'));
    else
        sourceFreq.Entries = {'Same as the s-parameters frequency','User-specified'};
        % 302 304
    end % if
    % 304 307
    % 305 307
    freq = dspGetLeafWidgetBase('edit', '', 'Freq', this, 'Freq');
    freq.RowSpan = [2.0 2.0];
    freq.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 309 311
    freqprompt = dspGetLeafWidgetBase('text', 'Frequency data (Hz):', 'FreqPrompt', 0.0);
    % 311 313
    freqprompt.RowSpan = [2.0 2.0];
    freqprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 314 317
    % 315 317
    if strcmpi(this.SourceFreq, 'User-specified')
        freq.Enabled = 1.0;
    else
        freq.Enabled = 0.0;
    end % if
    % 321 324
    % 322 324
    sourcePin = dspGetLeafWidgetBase('combobox', '', 'SourcePin', this, 'SourcePin');
    sourcePin.Entries = ctranspose(set(this, 'SourcePin'));
    sourcePin.RowSpan = [3.0 3.0];
    sourcePin.ColSpan = horzcat(lwidget, rwidget);
    sourcePin.DialogRefresh = 1.0;
    % 328 330
    sourcePinprompt = dspGetLeafWidgetBase('text', 'Source of input power data:', 'SourcePinPrompt', 0.0);
    % 330 332
    sourcePinprompt.RowSpan = [3.0 3.0];
    sourcePinprompt.ColSpan = horzcat(lprompt, rprompt);
    % 333 336
    % 334 336
    pin = dspGetLeafWidgetBase('edit', '', 'Pin', this, 'Pin');
    pin.RowSpan = [4.0 4.0];
    pin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 338 340
    pinprompt = dspGetLeafWidgetBase('text', 'Input power data (dBm):', 'PinPrompt', 0.0);
    % 340 342
    pinprompt.RowSpan = [4.0 4.0];
    pinprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 343 346
    % 344 346
    if strcmpi(this.SourcePin, 'User-specified')
        pin.Enabled = 1.0;
    else
        pin.Enabled = 0.0;
    end % if
    % 350 352
    sourcePinprompt.Visible = 0.0;
    sourcePin.Visible = 0.0;
    pinprompt.Visible = 0.0;
    pin.Visible = 0.0;
    % 355 358
    % 356 358
    plotZ0 = dspGetLeafWidgetBase('edit', '', 'PlotZ0', this, 'PlotZ0');
    plotZ0.RowSpan = [5.0 5.0];
    plotZ0.ColSpan = horzcat(lwidget, rwidget);
    % 360 362
    plotZ0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'PlotZ0Prompt', 0.0);
    % 362 364
    plotZ0prompt.RowSpan = [5.0 5.0];
    plotZ0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 365 368
    % 366 368
    allPlotType = dspGetLeafWidgetBase('combobox', '', 'AllPlotType', this, 'AllPlotType');
    % 368 370
    allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
    allPlotType.RowSpan = [6.0 6.0];
    allPlotType.ColSpan = horzcat(lwidget, rwidget);
    allPlotType.DialogRefresh = 1.0;
    % 373 375
    allPlotTypeprompt = dspGetLeafWidgetBase('text', 'Plot type:', 'AllPlotTypePrompt', 0.0);
    % 375 377
    allPlotTypeprompt.RowSpan = [6.0 6.0];
    allPlotTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 378 381
    % 379 381
    networkData = dspGetLeafWidgetBase('combobox', '', 'NetworkData1', this);
    % 381 383
    networkData.RowSpan = [7.0 7.0];
    networkData.ColSpan = horzcat(lwidget1, rwidget1);
    networkData.DialogRefresh = 1.0;
    networkData.MatlabMethod = 'storePlotControl';
    % 386 388
    networkDataprompt = dspGetLeafWidgetBase('text', 'Y parameter1:', 'NetworkDataPrompt', 0.0);
    % 388 390
    networkDataprompt.RowSpan = [7.0 7.0];
    networkDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 391 394
    % 392 394
    complexFormat = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat1', this);
    % 394 396
    complexFormat.RowSpan = [7.0 7.0];
    complexFormat.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat.MatlabMethod = 'storePlotControl';
    % 398 400
    complexFormatprompt = dspGetLeafWidgetBase('text', 'Y format1:', 'ComplexFormatPrompt', 0.0);
    % 400 402
    complexFormatprompt.RowSpan = [7.0 7.0];
    complexFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 403 406
    % 404 406
    networkData2 = dspGetLeafWidgetBase('combobox', '', 'NetworkData2', this);
    % 406 408
    networkData2.RowSpan = [8.0 8.0];
    networkData2.ColSpan = horzcat(lwidget1, rwidget1);
    networkData2.DialogRefresh = 1.0;
    networkData2.MatlabMethod = 'storePlotControl';
    % 411 413
    networkData2prompt = dspGetLeafWidgetBase('text', 'Y parameter2:', 'NetworkData2Prompt', 0.0);
    % 413 415
    networkData2prompt.RowSpan = [8.0 8.0];
    networkData2prompt.ColSpan = horzcat(lprompt, rprompt);
    % 416 419
    % 417 419
    complexFormat2 = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat2', this);
    % 419 421
    complexFormat2.RowSpan = [8.0 8.0];
    complexFormat2.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat2.MatlabMethod = 'storePlotControl';
    % 423 425
    complexFormat2prompt = dspGetLeafWidgetBase('text', 'Y format2:', 'ComplexFormat2Prompt', 0.0);
    % 425 427
    complexFormat2prompt.RowSpan = [8.0 8.0];
    complexFormat2prompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 428 431
    % 429 431
    xParameter = dspGetLeafWidgetBase('combobox', '', 'XParameter', this);
    % 431 433
    xParameter.RowSpan = [9.0 9.0];
    xParameter.ColSpan = horzcat(lwidget1, rwidget1);
    xParameter.DialogRefresh = 1.0;
    xParameter.MatlabMethod = 'storePlotControl';
    % 436 438
    xParameterprompt = dspGetLeafWidgetBase('text', 'X parameter:', 'XParameterPrompt', 0.0);
    % 438 440
    xParameterprompt.RowSpan = [9.0 9.0];
    xParameterprompt.ColSpan = horzcat(lprompt, rprompt);
    % 441 444
    % 442 444
    xFormat = dspGetLeafWidgetBase('combobox', '', 'XFormat', this);
    % 444 446
    xFormat.RowSpan = [9.0 9.0];
    xFormat.ColSpan = horzcat(lwidget2, rwidget2);
    xFormat.MatlabMethod = 'storePlotControl';
    % 448 450
    xFormatprompt = dspGetLeafWidgetBase('text', 'X format:', 'XFormatPrompt', 0.0);
    % 450 452
    xFormatprompt.RowSpan = [9.0 9.0];
    xFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 453 456
    % 454 456
    yoption = dspGetLeafWidgetBase('combobox', '', 'YOption', this, 'YOption');
    % 456 458
    yoption.RowSpan = [10.0 10.0];
    yoption.ColSpan = horzcat(lwidget1, rwidget1);
    % 459 461
    yoptionprompt = dspGetLeafWidgetBase('text', 'Y scale:', 'YOptionPrompt', 0.0);
    % 461 463
    yoptionprompt.RowSpan = [10.0 10.0];
    yoptionprompt.ColSpan = horzcat(lprompt, rprompt);
    % 464 467
    % 465 467
    xoption = dspGetLeafWidgetBase('combobox', '', 'XOption', this, 'XOption');
    % 467 469
    xoption.RowSpan = [10.0 10.0];
    xoption.ColSpan = horzcat(lwidget2, rwidget2);
    % 470 472
    xoptionprompt = dspGetLeafWidgetBase('text', 'X scale:', 'XOptionPrompt', 0.0);
    % 472 474
    xoptionprompt.RowSpan = [10.0 10.0];
    xoptionprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 475 478
    % 476 478
    plotButton = dspGetLeafWidgetBase('pushbutton', 'Plot', 'PlotButton', this, 'PlotButton');
    % 478 480
    plotButton.RowSpan = [12.0 12.0];
    plotButton.ColSpan = horzcat(minus(rwidget, 1.0), rwidget);
    % 481 483
    spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerVisualization.RowSpan = [11.0 11.0];
    spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
    % 485 488
    % 486 488
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
    % 502 505
    % 503 505
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
    % 534 537
    % 535 537
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && isa(Udata.Ckt.AnalyzedResult, 'rfdata.data')
        % 538 540
        mydata = Udata.Ckt.AnalyzedResult;
    else
        mydata = rfdata.data('S_Parameters', [0.0 0.0 ;  1.0 0.0], 'Freq', 1e+09);
    end % if
    switch this.AllPlotType
    case 'X-Y plane'
        networkData.Enabled = 1.0;
        networkData.Entries = listparam(mydata);
        % 547 549
        complexFormat.Enabled = 1.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 1.0;
        xoption.Enabled = 1.0;
        yoption.Enabled = 1.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
    case 'Composite data'
        % 556 558
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
        % 567 569
        networkData.Enabled = 1.0;
        allparam = listparam(mydata);
        if any(strcmpi(allparam, 'LS11'))
            networkData.Entries = {'S11';'S12';'S21';'S22';'LS11';'LS12';'LS21';'LS22'};
        else
            % 573 575
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
        % 584 586
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
        % 599 601
    end % switch
    networkData2.Entries = cellhorzcat('   ', networkData.Entries{:});
    % 602 604
    if create_new_dialog && not(isempty(this.Block.AppliedNetworkData)) && not(isempty(this.Block.AppliedXParameter))
        % 604 606
        complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData));
        if not(isempty(strtrim(this.Block.AppliedNetworkData2)))
            complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData2));
        else
            complexFormat2.Entries = {'   '};
        end % if
        xParameter.Entries = listxparam(mydata, this.Block.AppliedNetworkData);
        xFormat.Entries = listxformat(mydata, this.Block.AppliedXParameter);
        % 613 615
        networkData.Value = this.Block.AppliedNetworkData;
        networkData2.Value = this.Block.AppliedNetworkData2;
        complexFormat.Value = this.Block.AppliedComplexFormat;
        complexFormat2.Value = this.Block.AppliedComplexFormat2;
        xParameter.Value = this.Block.AppliedXParameter;
        xFormat.Value = this.Block.AppliedXFormat;
        % 620 622
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
            % 631 634
            % 632 634
            complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData1));
            if not(isempty(strtrim(this.Block.UserData.NetworkData2)))
                complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData2));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, this.Block.UserData.NetworkData1);
            xFormat.Entries = listxformat(mydata, this.Block.UserData.XParameter);
            % 641 643
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
            % 679 681
            complexFormat.Entries = simplifyformats(listformat(mydata, networkData.Entries{1.0}));
            if not(isempty(strtrim(networkData2.Entries{1.0})))
                complexFormat2.Entries = simplifyformats(listformat(mydata, networkData2.Entries{1.0}));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, networkData.Entries{1.0});
            xFormat.Entries = listxformat(mydata, xParameter.Entries{1.0});
            % 688 690
            networkData.Value = 0.0;
            networkData2.Value = 0.0;
            complexFormat.Value = 0.0;
            complexFormat2.Value = 0.0;
            xParameter.Value = 0.0;
            xFormat.Value = 0.0;
            % 695 697
            this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
            this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
            this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
            this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
            this.Block.UserData.XParameter = xParameter.Entries{1.0};
            this.Block.UserData.XFormat = xFormat.Entries{1.0};
            % 702 704
        end % if
        % 704 706
    end % if
    networkData.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData.Entries);
    complexFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat.Entries);
    networkData2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData2.Entries);
    complexFormat2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat2.Entries);
    xParameter.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xParameter.Entries);
    xFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xFormat.Entries);
    plotButton.MatlabMethod = 'plotParam';
    plotButton.MatlabArgs = cellhorzcat(horzcat(this.Block.Path, '/', this.Block.Name), '%dialog', networkData.Entries, complexFormat.Entries, networkData2.Entries, complexFormat2.Entries, xParameter.Entries, xFormat.Entries);
    % 714 719
    % 715 719
    % 716 719
    % 717 719
    if strcmpi(networkData.Value, 'PhaseNoise') || strcmpi(networkData2.Value, 'PhaseNoise')
        freq.Enabled = 0.0;
    end % if
    % 721 725
    % 722 725
    % 723 725
    mainPane = dspGetContainerWidgetBase('panel', '', 'MainPane');
    mainPane.Items = cellhorzcat(netparamData, netparamDataprompt, netparamFreq, netparamFreqprompt, z0, z0prompt, interpMethod, interpMethodprompt, mixerType, mixerTypeprompt, flo, floprompt, spacerMain);
    % 726 729
    % 727 729
    mainPane.LayoutGrid = horzcat(7.0, numgrid);
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    mainPane.RowStretch = horzcat(zeros(1.0, 6.0), 1.0);
    % 732 735
    % 733 735
    noisePane = dspGetContainerWidgetBase('panel', '', 'NoisePane');
    noisePane.Items = cellhorzcat(noisesource, noisesourceprompt, nf, nfprompt, fmin, fminprompt, gammaopt, gammaoptprompt, rn, rnprompt, freqOffset, freqOffsetprompt, phaseNoiseLevel, phaseNoiseLevelprompt, nfactor, ntemp, nfactorprompt, ntempprompt, spacerNoise);
    % 736 740
    % 737 740
    % 738 740
    noisePane.LayoutGrid = horzcat(10.0, numgrid);
    noisePane.RowSpan = [1.0 1.0];
    noisePane.ColSpan = [1.0 1.0];
    noisePane.RowStretch = horzcat(zeros(1.0, 9.0), 1.0);
    % 743 746
    % 744 746
    nonlinearPane = dspGetContainerWidgetBase('panel', '', 'NonlinearPane');
    nonlinearPane.Items = cellhorzcat(iP3Type, iP3Typeprompt, iIP3, iIP3prompt, oIP3, oIP3prompt, p1dB, p1dBprompt, pSat, pSatprompt, GCSat, GCSatprompt, spacerNonlinear);
    % 747 750
    % 748 750
    nonlinearPane.LayoutGrid = horzcat(6.0, numgrid);
    nonlinearPane.RowSpan = [1.0 1.0];
    nonlinearPane.ColSpan = [1.0 1.0];
    nonlinearPane.RowStretch = horzcat(zeros(1.0, 5.0), 1.0);
    % 753 756
    % 754 756
    visualizationPane = dspGetContainerWidgetBase('panel', '', 'VisualizationPane');
    visualizationPane.Items = cellhorzcat(sourceFreq, sourceFreqprompt, freq, freqprompt, allPlotType, allPlotTypeprompt, networkData, networkDataprompt, complexFormat, complexFormatprompt, networkData2, networkData2prompt, complexFormat2, complexFormat2prompt, yoption, yoptionprompt, xoption, xoptionprompt, plotButton, xParameter, xParameterprompt, xFormat, xFormatprompt, sourcePin, sourcePinprompt, pin, pinprompt, plotZ0, plotZ0prompt, spacerVisualization);
    % 757 764
    % 758 764
    % 759 764
    % 760 764
    % 761 764
    % 762 764
    visualizationPane.LayoutGrid = horzcat(12.0, numgrid);
    visualizationPane.RowSpan = [1.0 1.0];
    visualizationPane.ColSpan = [1.0 1.0];
    visualizationPane.RowStretch = horzcat(zeros(1.0, 10.0), 1.0, 0.0);
    % 767 771
    % 768 771
    % 769 771
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [1.0 1.0];
    mainTab.RowStretch = 0.0;
    mainTab.ColStretch = 0.0;
    % 775 778
    % 776 778
    noiseTab.Name = 'Noise Data';
    noiseTab.Items = cellhorzcat(noisePane);
    noiseTab.LayoutGrid = [1.0 1.0];
    noiseTab.RowStretch = 0.0;
    noiseTab.ColStretch = 0.0;
    % 782 785
    % 783 785
    nonlinearTab.Name = 'Nonlinearity Data';
    nonlinearTab.Items = cellhorzcat(nonlinearPane);
    nonlinearTab.LayoutGrid = [1.0 1.0];
    nonlinearTab.RowStretch = 0.0;
    nonlinearTab.ColStretch = 0.0;
    % 789 792
    % 790 792
    visualizationTab.Name = 'Visualization';
    visualizationTab.Items = cellhorzcat(visualizationPane);
    visualizationTab.LayoutGrid = [1.0 1.0];
    visualizationTab.RowStretch = 0.0;
    visualizationTab.ColStretch = 0.0;
    % 796 799
    % 797 799
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'TabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, noiseTab, nonlinearTab, visualizationTab);
    % 802 805
    % 803 805
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
