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
    % 35 39
    % 36 39
    % 37 39
    netparamData = dspGetLeafWidgetBase('edit', '', 'NetParamData', this, 'NetParamData');
    % 39 41
    netparamData.RowSpan = [1.0 1.0];
    netparamData.ColSpan = horzcat(lwidget, rwidget);
    % 42 44
    netparamDataprompt = dspGetLeafWidgetBase('text', 'S-Parameters:', 'NetParamDataPrompt', 0.0);
    % 44 46
    netparamDataprompt.RowSpan = [1.0 1.0];
    netparamDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 47 50
    % 48 50
    netparamFreq = dspGetLeafWidgetBase('edit', '', 'NetParamFreq', this, 'NetParamFreq');
    % 50 52
    netparamFreq.RowSpan = [2.0 2.0];
    netparamFreq.ColSpan = horzcat(lwidget, rwidget);
    % 53 55
    netparamFreqprompt = dspGetLeafWidgetBase('text', 'Frequency (Hz):', 'NetParamFreqPrompt', 0.0);
    % 55 57
    netparamFreqprompt.RowSpan = [2.0 2.0];
    netparamFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 58 61
    % 59 61
    z0 = dspGetLeafWidgetBase('edit', '', 'Z0', this, 'Z0');
    z0.RowSpan = [3.0 3.0];
    z0.ColSpan = horzcat(lwidget, rwidget);
    % 63 65
    z0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'Z0Prompt', 0.0);
    % 65 67
    z0prompt.RowSpan = [3.0 3.0];
    z0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 68 71
    % 69 71
    interpMethod = dspGetLeafWidgetBase('combobox', '', 'InterpMethod', this, 'InterpMethod');
    % 71 73
    interpMethod.Entries = ctranspose(set(this, 'InterpMethod'));
    interpMethod.RowSpan = [4.0 4.0];
    interpMethod.ColSpan = horzcat(lwidget, rwidget);
    % 75 77
    interpMethodprompt = dspGetLeafWidgetBase('text', 'Interpolation method:', 'InterpMethodPrompt', 0.0);
    % 77 79
    interpMethodprompt.RowSpan = [4.0 4.0];
    interpMethodprompt.ColSpan = horzcat(lprompt, rprompt);
    % 80 82
    spacerMain = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerMain.RowSpan = [5.0 5.0];
    spacerMain.ColSpan = horzcat(lprompt, rprompt);
    % 84 88
    % 85 88
    % 86 88
    noisesource = dspGetLeafWidgetBase('combobox', '', 'NoiseDefinedBy', this, 'NoiseDefinedBy');
    % 88 90
    noisesource.Entries = ctranspose(set(this, 'NoiseDefinedBy'));
    noisesource.RowSpan = [1.0 1.0];
    noisesource.ColSpan = horzcat(lwidget, rwidget);
    noisesource.DialogRefresh = 1.0;
    % 93 95
    noisesourceprompt = dspGetLeafWidgetBase('text', 'Noise type:', 'NoiseDefinedByPrompt', 0.0);
    % 95 97
    noisesourceprompt.RowSpan = [1.0 1.0];
    noisesourceprompt.ColSpan = horzcat(lprompt, rprompt);
    % 98 101
    % 99 101
    nf = dspGetLeafWidgetBase('edit', '', 'NF', this, 'NF');
    nf.RowSpan = [2.0 2.0];
    nf.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 103 105
    nfprompt = dspGetLeafWidgetBase('text', 'Noise figure (dB):', 'NFPrompt', 0.0);
    % 105 107
    nfprompt.RowSpan = [2.0 2.0];
    nfprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 108 111
    % 109 111
    fmin = dspGetLeafWidgetBase('edit', '', 'FMIN', this, 'FMIN');
    fmin.RowSpan = [3.0 3.0];
    fmin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 113 115
    fminprompt = dspGetLeafWidgetBase('text', 'Minimum noise figure (dB):', 'FMINPrompt', 0.0);
    % 115 117
    fminprompt.RowSpan = [3.0 3.0];
    fminprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 118 121
    % 119 121
    gammaopt = dspGetLeafWidgetBase('edit', '', 'GammaOpt', this, 'GammaOpt');
    gammaopt.RowSpan = [4.0 4.0];
    gammaopt.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 123 125
    gammaoptprompt = dspGetLeafWidgetBase('text', 'Optimal reflection coefficient:', 'GammaOptPrompt', 0.0);
    % 125 127
    gammaoptprompt.RowSpan = [4.0 4.0];
    gammaoptprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 128 131
    % 129 131
    rn = dspGetLeafWidgetBase('edit', '', 'RN', this, 'RN');
    rn.RowSpan = [5.0 5.0];
    rn.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 133 135
    rnprompt = dspGetLeafWidgetBase('text', 'Equivalent normalized noise resistance:', 'RNPrompt', 0.0);
    % 135 137
    rnprompt.RowSpan = [5.0 5.0];
    rnprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 138 141
    % 139 141
    nfactor = dspGetLeafWidgetBase('edit', '', 'NFactor', this, 'NFactor');
    nfactor.RowSpan = [6.0 6.0];
    nfactor.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 143 145
    nfactorprompt = dspGetLeafWidgetBase('text', 'Noise factor:', 'NFactorPrompt', 0.0);
    % 145 147
    nfactorprompt.RowSpan = [6.0 6.0];
    nfactorprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 148 151
    % 149 151
    ntemp = dspGetLeafWidgetBase('edit', '', 'NTemp', this, 'NTemp');
    ntemp.RowSpan = [7.0 7.0];
    ntemp.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 153 155
    ntempprompt = dspGetLeafWidgetBase('text', 'Noise temperature (K):', 'NTempPrompt', 0.0);
    % 155 157
    ntempprompt.RowSpan = [7.0 7.0];
    ntempprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 158 160
    spacerNoise = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerNoise.RowSpan = [8.0 8.0];
    spacerNoise.ColSpan = horzcat(lprompt, rprompt);
    % 162 166
    % 163 166
    % 164 166
    iP3Type = dspGetLeafWidgetBase('combobox', '', 'IP3Type', this, 'IP3Type');
    iP3Type.Entries = ctranspose(set(this, 'IP3Type'));
    iP3Type.RowSpan = [1.0 1.0];
    iP3Type.ColSpan = horzcat(lwidget, rwidget);
    iP3Type.DialogRefresh = 1.0;
    % 170 172
    iP3Typeprompt = dspGetLeafWidgetBase('text', 'IP3 type:', 'IP3TypePrompt', 0.0);
    % 172 174
    iP3Typeprompt.RowSpan = [1.0 1.0];
    iP3Typeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 175 178
    % 176 178
    oIP3 = dspGetLeafWidgetBase('edit', '', 'OIP3', this, 'OIP3');
    oIP3.RowSpan = [2.0 2.0];
    oIP3.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    oIP3.Enabled = 0.0;
    oIP3.Visible = 1.0;
    % 182 184
    oIP3prompt = dspGetLeafWidgetBase('text', 'IP3 (dBm):', 'OIP3Prompt', 0.0);
    % 184 186
    oIP3prompt.RowSpan = [2.0 2.0];
    oIP3prompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 187 190
    % 188 190
    iIP3 = dspGetLeafWidgetBase('edit', '', 'IIP3', this, 'IIP3');
    iIP3.RowSpan = [2.0 2.0];
    iIP3.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    iIP3.Enabled = 0.0;
    iIP3.Visible = 0.0;
    % 194 196
    iIP3prompt = dspGetLeafWidgetBase('text', 'IIP3 (dBm):', 'IIP3Prompt', 0.0);
    iIP3prompt.RowSpan = [2.0 2.0];
    iIP3prompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    iIP3prompt.Visible = 0.0;
    % 199 202
    % 200 202
    p1dB = dspGetLeafWidgetBase('edit', '', 'P1dB', this, 'P1dB');
    p1dB.RowSpan = [3.0 3.0];
    p1dB.ColSpan = horzcat(lwidget, rwidget);
    % 204 206
    p1dBprompt = dspGetLeafWidgetBase('text', '1dB gain compression power (dBm):', 'P1dBPrompt', 0.0);
    % 206 208
    p1dBprompt.RowSpan = [3.0 3.0];
    p1dBprompt.ColSpan = horzcat(lprompt, rprompt);
    % 209 212
    % 210 212
    pSat = dspGetLeafWidgetBase('edit', '', 'PSat', this, 'PSat');
    pSat.RowSpan = [4.0 4.0];
    pSat.ColSpan = horzcat(lwidget, rwidget);
    % 214 216
    pSatprompt = dspGetLeafWidgetBase('text', 'Output saturation power (dBm):', 'PSatPrompt', 0.0);
    % 216 218
    pSatprompt.RowSpan = [4.0 4.0];
    pSatprompt.ColSpan = horzcat(lprompt, rprompt);
    % 219 222
    % 220 222
    GCSat = dspGetLeafWidgetBase('edit', '', 'GCSat', this, 'GCSat');
    GCSat.RowSpan = [5.0 5.0];
    GCSat.ColSpan = horzcat(lwidget, rwidget);
    GCSat.Visible = 0.0;
    % 225 227
    GCSatprompt = dspGetLeafWidgetBase('text', 'Gain compression at saturation (dB):', 'GCSatPrompt', 0.0);
    % 227 229
    GCSatprompt.RowSpan = [5.0 5.0];
    GCSatprompt.ColSpan = horzcat(lprompt, rprompt);
    GCSatprompt.Visible = 0.0;
    % 231 233
    spacerNonlinear = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerNonlinear.RowSpan = [6.0 6.0];
    spacerNonlinear.ColSpan = horzcat(lprompt, rprompt);
    % 235 239
    % 236 239
    % 237 239
    sourceFreq = dspGetLeafWidgetBase('combobox', '', 'SourceFreq', this, 'SourceFreq');
    sourceFreq.RowSpan = [1.0 1.0];
    sourceFreq.ColSpan = horzcat(lwidget, rwidget);
    sourceFreq.DialogRefresh = 1.0;
    % 242 244
    sourceFreqprompt = dspGetLeafWidgetBase('text', 'Source of frequency data:', 'SourceFreqPrompt', 0.0);
    % 244 246
    sourceFreqprompt.RowSpan = [1.0 1.0];
    sourceFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 247 250
    % 248 250
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && not(isempty(Udata.Ckt.SimulationFreq))
        % 251 253
        sourceFreq.Entries = ctranspose(set(this, 'SourceFreq'));
    else
        sourceFreq.Entries = {'Same as the s-parameters frequency','User-specified'};
        % 255 257
    end % if
    % 257 260
    % 258 260
    freq = dspGetLeafWidgetBase('edit', '', 'Freq', this, 'Freq');
    freq.RowSpan = [2.0 2.0];
    freq.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 262 264
    freqprompt = dspGetLeafWidgetBase('text', 'Frequency data (Hz):', 'FreqPrompt', 0.0);
    % 264 266
    freqprompt.RowSpan = [2.0 2.0];
    freqprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 267 270
    % 268 270
    if strcmpi(this.SourceFreq, 'User-specified')
        freq.Enabled = 1.0;
    else
        freq.Enabled = 0.0;
    end % if
    % 274 277
    % 275 277
    sourcePin = dspGetLeafWidgetBase('combobox', '', 'SourcePin', this, 'SourcePin');
    sourcePin.Entries = ctranspose(set(this, 'SourcePin'));
    sourcePin.RowSpan = [3.0 3.0];
    sourcePin.ColSpan = horzcat(lwidget, rwidget);
    sourcePin.DialogRefresh = 1.0;
    % 281 283
    sourcePinprompt = dspGetLeafWidgetBase('text', 'Source of input power data:', 'SourcePinPrompt', 0.0);
    % 283 285
    sourcePinprompt.RowSpan = [3.0 3.0];
    sourcePinprompt.ColSpan = horzcat(lprompt, rprompt);
    % 286 289
    % 287 289
    pin = dspGetLeafWidgetBase('edit', '', 'Pin', this, 'Pin');
    pin.RowSpan = [4.0 4.0];
    pin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 291 293
    pinprompt = dspGetLeafWidgetBase('text', 'Input power data (dBm):', 'PinPrompt', 0.0);
    % 293 295
    pinprompt.RowSpan = [4.0 4.0];
    pinprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 296 299
    % 297 299
    if strcmpi(this.SourcePin, 'User-specified')
        pin.Enabled = 1.0;
    else
        pin.Enabled = 0.0;
    end % if
    % 303 305
    sourcePinprompt.Visible = 0.0;
    sourcePin.Visible = 0.0;
    pinprompt.Visible = 0.0;
    pin.Visible = 0.0;
    % 308 311
    % 309 311
    plotZ0 = dspGetLeafWidgetBase('edit', '', 'PlotZ0', this, 'PlotZ0');
    plotZ0.RowSpan = [5.0 5.0];
    plotZ0.ColSpan = horzcat(lwidget, rwidget);
    % 313 315
    plotZ0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'PlotZ0Prompt', 0.0);
    % 315 317
    plotZ0prompt.RowSpan = [5.0 5.0];
    plotZ0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 318 321
    % 319 321
    allPlotType = dspGetLeafWidgetBase('combobox', '', 'AllPlotType', this, 'AllPlotType');
    % 321 323
    allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
    allPlotType.RowSpan = [6.0 6.0];
    allPlotType.ColSpan = horzcat(lwidget, rwidget);
    allPlotType.DialogRefresh = 1.0;
    % 326 328
    allPlotTypeprompt = dspGetLeafWidgetBase('text', 'Plot type:', 'AllPlotTypePrompt', 0.0);
    % 328 330
    allPlotTypeprompt.RowSpan = [6.0 6.0];
    allPlotTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 331 334
    % 332 334
    networkData = dspGetLeafWidgetBase('combobox', '', 'NetworkData1', this);
    % 334 336
    networkData.RowSpan = [7.0 7.0];
    networkData.ColSpan = horzcat(lwidget1, rwidget1);
    networkData.DialogRefresh = 1.0;
    networkData.MatlabMethod = 'storePlotControl';
    % 339 341
    networkDataprompt = dspGetLeafWidgetBase('text', 'Y parameter1:', 'NetworkDataPrompt', 0.0);
    % 341 343
    networkDataprompt.RowSpan = [7.0 7.0];
    networkDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 344 347
    % 345 347
    complexFormat = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat1', this);
    % 347 349
    complexFormat.RowSpan = [7.0 7.0];
    complexFormat.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat.MatlabMethod = 'storePlotControl';
    % 351 353
    complexFormatprompt = dspGetLeafWidgetBase('text', 'Y format1:', 'ComplexFormatPrompt', 0.0);
    % 353 355
    complexFormatprompt.RowSpan = [7.0 7.0];
    complexFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 356 359
    % 357 359
    networkData2 = dspGetLeafWidgetBase('combobox', '', 'NetworkData2', this);
    % 359 361
    networkData2.RowSpan = [8.0 8.0];
    networkData2.ColSpan = horzcat(lwidget1, rwidget1);
    networkData2.DialogRefresh = 1.0;
    networkData2.MatlabMethod = 'storePlotControl';
    % 364 366
    networkData2prompt = dspGetLeafWidgetBase('text', 'Y parameter2:', 'NetworkData2Prompt', 0.0);
    % 366 368
    networkData2prompt.RowSpan = [8.0 8.0];
    networkData2prompt.ColSpan = horzcat(lprompt, rprompt);
    % 369 372
    % 370 372
    complexFormat2 = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat2', this);
    % 372 374
    complexFormat2.RowSpan = [8.0 8.0];
    complexFormat2.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat2.MatlabMethod = 'storePlotControl';
    % 376 378
    complexFormat2prompt = dspGetLeafWidgetBase('text', 'Y format2:', 'ComplexFormat2Prompt', 0.0);
    % 378 380
    complexFormat2prompt.RowSpan = [8.0 8.0];
    complexFormat2prompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 381 384
    % 382 384
    xParameter = dspGetLeafWidgetBase('combobox', '', 'XParameter', this);
    % 384 386
    xParameter.RowSpan = [9.0 9.0];
    xParameter.ColSpan = horzcat(lwidget1, rwidget1);
    xParameter.DialogRefresh = 1.0;
    xParameter.MatlabMethod = 'storePlotControl';
    % 389 391
    xParameterprompt = dspGetLeafWidgetBase('text', 'X parameter:', 'XParameterPrompt', 0.0);
    % 391 393
    xParameterprompt.RowSpan = [9.0 9.0];
    xParameterprompt.ColSpan = horzcat(lprompt, rprompt);
    % 394 397
    % 395 397
    xFormat = dspGetLeafWidgetBase('combobox', '', 'XFormat', this);
    % 397 399
    xFormat.RowSpan = [9.0 9.0];
    xFormat.ColSpan = horzcat(lwidget2, rwidget2);
    xFormat.MatlabMethod = 'storePlotControl';
    % 401 403
    xFormatprompt = dspGetLeafWidgetBase('text', 'X format:', 'XFormatPrompt', 0.0);
    % 403 405
    xFormatprompt.RowSpan = [9.0 9.0];
    xFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 406 409
    % 407 409
    yoption = dspGetLeafWidgetBase('combobox', '', 'YOption', this, 'YOption');
    % 409 411
    yoption.RowSpan = [10.0 10.0];
    yoption.ColSpan = horzcat(lwidget1, rwidget1);
    % 412 414
    yoptionprompt = dspGetLeafWidgetBase('text', 'Y scale:', 'YOptionPrompt', 0.0);
    % 414 416
    yoptionprompt.RowSpan = [10.0 10.0];
    yoptionprompt.ColSpan = horzcat(lprompt, rprompt);
    % 417 420
    % 418 420
    xoption = dspGetLeafWidgetBase('combobox', '', 'XOption', this, 'XOption');
    % 420 422
    xoption.RowSpan = [10.0 10.0];
    xoption.ColSpan = horzcat(lwidget2, rwidget2);
    % 423 425
    xoptionprompt = dspGetLeafWidgetBase('text', 'X scale:', 'XOptionPrompt', 0.0);
    % 425 427
    xoptionprompt.RowSpan = [10.0 10.0];
    xoptionprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 428 431
    % 429 431
    plotButton = dspGetLeafWidgetBase('pushbutton', 'Plot', 'PlotButton', this, 'PlotButton');
    % 431 433
    plotButton.RowSpan = [12.0 12.0];
    plotButton.ColSpan = horzcat(minus(rwidget, 1.0), rwidget);
    % 434 436
    spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerVisualization.RowSpan = [11.0 11.0];
    spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
    % 438 441
    % 439 441
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
    % 455 458
    % 456 458
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
    % 487 490
    % 488 490
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && isa(Udata.Ckt.AnalyzedResult, 'rfdata.data')
        % 491 493
        mydata = Udata.Ckt.AnalyzedResult;
    else
        mydata = rfdata.data('S_Parameters', [0.0 0.0 ;  1.0 0.0], 'Freq', 1e+09);
    end % if
    switch this.AllPlotType
    case 'X-Y plane'
        networkData.Enabled = 1.0;
        networkData.Entries = listparam(mydata);
        % 500 502
        complexFormat.Enabled = 1.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 1.0;
        xoption.Enabled = 1.0;
        yoption.Enabled = 1.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
    case 'Composite data'
        % 509 511
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
        % 520 522
        networkData.Enabled = 1.0;
        allparam = listparam(mydata);
        if any(strcmpi(allparam, 'LS11'))
            networkData.Entries = {'S11';'S12';'S21';'S22';'LS11';'LS12';'LS21';'LS22'};
        else
            % 526 528
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
        % 537 539
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
        % 552 554
    end % switch
    networkData2.Entries = cellhorzcat('   ', networkData.Entries{:});
    % 555 557
    if create_new_dialog && not(isempty(this.Block.AppliedNetworkData)) && not(isempty(this.Block.AppliedXParameter))
        % 557 559
        complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData));
        if not(isempty(strtrim(this.Block.AppliedNetworkData2)))
            complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData2));
        else
            complexFormat2.Entries = {'   '};
        end % if
        xParameter.Entries = listxparam(mydata, this.Block.AppliedNetworkData);
        xFormat.Entries = listxformat(mydata, this.Block.AppliedXParameter);
        % 566 568
        networkData.Value = this.Block.AppliedNetworkData;
        networkData2.Value = this.Block.AppliedNetworkData2;
        complexFormat.Value = this.Block.AppliedComplexFormat;
        complexFormat2.Value = this.Block.AppliedComplexFormat2;
        xParameter.Value = this.Block.AppliedXParameter;
        xFormat.Value = this.Block.AppliedXFormat;
        % 573 575
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
            % 584 587
            % 585 587
            complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData1));
            if not(isempty(strtrim(this.Block.UserData.NetworkData2)))
                complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData2));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, this.Block.UserData.NetworkData1);
            xFormat.Entries = listxformat(mydata, this.Block.UserData.XParameter);
            % 594 596
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
            % 632 634
            complexFormat.Entries = simplifyformats(listformat(mydata, networkData.Entries{1.0}));
            if not(isempty(strtrim(networkData2.Entries{1.0})))
                complexFormat2.Entries = simplifyformats(listformat(mydata, networkData2.Entries{1.0}));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, networkData.Entries{1.0});
            xFormat.Entries = listxformat(mydata, xParameter.Entries{1.0});
            % 641 643
            networkData.Value = 0.0;
            networkData2.Value = 0.0;
            complexFormat.Value = 0.0;
            complexFormat2.Value = 0.0;
            xParameter.Value = 0.0;
            xFormat.Value = 0.0;
            % 648 650
            this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
            this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
            this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
            this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
            this.Block.UserData.XParameter = xParameter.Entries{1.0};
            this.Block.UserData.XFormat = xFormat.Entries{1.0};
            % 655 657
        end % if
        % 657 659
    end % if
    networkData.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData.Entries);
    complexFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat.Entries);
    networkData2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData2.Entries);
    complexFormat2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat2.Entries);
    xParameter.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xParameter.Entries);
    xFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xFormat.Entries);
    plotButton.MatlabMethod = 'plotParam';
    plotButton.MatlabArgs = cellhorzcat(horzcat(this.Block.Path, '/', this.Block.Name), '%dialog', networkData.Entries, complexFormat.Entries, networkData2.Entries, complexFormat2.Entries, xParameter.Entries, xFormat.Entries);
    % 667 674
    % 668 674
    % 669 674
    % 670 674
    % 671 674
    % 672 674
    mainPane = dspGetContainerWidgetBase('panel', '', 'MainPane');
    mainPane.Items = cellhorzcat(netparamData, netparamDataprompt, netparamFreq, netparamFreqprompt, z0, z0prompt, interpMethod, interpMethodprompt, spacerMain);
    % 675 678
    % 676 678
    mainPane.LayoutGrid = horzcat(5.0, numgrid);
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    mainPane.RowStretch = horzcat(zeros(1.0, 4.0), 1.0);
    % 681 684
    % 682 684
    noisePane = dspGetContainerWidgetBase('panel', '', 'NoisePane');
    noisePane.Items = cellhorzcat(noisesource, noisesourceprompt, nf, nfprompt, fmin, fminprompt, gammaopt, gammaoptprompt, rn, rnprompt, nfactor, ntemp, nfactorprompt, ntempprompt, spacerNoise);
    % 685 688
    % 686 688
    noisePane.LayoutGrid = horzcat(8.0, numgrid);
    noisePane.RowSpan = [1.0 1.0];
    noisePane.ColSpan = [1.0 1.0];
    noisePane.RowStretch = horzcat(zeros(1.0, 7.0), 1.0);
    % 691 694
    % 692 694
    nonlinearPane = dspGetContainerWidgetBase('panel', '', 'NonlinearPane');
    nonlinearPane.Items = cellhorzcat(iP3Type, iP3Typeprompt, iIP3, iIP3prompt, oIP3, oIP3prompt, p1dB, p1dBprompt, pSat, pSatprompt, GCSat, GCSatprompt, spacerNonlinear);
    % 695 698
    % 696 698
    nonlinearPane.LayoutGrid = horzcat(6.0, numgrid);
    nonlinearPane.RowSpan = [1.0 1.0];
    nonlinearPane.ColSpan = [1.0 1.0];
    nonlinearPane.RowStretch = horzcat(zeros(1.0, 5.0), 1.0);
    % 701 704
    % 702 704
    visualizationPane = dspGetContainerWidgetBase('panel', '', 'VisualizationPane');
    visualizationPane.Items = cellhorzcat(sourceFreq, sourceFreqprompt, freq, freqprompt, allPlotType, allPlotTypeprompt, networkData, networkDataprompt, complexFormat, complexFormatprompt, networkData2, networkData2prompt, complexFormat2, complexFormat2prompt, yoption, yoptionprompt, xoption, xoptionprompt, plotButton, xParameter, xParameterprompt, xFormat, xFormatprompt, sourcePin, sourcePinprompt, pin, pinprompt, plotZ0, plotZ0prompt, spacerVisualization);
    % 705 712
    % 706 712
    % 707 712
    % 708 712
    % 709 712
    % 710 712
    visualizationPane.LayoutGrid = horzcat(12.0, numgrid);
    visualizationPane.RowSpan = [1.0 1.0];
    visualizationPane.ColSpan = [1.0 1.0];
    visualizationPane.RowStretch = horzcat(zeros(1.0, 10.0), 1.0, 0.0);
    % 715 720
    % 716 720
    % 717 720
    % 718 720
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [1.0 1.0];
    mainTab.RowStretch = 0.0;
    mainTab.ColStretch = 0.0;
    % 724 727
    % 725 727
    noiseTab.Name = 'Noise Data';
    noiseTab.Items = cellhorzcat(noisePane);
    noiseTab.LayoutGrid = [1.0 1.0];
    noiseTab.RowStretch = 0.0;
    noiseTab.ColStretch = 0.0;
    % 731 734
    % 732 734
    nonlinearTab.Name = 'Nonlinearity Data';
    nonlinearTab.Items = cellhorzcat(nonlinearPane);
    nonlinearTab.LayoutGrid = [1.0 1.0];
    nonlinearTab.RowStretch = 0.0;
    nonlinearTab.ColStretch = 0.0;
    % 738 741
    % 739 741
    visualizationTab.Name = 'Visualization';
    visualizationTab.Items = cellhorzcat(visualizationPane);
    visualizationTab.LayoutGrid = [1.0 1.0];
    visualizationTab.RowStretch = 0.0;
    visualizationTab.ColStretch = 0.0;
    % 745 748
    % 746 748
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'TabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, noiseTab, nonlinearTab, visualizationTab);
    % 751 754
    % 752 754
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
