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
    sourceFreq = dspGetLeafWidgetBase('combobox', '', 'SourceFreq', this, 'SourceFreq');
    sourceFreq.RowSpan = [1.0 1.0];
    sourceFreq.ColSpan = horzcat(lwidget, rwidget);
    sourceFreq.DialogRefresh = 1.0;
    % 91 93
    sourceFreqprompt = dspGetLeafWidgetBase('text', 'Source of frequency data:', 'SourceFreqPrompt', 0.0);
    % 93 95
    sourceFreqprompt.RowSpan = [1.0 1.0];
    sourceFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 96 99
    % 97 99
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && not(isempty(Udata.Ckt.SimulationFreq))
        % 100 102
        sourceFreq.Entries = ctranspose(set(this, 'SourceFreq'));
    else
        sourceFreq.Entries = {'Same as the s-parameters frequency','User-specified'};
        % 104 106
    end % if
    % 106 109
    % 107 109
    freq = dspGetLeafWidgetBase('edit', '', 'Freq', this, 'Freq');
    freq.RowSpan = [2.0 2.0];
    freq.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 111 113
    freqprompt = dspGetLeafWidgetBase('text', 'Frequency data (Hz):', 'FreqPrompt', 0.0);
    % 113 115
    freqprompt.RowSpan = [2.0 2.0];
    freqprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 116 119
    % 117 119
    if strcmpi(this.SourceFreq, 'User-specified')
        freq.Enabled = 1.0;
    else
        freq.Enabled = 0.0;
    end % if
    % 123 126
    % 124 126
    sourcePin = dspGetLeafWidgetBase('combobox', '', 'SourcePin', this, 'SourcePin');
    sourcePin.Entries = ctranspose(set(this, 'SourcePin'));
    sourcePin.RowSpan = [3.0 3.0];
    sourcePin.ColSpan = horzcat(lwidget, rwidget);
    sourcePin.DialogRefresh = 1.0;
    % 130 132
    sourcePinprompt = dspGetLeafWidgetBase('text', 'Source of input power data:', 'SourcePinPrompt', 0.0);
    % 132 134
    sourcePinprompt.RowSpan = [3.0 3.0];
    sourcePinprompt.ColSpan = horzcat(lprompt, rprompt);
    % 135 138
    % 136 138
    pin = dspGetLeafWidgetBase('edit', '', 'Pin', this, 'Pin');
    pin.RowSpan = [4.0 4.0];
    pin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 140 142
    pinprompt = dspGetLeafWidgetBase('text', 'Input power data (dBm):', 'PinPrompt', 0.0);
    % 142 144
    pinprompt.RowSpan = [4.0 4.0];
    pinprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 145 148
    % 146 148
    if strcmpi(this.SourcePin, 'User-specified')
        pin.Enabled = 1.0;
    else
        pin.Enabled = 0.0;
    end % if
    % 152 154
    sourcePinprompt.Visible = 0.0;
    sourcePin.Visible = 0.0;
    pinprompt.Visible = 0.0;
    pin.Visible = 0.0;
    % 157 160
    % 158 160
    plotZ0 = dspGetLeafWidgetBase('edit', '', 'PlotZ0', this, 'PlotZ0');
    plotZ0.RowSpan = [5.0 5.0];
    plotZ0.ColSpan = horzcat(lwidget, rwidget);
    % 162 164
    plotZ0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'PlotZ0Prompt', 0.0);
    % 164 166
    plotZ0prompt.RowSpan = [5.0 5.0];
    plotZ0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 167 170
    % 168 170
    allPlotType = dspGetLeafWidgetBase('combobox', '', 'AllPlotType', this, 'AllPlotType');
    % 170 172
    allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
    allPlotType.RowSpan = [6.0 6.0];
    allPlotType.ColSpan = horzcat(lwidget, rwidget);
    allPlotType.DialogRefresh = 1.0;
    % 175 177
    allPlotTypeprompt = dspGetLeafWidgetBase('text', 'Plot type:', 'AllPlotTypePrompt', 0.0);
    % 177 179
    allPlotTypeprompt.RowSpan = [6.0 6.0];
    allPlotTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 180 183
    % 181 183
    networkData = dspGetLeafWidgetBase('combobox', '', 'NetworkData1', this);
    % 183 185
    networkData.RowSpan = [7.0 7.0];
    networkData.ColSpan = horzcat(lwidget1, rwidget1);
    networkData.DialogRefresh = 1.0;
    networkData.MatlabMethod = 'storePlotControl';
    % 188 190
    networkDataprompt = dspGetLeafWidgetBase('text', 'Y parameter1:', 'NetworkDataPrompt', 0.0);
    % 190 192
    networkDataprompt.RowSpan = [7.0 7.0];
    networkDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 193 196
    % 194 196
    complexFormat = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat1', this);
    % 196 198
    complexFormat.RowSpan = [7.0 7.0];
    complexFormat.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat.MatlabMethod = 'storePlotControl';
    % 200 202
    complexFormatprompt = dspGetLeafWidgetBase('text', 'Y format1:', 'ComplexFormatPrompt', 0.0);
    % 202 204
    complexFormatprompt.RowSpan = [7.0 7.0];
    complexFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 205 208
    % 206 208
    networkData2 = dspGetLeafWidgetBase('combobox', '', 'NetworkData2', this);
    % 208 210
    networkData2.RowSpan = [8.0 8.0];
    networkData2.ColSpan = horzcat(lwidget1, rwidget1);
    networkData2.DialogRefresh = 1.0;
    networkData2.MatlabMethod = 'storePlotControl';
    % 213 215
    networkData2prompt = dspGetLeafWidgetBase('text', 'Y parameter2:', 'NetworkData2Prompt', 0.0);
    % 215 217
    networkData2prompt.RowSpan = [8.0 8.0];
    networkData2prompt.ColSpan = horzcat(lprompt, rprompt);
    % 218 221
    % 219 221
    complexFormat2 = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat2', this);
    % 221 223
    complexFormat2.RowSpan = [8.0 8.0];
    complexFormat2.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat2.MatlabMethod = 'storePlotControl';
    % 225 227
    complexFormat2prompt = dspGetLeafWidgetBase('text', 'Y format2:', 'ComplexFormat2Prompt', 0.0);
    % 227 229
    complexFormat2prompt.RowSpan = [8.0 8.0];
    complexFormat2prompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 230 233
    % 231 233
    xParameter = dspGetLeafWidgetBase('combobox', '', 'XParameter', this);
    % 233 235
    xParameter.RowSpan = [9.0 9.0];
    xParameter.ColSpan = horzcat(lwidget1, rwidget1);
    xParameter.DialogRefresh = 1.0;
    xParameter.MatlabMethod = 'storePlotControl';
    % 238 240
    xParameterprompt = dspGetLeafWidgetBase('text', 'X parameter:', 'XParameterPrompt', 0.0);
    % 240 242
    xParameterprompt.RowSpan = [9.0 9.0];
    xParameterprompt.ColSpan = horzcat(lprompt, rprompt);
    % 243 246
    % 244 246
    xFormat = dspGetLeafWidgetBase('combobox', '', 'XFormat', this);
    % 246 248
    xFormat.RowSpan = [9.0 9.0];
    xFormat.ColSpan = horzcat(lwidget2, rwidget2);
    xFormat.MatlabMethod = 'storePlotControl';
    % 250 252
    xFormatprompt = dspGetLeafWidgetBase('text', 'X format:', 'XFormatPrompt', 0.0);
    % 252 254
    xFormatprompt.RowSpan = [9.0 9.0];
    xFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 255 258
    % 256 258
    yoption = dspGetLeafWidgetBase('combobox', '', 'YOption', this, 'YOption');
    % 258 260
    yoption.RowSpan = [10.0 10.0];
    yoption.ColSpan = horzcat(lwidget1, rwidget1);
    % 261 263
    yoptionprompt = dspGetLeafWidgetBase('text', 'Y scale:', 'YOptionPrompt', 0.0);
    % 263 265
    yoptionprompt.RowSpan = [10.0 10.0];
    yoptionprompt.ColSpan = horzcat(lprompt, rprompt);
    % 266 269
    % 267 269
    xoption = dspGetLeafWidgetBase('combobox', '', 'XOption', this, 'XOption');
    % 269 271
    xoption.RowSpan = [10.0 10.0];
    xoption.ColSpan = horzcat(lwidget2, rwidget2);
    % 272 274
    xoptionprompt = dspGetLeafWidgetBase('text', 'X scale:', 'XOptionPrompt', 0.0);
    % 274 276
    xoptionprompt.RowSpan = [10.0 10.0];
    xoptionprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 277 280
    % 278 280
    plotButton = dspGetLeafWidgetBase('pushbutton', 'Plot', 'PlotButton', this, 'PlotButton');
    % 280 282
    plotButton.RowSpan = [12.0 12.0];
    plotButton.ColSpan = horzcat(minus(rwidget, 1.0), rwidget);
    % 283 285
    spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerVisualization.RowSpan = [11.0 11.0];
    spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
    % 287 290
    % 288 290
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && isa(Udata.Ckt.AnalyzedResult, 'rfdata.data')
        % 291 293
        mydata = Udata.Ckt.AnalyzedResult;
    else
        mydata = rfdata.data('S_Parameters', [0.0 0.0 ;  1.0 0.0], 'Freq', 1e+09);
    end % if
    switch this.AllPlotType
    case 'X-Y plane'
        networkData.Enabled = 1.0;
        networkData.Entries = listparam(mydata);
        % 300 302
        complexFormat.Enabled = 1.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 1.0;
        xoption.Enabled = 1.0;
        yoption.Enabled = 1.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
    case 'Composite data'
        % 309 311
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
        % 320 322
        networkData.Enabled = 1.0;
        allparam = listparam(mydata);
        if any(strcmpi(allparam, 'LS11'))
            networkData.Entries = {'S11';'S12';'S21';'S22';'LS11';'LS12';'LS21';'LS22'};
        else
            % 326 328
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
        % 337 339
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
        % 352 354
    end % switch
    networkData2.Entries = cellhorzcat('   ', networkData.Entries{:});
    % 355 357
    if create_new_dialog && not(isempty(this.Block.AppliedNetworkData)) && not(isempty(this.Block.AppliedXParameter))
        % 357 359
        complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData));
        if not(isempty(strtrim(this.Block.AppliedNetworkData2)))
            complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData2));
        else
            complexFormat2.Entries = {'   '};
        end % if
        xParameter.Entries = listxparam(mydata, this.Block.AppliedNetworkData);
        xFormat.Entries = listxformat(mydata, this.Block.AppliedXParameter);
        % 366 368
        networkData.Value = this.Block.AppliedNetworkData;
        networkData2.Value = this.Block.AppliedNetworkData2;
        complexFormat.Value = this.Block.AppliedComplexFormat;
        complexFormat2.Value = this.Block.AppliedComplexFormat2;
        xParameter.Value = this.Block.AppliedXParameter;
        xFormat.Value = this.Block.AppliedXFormat;
        % 373 375
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
            % 384 387
            % 385 387
            complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData1));
            if not(isempty(strtrim(this.Block.UserData.NetworkData2)))
                complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData2));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, this.Block.UserData.NetworkData1);
            xFormat.Entries = listxformat(mydata, this.Block.UserData.XParameter);
            % 394 396
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
            % 432 434
            complexFormat.Entries = simplifyformats(listformat(mydata, networkData.Entries{1.0}));
            if not(isempty(strtrim(networkData2.Entries{1.0})))
                complexFormat2.Entries = simplifyformats(listformat(mydata, networkData2.Entries{1.0}));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, networkData.Entries{1.0});
            xFormat.Entries = listxformat(mydata, xParameter.Entries{1.0});
            % 441 443
            networkData.Value = 0.0;
            networkData2.Value = 0.0;
            complexFormat.Value = 0.0;
            complexFormat2.Value = 0.0;
            xParameter.Value = 0.0;
            xFormat.Value = 0.0;
            % 448 450
            this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
            this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
            this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
            this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
            this.Block.UserData.XParameter = xParameter.Entries{1.0};
            this.Block.UserData.XFormat = xFormat.Entries{1.0};
            % 455 457
        end % if
        % 457 459
    end % if
    networkData.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData.Entries);
    complexFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat.Entries);
    networkData2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData2.Entries);
    complexFormat2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat2.Entries);
    xParameter.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xParameter.Entries);
    xFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xFormat.Entries);
    plotButton.MatlabMethod = 'plotParam';
    plotButton.MatlabArgs = cellhorzcat(horzcat(this.Block.Path, '/', this.Block.Name), '%dialog', networkData.Entries, complexFormat.Entries, networkData2.Entries, complexFormat2.Entries, xParameter.Entries, xFormat.Entries);
    % 467 474
    % 468 474
    % 469 474
    % 470 474
    % 471 474
    % 472 474
    mainPane = dspGetContainerWidgetBase('panel', '', 'MainPane');
    mainPane.Items = cellhorzcat(netparamData, netparamDataprompt, netparamFreq, netparamFreqprompt, z0, z0prompt, interpMethod, interpMethodprompt, spacerMain);
    % 475 478
    % 476 478
    mainPane.LayoutGrid = horzcat(5.0, numgrid);
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    mainPane.RowStretch = horzcat(zeros(1.0, 4.0), 1.0);
    % 481 484
    % 482 484
    visualizationPane = dspGetContainerWidgetBase('panel', '', 'VisualizationPane');
    visualizationPane.Items = cellhorzcat(sourceFreq, sourceFreqprompt, freq, freqprompt, allPlotType, allPlotTypeprompt, networkData, networkDataprompt, complexFormat, complexFormatprompt, networkData2, networkData2prompt, complexFormat2, complexFormat2prompt, yoption, yoptionprompt, xoption, xoptionprompt, plotButton, xParameter, xParameterprompt, xFormat, xFormatprompt, sourcePin, sourcePinprompt, pin, pinprompt, plotZ0, plotZ0prompt, spacerVisualization);
    % 485 492
    % 486 492
    % 487 492
    % 488 492
    % 489 492
    % 490 492
    visualizationPane.LayoutGrid = horzcat(12.0, numgrid);
    visualizationPane.RowSpan = [1.0 1.0];
    visualizationPane.ColSpan = [1.0 1.0];
    visualizationPane.RowStretch = horzcat(zeros(1.0, 10.0), 1.0, 0.0);
    % 495 499
    % 496 499
    % 497 499
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [1.0 1.0];
    mainTab.RowStretch = 0.0;
    mainTab.ColStretch = 0.0;
    % 503 506
    % 504 506
    visualizationTab.Name = 'Visualization';
    visualizationTab.Items = cellhorzcat(visualizationPane);
    visualizationTab.LayoutGrid = [1.0 1.0];
    visualizationTab.RowStretch = 0.0;
    visualizationTab.ColStretch = 0.0;
    % 510 513
    % 511 513
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'TabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, visualizationTab);
    % 516 519
    % 517 519
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
