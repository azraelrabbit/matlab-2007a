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
    netparamDataprompt = dspGetLeafWidgetBase('text', 'Z-Parameters:', 'NetParamDataPrompt', 0.0);
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
    interpMethod = dspGetLeafWidgetBase('combobox', '', 'InterpMethod', this, 'InterpMethod');
    % 61 63
    interpMethod.Entries = ctranspose(set(this, 'InterpMethod'));
    interpMethod.RowSpan = [3.0 3.0];
    interpMethod.ColSpan = horzcat(lwidget, rwidget);
    % 65 67
    interpMethodprompt = dspGetLeafWidgetBase('text', 'Interpolation method:', 'InterpMethodPrompt', 0.0);
    % 67 69
    interpMethodprompt.RowSpan = [3.0 3.0];
    interpMethodprompt.ColSpan = horzcat(lprompt, rprompt);
    % 70 72
    spacerMain = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerMain.RowSpan = [4.0 4.0];
    spacerMain.ColSpan = horzcat(lprompt, rprompt);
    % 74 78
    % 75 78
    % 76 78
    sourceFreq = dspGetLeafWidgetBase('combobox', '', 'SourceFreq', this, 'SourceFreq');
    sourceFreq.RowSpan = [1.0 1.0];
    sourceFreq.ColSpan = horzcat(lwidget, rwidget);
    sourceFreq.DialogRefresh = 1.0;
    % 81 83
    sourceFreqprompt = dspGetLeafWidgetBase('text', 'Source of frequency data:', 'SourceFreqPrompt', 0.0);
    % 83 85
    sourceFreqprompt.RowSpan = [1.0 1.0];
    sourceFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 86 89
    % 87 89
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && not(isempty(Udata.Ckt.SimulationFreq))
        % 90 92
        sourceFreq.Entries = ctranspose(set(this, 'SourceFreq'));
    else
        sourceFreq.Entries = {'Same as the z-parameters frequency','User-specified'};
        % 94 96
    end % if
    % 96 99
    % 97 99
    freq = dspGetLeafWidgetBase('edit', '', 'Freq', this, 'Freq');
    freq.RowSpan = [2.0 2.0];
    freq.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 101 103
    freqprompt = dspGetLeafWidgetBase('text', 'Frequency data (Hz):', 'FreqPrompt', 0.0);
    % 103 105
    freqprompt.RowSpan = [2.0 2.0];
    freqprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 106 109
    % 107 109
    if strcmpi(this.SourceFreq, 'User-specified')
        freq.Enabled = 1.0;
    else
        freq.Enabled = 0.0;
    end % if
    % 113 116
    % 114 116
    sourcePin = dspGetLeafWidgetBase('combobox', '', 'SourcePin', this, 'SourcePin');
    sourcePin.Entries = ctranspose(set(this, 'SourcePin'));
    sourcePin.RowSpan = [3.0 3.0];
    sourcePin.ColSpan = horzcat(lwidget, rwidget);
    sourcePin.DialogRefresh = 1.0;
    % 120 122
    sourcePinprompt = dspGetLeafWidgetBase('text', 'Source of input power data:', 'SourcePinPrompt', 0.0);
    % 122 124
    sourcePinprompt.RowSpan = [3.0 3.0];
    sourcePinprompt.ColSpan = horzcat(lprompt, rprompt);
    % 125 128
    % 126 128
    pin = dspGetLeafWidgetBase('edit', '', 'Pin', this, 'Pin');
    pin.RowSpan = [4.0 4.0];
    pin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 130 132
    pinprompt = dspGetLeafWidgetBase('text', 'Input power data (dBm):', 'PinPrompt', 0.0);
    % 132 134
    pinprompt.RowSpan = [4.0 4.0];
    pinprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 135 138
    % 136 138
    if strcmpi(this.SourcePin, 'User-specified')
        pin.Enabled = 1.0;
    else
        pin.Enabled = 0.0;
    end % if
    % 142 144
    sourcePinprompt.Visible = 0.0;
    sourcePin.Visible = 0.0;
    pinprompt.Visible = 0.0;
    pin.Visible = 0.0;
    % 147 150
    % 148 150
    plotZ0 = dspGetLeafWidgetBase('edit', '', 'PlotZ0', this, 'PlotZ0');
    plotZ0.RowSpan = [5.0 5.0];
    plotZ0.ColSpan = horzcat(lwidget, rwidget);
    % 152 154
    plotZ0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'PlotZ0Prompt', 0.0);
    % 154 156
    plotZ0prompt.RowSpan = [5.0 5.0];
    plotZ0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 157 160
    % 158 160
    allPlotType = dspGetLeafWidgetBase('combobox', '', 'AllPlotType', this, 'AllPlotType');
    % 160 162
    allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
    allPlotType.RowSpan = [6.0 6.0];
    allPlotType.ColSpan = horzcat(lwidget, rwidget);
    allPlotType.DialogRefresh = 1.0;
    % 165 167
    allPlotTypeprompt = dspGetLeafWidgetBase('text', 'Plot type:', 'AllPlotTypePrompt', 0.0);
    % 167 169
    allPlotTypeprompt.RowSpan = [6.0 6.0];
    allPlotTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 170 173
    % 171 173
    networkData = dspGetLeafWidgetBase('combobox', '', 'NetworkData1', this);
    % 173 175
    networkData.RowSpan = [7.0 7.0];
    networkData.ColSpan = horzcat(lwidget1, rwidget1);
    networkData.DialogRefresh = 1.0;
    networkData.MatlabMethod = 'storePlotControl';
    % 178 180
    networkDataprompt = dspGetLeafWidgetBase('text', 'Y parameter1:', 'NetworkDataPrompt', 0.0);
    % 180 182
    networkDataprompt.RowSpan = [7.0 7.0];
    networkDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 183 186
    % 184 186
    complexFormat = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat1', this);
    % 186 188
    complexFormat.RowSpan = [7.0 7.0];
    complexFormat.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat.MatlabMethod = 'storePlotControl';
    % 190 192
    complexFormatprompt = dspGetLeafWidgetBase('text', 'Y format1:', 'ComplexFormatPrompt', 0.0);
    % 192 194
    complexFormatprompt.RowSpan = [7.0 7.0];
    complexFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 195 198
    % 196 198
    networkData2 = dspGetLeafWidgetBase('combobox', '', 'NetworkData2', this);
    % 198 200
    networkData2.RowSpan = [8.0 8.0];
    networkData2.ColSpan = horzcat(lwidget1, rwidget1);
    networkData2.DialogRefresh = 1.0;
    networkData2.MatlabMethod = 'storePlotControl';
    % 203 205
    networkData2prompt = dspGetLeafWidgetBase('text', 'Y parameter2:', 'NetworkData2Prompt', 0.0);
    % 205 207
    networkData2prompt.RowSpan = [8.0 8.0];
    networkData2prompt.ColSpan = horzcat(lprompt, rprompt);
    % 208 211
    % 209 211
    complexFormat2 = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat2', this);
    % 211 213
    complexFormat2.RowSpan = [8.0 8.0];
    complexFormat2.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat2.MatlabMethod = 'storePlotControl';
    % 215 217
    complexFormat2prompt = dspGetLeafWidgetBase('text', 'Y format2:', 'ComplexFormat2Prompt', 0.0);
    % 217 219
    complexFormat2prompt.RowSpan = [8.0 8.0];
    complexFormat2prompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 220 223
    % 221 223
    xParameter = dspGetLeafWidgetBase('combobox', '', 'XParameter', this);
    % 223 225
    xParameter.RowSpan = [9.0 9.0];
    xParameter.ColSpan = horzcat(lwidget1, rwidget1);
    xParameter.DialogRefresh = 1.0;
    xParameter.MatlabMethod = 'storePlotControl';
    % 228 230
    xParameterprompt = dspGetLeafWidgetBase('text', 'X parameter:', 'XParameterPrompt', 0.0);
    % 230 232
    xParameterprompt.RowSpan = [9.0 9.0];
    xParameterprompt.ColSpan = horzcat(lprompt, rprompt);
    % 233 236
    % 234 236
    xFormat = dspGetLeafWidgetBase('combobox', '', 'XFormat', this);
    % 236 238
    xFormat.RowSpan = [9.0 9.0];
    xFormat.ColSpan = horzcat(lwidget2, rwidget2);
    xFormat.MatlabMethod = 'storePlotControl';
    % 240 242
    xFormatprompt = dspGetLeafWidgetBase('text', 'X format:', 'XFormatPrompt', 0.0);
    % 242 244
    xFormatprompt.RowSpan = [9.0 9.0];
    xFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 245 248
    % 246 248
    yoption = dspGetLeafWidgetBase('combobox', '', 'YOption', this, 'YOption');
    % 248 250
    yoption.RowSpan = [10.0 10.0];
    yoption.ColSpan = horzcat(lwidget1, rwidget1);
    % 251 253
    yoptionprompt = dspGetLeafWidgetBase('text', 'Y scale:', 'YOptionPrompt', 0.0);
    % 253 255
    yoptionprompt.RowSpan = [10.0 10.0];
    yoptionprompt.ColSpan = horzcat(lprompt, rprompt);
    % 256 259
    % 257 259
    xoption = dspGetLeafWidgetBase('combobox', '', 'XOption', this, 'XOption');
    % 259 261
    xoption.RowSpan = [10.0 10.0];
    xoption.ColSpan = horzcat(lwidget2, rwidget2);
    % 262 264
    xoptionprompt = dspGetLeafWidgetBase('text', 'X scale:', 'XOptionPrompt', 0.0);
    % 264 266
    xoptionprompt.RowSpan = [10.0 10.0];
    xoptionprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 267 270
    % 268 270
    plotButton = dspGetLeafWidgetBase('pushbutton', 'Plot', 'PlotButton', this, 'PlotButton');
    % 270 272
    plotButton.RowSpan = [12.0 12.0];
    plotButton.ColSpan = horzcat(minus(rwidget, 1.0), rwidget);
    % 273 275
    spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerVisualization.RowSpan = [11.0 11.0];
    spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
    % 277 280
    % 278 280
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && isa(Udata.Ckt.AnalyzedResult, 'rfdata.data')
        % 281 283
        mydata = Udata.Ckt.AnalyzedResult;
    else
        mydata = rfdata.data('S_Parameters', [0.0 0.0 ;  1.0 0.0], 'Freq', 1e+09);
    end % if
    switch this.AllPlotType
    case 'X-Y plane'
        networkData.Enabled = 1.0;
        networkData.Entries = listparam(mydata);
        % 290 292
        complexFormat.Enabled = 1.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 1.0;
        xoption.Enabled = 1.0;
        yoption.Enabled = 1.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
    case 'Composite data'
        % 299 301
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
        % 310 312
        networkData.Enabled = 1.0;
        allparam = listparam(mydata);
        if any(strcmpi(allparam, 'LS11'))
            networkData.Entries = {'S11';'S12';'S21';'S22';'LS11';'LS12';'LS21';'LS22'};
        else
            % 316 318
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
        % 327 329
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
        % 342 344
    end % switch
    networkData2.Entries = cellhorzcat('   ', networkData.Entries{:});
    % 345 347
    if create_new_dialog && not(isempty(this.Block.AppliedNetworkData)) && not(isempty(this.Block.AppliedXParameter))
        % 347 349
        complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData));
        if not(isempty(strtrim(this.Block.AppliedNetworkData2)))
            complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData2));
        else
            complexFormat2.Entries = {'   '};
        end % if
        xParameter.Entries = listxparam(mydata, this.Block.AppliedNetworkData);
        xFormat.Entries = listxformat(mydata, this.Block.AppliedXParameter);
        % 356 358
        networkData.Value = this.Block.AppliedNetworkData;
        networkData2.Value = this.Block.AppliedNetworkData2;
        complexFormat.Value = this.Block.AppliedComplexFormat;
        complexFormat2.Value = this.Block.AppliedComplexFormat2;
        xParameter.Value = this.Block.AppliedXParameter;
        xFormat.Value = this.Block.AppliedXFormat;
        % 363 365
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
            % 374 377
            % 375 377
            complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData1));
            if not(isempty(strtrim(this.Block.UserData.NetworkData2)))
                complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData2));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, this.Block.UserData.NetworkData1);
            xFormat.Entries = listxformat(mydata, this.Block.UserData.XParameter);
            % 384 386
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
            % 422 424
            complexFormat.Entries = simplifyformats(listformat(mydata, networkData.Entries{1.0}));
            if not(isempty(strtrim(networkData2.Entries{1.0})))
                complexFormat2.Entries = simplifyformats(listformat(mydata, networkData2.Entries{1.0}));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, networkData.Entries{1.0});
            xFormat.Entries = listxformat(mydata, xParameter.Entries{1.0});
            % 431 433
            networkData.Value = 0.0;
            networkData2.Value = 0.0;
            complexFormat.Value = 0.0;
            complexFormat2.Value = 0.0;
            xParameter.Value = 0.0;
            xFormat.Value = 0.0;
            % 438 440
            this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
            this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
            this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
            this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
            this.Block.UserData.XParameter = xParameter.Entries{1.0};
            this.Block.UserData.XFormat = xFormat.Entries{1.0};
            % 445 447
        end % if
        % 447 449
    end % if
    networkData.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData.Entries);
    complexFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat.Entries);
    networkData2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData2.Entries);
    complexFormat2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat2.Entries);
    xParameter.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xParameter.Entries);
    xFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xFormat.Entries);
    plotButton.MatlabMethod = 'plotParam';
    plotButton.MatlabArgs = cellhorzcat(horzcat(this.Block.Path, '/', this.Block.Name), '%dialog', networkData.Entries, complexFormat.Entries, networkData2.Entries, complexFormat2.Entries, xParameter.Entries, xFormat.Entries);
    % 457 464
    % 458 464
    % 459 464
    % 460 464
    % 461 464
    % 462 464
    mainPane = dspGetContainerWidgetBase('panel', '', 'MainPane');
    mainPane.Items = cellhorzcat(netparamData, netparamDataprompt, netparamFreq, netparamFreqprompt, interpMethod, interpMethodprompt, spacerMain);
    % 465 467
    mainPane.LayoutGrid = horzcat(4.0, numgrid);
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    mainPane.RowStretch = horzcat(zeros(1.0, 3.0), 1.0);
    % 470 473
    % 471 473
    visualizationPane = dspGetContainerWidgetBase('panel', '', 'VisualizationPane');
    visualizationPane.Items = cellhorzcat(sourceFreq, sourceFreqprompt, freq, freqprompt, allPlotType, allPlotTypeprompt, networkData, networkDataprompt, complexFormat, complexFormatprompt, networkData2, networkData2prompt, complexFormat2, complexFormat2prompt, yoption, yoptionprompt, xoption, xoptionprompt, plotButton, xParameter, xParameterprompt, xFormat, xFormatprompt, sourcePin, sourcePinprompt, pin, pinprompt, plotZ0, plotZ0prompt, spacerVisualization);
    % 474 481
    % 475 481
    % 476 481
    % 477 481
    % 478 481
    % 479 481
    visualizationPane.LayoutGrid = horzcat(12.0, numgrid);
    visualizationPane.RowSpan = [1.0 1.0];
    visualizationPane.ColSpan = [1.0 1.0];
    visualizationPane.RowStretch = horzcat(zeros(1.0, 10.0), 1.0, 0.0);
    % 484 488
    % 485 488
    % 486 488
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [1.0 1.0];
    mainTab.RowStretch = 0.0;
    mainTab.ColStretch = 0.0;
    % 492 495
    % 493 495
    visualizationTab.Name = 'Visualization';
    visualizationTab.Items = cellhorzcat(visualizationPane);
    visualizationTab.LayoutGrid = [1.0 1.0];
    visualizationTab.RowStretch = 0.0;
    visualizationTab.ColStretch = 0.0;
    % 499 502
    % 500 502
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'TabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, visualizationTab);
    % 505 508
    % 506 508
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
