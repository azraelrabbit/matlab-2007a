function dlgStruct = getDialogSchema(this, dummy)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    myblk = horzcat(this.Block.Path, '/', this.Block.Name);
    dialog = findDialog(myblk);
    if not(isempty(dialog))
        create_new_dialog = false;
    else
        create_new_dialog = true;
    end % if
    % 18 21
    % 19 21
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
    % 32 35
    % 33 35
    zl = dspGetLeafWidgetBase('edit', '', 'Zl', this, 'Zl');
    zl.RowSpan = [1.0 1.0];
    zl.ColSpan = horzcat(lwidget, rwidget);
    % 37 39
    zlprompt = dspGetLeafWidgetBase('text', 'Load impedance:', 'ZlPrompt', 0.0);
    % 39 41
    zlprompt.RowSpan = [1.0 1.0];
    zlprompt.ColSpan = horzcat(lprompt, rprompt);
    % 42 44
    spacerMain = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerMain.RowSpan = [2.0 2.0];
    spacerMain.ColSpan = horzcat(lprompt, rprompt);
    % 46 50
    % 47 50
    % 48 50
    Udata = this.Block.UserData;
    if isfield(Udata, 'System') && isa(Udata.System, 'rfbbequiv.system') && isa(Udata.System.OriginalCkt, 'rfckt.cascade') && ge(numel(Udata.System.OriginalCkt.Ckts), 1.0)
        % 51 54
        % 52 54
        VisEnabled = true;
    else
        VisEnabled = false;
    end % if
    % 57 59
    if VisEnabled
        % 59 62
        % 60 62
        sourceFreq = dspGetLeafWidgetBase('combobox', '', 'SourceFreq', this, 'SourceFreq');
        sourceFreq.RowSpan = [1.0 1.0];
        sourceFreq.ColSpan = horzcat(lwidget, rwidget);
        sourceFreq.DialogRefresh = 1.0;
        % 65 67
        sourceFreqprompt = dspGetLeafWidgetBase('text', 'Source of frequency data:', 'SourceFreqPrompt', 0.0);
        % 67 69
        sourceFreqprompt.RowSpan = [1.0 1.0];
        sourceFreqprompt.ColSpan = horzcat(lprompt, rprompt);
        % 70 73
        % 71 73
        if not(isempty(Udata.System.OriginalCkt.SimulationFreq))
            sourceFreq.Entries = {'Derived from Input Port parameters';'User-specified'};
        else
            % 75 77
            sourceFreq.Entries = {'User-specified'};
        end % if
        % 78 81
        % 79 81
        freq = dspGetLeafWidgetBase('edit', '', 'Freq', this, 'Freq');
        freq.RowSpan = [2.0 2.0];
        freq.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
        % 83 85
        freqprompt = dspGetLeafWidgetBase('text', 'Frequency data (Hz):', 'FreqPrompt', 0.0);
        % 85 87
        freqprompt.RowSpan = [2.0 2.0];
        freqprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
        % 88 91
        % 89 91
        if strcmpi(this.SourceFreq, 'User-specified')
            freq.Enabled = 1.0;
        else
            freq.Enabled = 0.0;
        end % if
        % 95 98
        % 96 98
        plotZ0 = dspGetLeafWidgetBase('edit', '', 'PlotZ0', this, 'PlotZ0');
        plotZ0.RowSpan = [5.0 5.0];
        plotZ0.ColSpan = horzcat(lwidget, rwidget);
        % 100 102
        plotZ0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'PlotZ0Prompt', 0.0);
        % 102 104
        plotZ0prompt.RowSpan = [5.0 5.0];
        plotZ0prompt.ColSpan = horzcat(lprompt, rprompt);
        % 105 108
        % 106 108
        allPlotType = dspGetLeafWidgetBase('combobox', '', 'AllPlotType', this, 'AllPlotType');
        % 108 110
        allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
        allPlotType.RowSpan = [6.0 6.0];
        allPlotType.ColSpan = horzcat(lwidget, rwidget);
        allPlotType.DialogRefresh = 1.0;
        % 113 115
        if gt(numel(Udata.System.OriginalCkt.Ckts), 1.0)
            allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
        else
            allPlotType.Entries = {'Composite data';'X-Y plane';'Polar plane';'Z Smith chart';'Y Smith chart';'ZY Smith chart'};
            % 118 125
            % 119 125
            % 120 125
            % 121 125
            % 122 125
            % 123 125
        end % if
        % 125 127
        allPlotTypeprompt = dspGetLeafWidgetBase('text', 'Plot type:', 'AllPlotTypePrompt', 0.0);
        % 127 129
        allPlotTypeprompt.RowSpan = [6.0 6.0];
        allPlotTypeprompt.ColSpan = horzcat(lprompt, rprompt);
        % 130 133
        % 131 133
        networkData = dspGetLeafWidgetBase('combobox', '', 'NetworkData1', this);
        % 133 135
        networkData.RowSpan = [7.0 7.0];
        networkData.ColSpan = horzcat(lwidget1, rwidget1);
        networkData.DialogRefresh = 1.0;
        networkData.MatlabMethod = 'storePlotControl';
        % 138 140
        networkDataprompt = dspGetLeafWidgetBase('text', 'Y parameter1:', 'NetworkDataPrompt', 0.0);
        % 140 142
        networkDataprompt.RowSpan = [7.0 7.0];
        networkDataprompt.ColSpan = horzcat(lprompt, rprompt);
        % 143 146
        % 144 146
        complexFormat = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat1', this);
        % 146 148
        complexFormat.RowSpan = [7.0 7.0];
        complexFormat.ColSpan = horzcat(lwidget2, rwidget2);
        complexFormat.MatlabMethod = 'storePlotControl';
        % 150 152
        complexFormatprompt = dspGetLeafWidgetBase('text', 'Y format1:', 'ComplexFormatPrompt', 0.0);
        % 152 154
        complexFormatprompt.RowSpan = [7.0 7.0];
        complexFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
        % 155 158
        % 156 158
        networkData2 = dspGetLeafWidgetBase('combobox', '', 'NetworkData2', this);
        % 158 160
        networkData2.RowSpan = [8.0 8.0];
        networkData2.ColSpan = horzcat(lwidget1, rwidget1);
        networkData2.DialogRefresh = 1.0;
        networkData2.MatlabMethod = 'storePlotControl';
        % 163 165
        networkData2prompt = dspGetLeafWidgetBase('text', 'Y parameter2:', 'NetworkData2Prompt', 0.0);
        % 165 167
        networkData2prompt.RowSpan = [8.0 8.0];
        networkData2prompt.ColSpan = horzcat(lprompt, rprompt);
        % 168 171
        % 169 171
        complexFormat2 = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat2', this);
        % 171 173
        complexFormat2.RowSpan = [8.0 8.0];
        complexFormat2.ColSpan = horzcat(lwidget2, rwidget2);
        complexFormat2.MatlabMethod = 'storePlotControl';
        % 175 177
        complexFormat2prompt = dspGetLeafWidgetBase('text', 'Y format2:', 'ComplexFormat2Prompt', 0.0);
        % 177 179
        complexFormat2prompt.RowSpan = [8.0 8.0];
        complexFormat2prompt.ColSpan = horzcat(lprompt2, rprompt2);
        % 180 183
        % 181 183
        xParameter = dspGetLeafWidgetBase('combobox', '', 'XParameter', this);
        % 183 185
        xParameter.RowSpan = [9.0 9.0];
        xParameter.ColSpan = horzcat(lwidget1, rwidget1);
        xParameter.DialogRefresh = 1.0;
        xParameter.MatlabMethod = 'storePlotControl';
        % 188 190
        xParameterprompt = dspGetLeafWidgetBase('text', 'X parameter:', 'XParameterPrompt', 0.0);
        % 190 192
        xParameterprompt.RowSpan = [9.0 9.0];
        xParameterprompt.ColSpan = horzcat(lprompt, rprompt);
        % 193 196
        % 194 196
        xFormat = dspGetLeafWidgetBase('combobox', '', 'XFormat', this);
        % 196 198
        xFormat.RowSpan = [9.0 9.0];
        xFormat.ColSpan = horzcat(lwidget2, rwidget2);
        xFormat.MatlabMethod = 'storePlotControl';
        % 200 202
        xFormatprompt = dspGetLeafWidgetBase('text', 'X format:', 'XFormatPrompt', 0.0);
        % 202 204
        xFormatprompt.RowSpan = [9.0 9.0];
        xFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
        % 205 208
        % 206 208
        yoption = dspGetLeafWidgetBase('combobox', '', 'YOption', this, 'YOption');
        % 208 210
        yoption.RowSpan = [10.0 10.0];
        yoption.ColSpan = horzcat(lwidget1, rwidget1);
        % 211 213
        yoptionprompt = dspGetLeafWidgetBase('text', 'Y scale:', 'YOptionPrompt', 0.0);
        % 213 215
        yoptionprompt.RowSpan = [10.0 10.0];
        yoptionprompt.ColSpan = horzcat(lprompt, rprompt);
        % 216 219
        % 217 219
        xoption = dspGetLeafWidgetBase('combobox', '', 'XOption', this, 'XOption');
        % 219 221
        xoption.RowSpan = [10.0 10.0];
        xoption.ColSpan = horzcat(lwidget2, rwidget2);
        % 222 224
        xoptionprompt = dspGetLeafWidgetBase('text', 'X scale:', 'XOptionPrompt', 0.0);
        % 224 226
        xoptionprompt.RowSpan = [10.0 10.0];
        xoptionprompt.ColSpan = horzcat(lprompt2, rprompt2);
        % 227 230
        % 228 230
        plotButton = dspGetLeafWidgetBase('pushbutton', 'Plot', 'PlotButton', this, 'PlotButton');
        % 230 232
        plotButton.RowSpan = [12.0 12.0];
        plotButton.ColSpan = horzcat(minus(rwidget, 1.0), rwidget);
        % 233 235
        spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
        spacerVisualization.RowSpan = [11.0 11.0];
        spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
        % 237 240
        % 238 240
        Udata = this.Block.UserData;
        % 240 242
        if strcmpi(get_param(bdroot, 'BlockDiagramType'), 'library')
            mydata = rfdata.data('S_Parameters', [0.0 0.0 ;  1.0 0.0], 'Freq', 1e+09);
        else
            try
                myckt = analyze(Udata.System.OriginalCkt, 1e+09);
                mydata = myckt.AnalyzedResult;
            catch
                errordlg(lasterr, horzcat(this.Block.Name, ' Error Dialog'));
                mydata = rfdata.data('S_Parameters', [0.0 0.0 ;  1.0 0.0], 'Freq', 1e+09);
            end % try
        end % if
        switch this.AllPlotType
        case 'X-Y plane'
            networkData.Enabled = 1.0;
            networkData.Entries = listparam(mydata);
            % 256 258
            complexFormat.Enabled = 1.0;
            networkData2.Enabled = 1.0;
            complexFormat2.Enabled = 1.0;
            xoption.Enabled = 1.0;
            yoption.Enabled = 1.0;
            xParameter.Enabled = 1.0;
            xFormat.Enabled = 1.0;
        case 'Composite data'
            % 265 267
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
            % 276 278
            networkData.Enabled = 1.0;
            allparam = listparam(mydata);
            if any(strcmpi(allparam, 'LS11'))
                networkData.Entries = {'S11';'S12';'S21';'S22';'LS11';'LS12';'LS21';'LS22'};
            else
                % 282 284
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
            % 293 295
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
        case 'Link budget'
            % 309 311
            networkData.Enabled = 1.0;
            networkData.Entries = listparam(mydata);
            complexFormat.Enabled = 1.0;
            networkData2.Enabled = 1.0;
            complexFormat2.Enabled = 1.0;
            xoption.Enabled = 0.0;
            yoption.Enabled = 0.0;
            xParameter.Enabled = 1.0;
            xFormat.Enabled = 1.0;
            % 319 321
        end % switch
        networkData2.Entries = cellhorzcat('   ', networkData.Entries{:});
        % 322 324
        if create_new_dialog && not(isempty(this.Block.AppliedNetworkData)) && not(isempty(this.Block.AppliedXParameter))
            % 324 326
            complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData));
            if not(isempty(strtrim(this.Block.AppliedNetworkData2)))
                complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.AppliedNetworkData2));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(mydata, this.Block.AppliedNetworkData);
            xFormat.Entries = listxformat(mydata, this.Block.AppliedXParameter);
            % 333 335
            networkData.Value = this.Block.AppliedNetworkData;
            networkData2.Value = this.Block.AppliedNetworkData2;
            complexFormat.Value = this.Block.AppliedComplexFormat;
            complexFormat2.Value = this.Block.AppliedComplexFormat2;
            xParameter.Value = this.Block.AppliedXParameter;
            xFormat.Value = this.Block.AppliedXFormat;
            % 340 342
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
                % 351 354
                % 352 354
                complexFormat.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData1));
                if not(isempty(strtrim(this.Block.UserData.NetworkData2)))
                    complexFormat2.Entries = simplifyformats(listformat(mydata, this.Block.UserData.NetworkData2));
                else
                    complexFormat2.Entries = {'   '};
                end % if
                xParameter.Entries = listxparam(mydata, this.Block.UserData.NetworkData1);
                xFormat.Entries = listxformat(mydata, this.Block.UserData.XParameter);
                % 361 363
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
                % 399 401
                complexFormat.Entries = simplifyformats(listformat(mydata, networkData.Entries{1.0}));
                if not(isempty(strtrim(networkData2.Entries{1.0})))
                    complexFormat2.Entries = simplifyformats(listformat(mydata, networkData2.Entries{1.0}));
                else
                    complexFormat2.Entries = {'   '};
                end % if
                xParameter.Entries = listxparam(mydata, networkData.Entries{1.0});
                xFormat.Entries = listxformat(mydata, xParameter.Entries{1.0});
                % 408 410
                networkData.Value = 0.0;
                networkData2.Value = 0.0;
                complexFormat.Value = 0.0;
                complexFormat2.Value = 0.0;
                xParameter.Value = 0.0;
                xFormat.Value = 0.0;
                % 415 417
                this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
                this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
                this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
                this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
                this.Block.UserData.XParameter = xParameter.Entries{1.0};
                this.Block.UserData.XFormat = xFormat.Entries{1.0};
                % 422 424
            end % if
            % 424 426
        end % if
        networkData.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData.Entries);
        complexFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat.Entries);
        networkData2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData2.Entries);
        complexFormat2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat2.Entries);
        xParameter.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xParameter.Entries);
        xFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xFormat.Entries);
        plotButton.MatlabMethod = 'sysplotParam';
        plotButton.MatlabArgs = cellhorzcat(horzcat(this.Block.Path, '/', this.Block.Name), '%dialog', networkData.Entries, complexFormat.Entries, networkData2.Entries, complexFormat2.Entries, xParameter.Entries, xFormat.Entries);
    else
        % 435 438
        % 436 438
        % 437 440
        % 438 440
        if isfield(Udata, 'System') && isa(Udata.System, 'rfbbequiv.system') && isa(Udata.System.OriginalCkt, 'rfckt.cascade') && le(numel(Udata.System.OriginalCkt.Ckts), 1.0)
            % 440 443
            % 441 443
            temptxt = horzcat('Visualization is only available when there are two or more blocks', sprintf('\n'), 'between the Input Port block and the Output Port block.');
        else
            % 444 446
            temptxt = horzcat('Visualization is only available after you run a simulation or', sprintf('\n'), 'click Update Diagram to initialize the model.');
            % 446 448
        end % if
        % 448 450
        visTitle = dspGetLeafWidgetBase('text', temptxt, 'VisTitle', 0.0);
        visTitle.RowSpan = [1.0 1.0];
        visTitle.ColSpan = horzcat(1.0, middle);
        % 452 454
        spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
        spacerVisualization.RowSpan = [2.0 2.0];
        spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
        % 456 458
    end % if
    % 458 463
    % 459 463
    % 460 463
    % 461 463
    mainPane = dspGetContainerWidgetBase('panel', '', 'MainPane');
    mainPane.Items = cellhorzcat(zl, zlprompt, spacerMain);
    mainPane.LayoutGrid = horzcat(2.0, numgrid);
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    mainPane.RowStretch = [0.0 1.0];
    % 468 471
    % 469 471
    visualizationPane = dspGetContainerWidgetBase('panel', '', 'VisualizationPane');
    if VisEnabled
        visualizationPane.Items = cellhorzcat(sourceFreq, sourceFreqprompt, freq, freqprompt, allPlotType, allPlotTypeprompt, networkData, networkDataprompt, complexFormat, complexFormatprompt, networkData2, networkData2prompt, complexFormat2, complexFormat2prompt, yoption, yoptionprompt, xoption, xoptionprompt, plotButton, xParameter, xParameterprompt, xFormat, xFormatprompt, plotZ0, plotZ0prompt, spacerVisualization);
        % 473 479
        % 474 479
        % 475 479
        % 476 479
        % 477 479
        visualizationPane.LayoutGrid = horzcat(12.0, numgrid);
        visualizationPane.RowStretch = horzcat(zeros(1.0, 10.0), 1.0, 0.0);
    else
        visualizationPane.Items = cellhorzcat(visTitle, spacerVisualization);
        visualizationPane.LayoutGrid = horzcat(2.0, numgrid);
        visualizationPane.RowStretch = [0.0 1.0];
    end % if
    visualizationPane.RowSpan = [1.0 1.0];
    visualizationPane.ColSpan = [1.0 1.0];
    % 487 492
    % 488 492
    % 489 492
    % 490 492
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [1.0 1.0];
    mainTab.RowStretch = 0.0;
    mainTab.ColStretch = 0.0;
    % 496 499
    % 497 499
    visualizationTab.Name = 'Visualization';
    visualizationTab.Items = cellhorzcat(visualizationPane);
    visualizationTab.LayoutGrid = [1.0 1.0];
    visualizationTab.RowStretch = 0.0;
    visualizationTab.ColStretch = 0.0;
    % 503 506
    % 504 506
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'TabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, visualizationTab);
    % 509 512
    % 510 512
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
