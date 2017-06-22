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
    datasource = dspGetLeafWidgetBase('combobox', '', 'DataSource', this, 'DataSource');
    % 40 42
    datasource.Entries = ctranspose(set(this, 'DataSource'));
    datasource.RowSpan = [1.0 1.0];
    datasource.ColSpan = horzcat(lwidget, rwidget);
    datasource.DialogRefresh = 1.0;
    % 45 47
    datasourceprompt = dspGetLeafWidgetBase('text', 'Data source:', 'DataSourcePrompt', 0.0);
    % 47 49
    datasourceprompt.RowSpan = [1.0 1.0];
    datasourceprompt.ColSpan = horzcat(lprompt, rprompt);
    % 50 53
    % 51 53
    rfdataObj = dspGetLeafWidgetBase('edit', '', 'RFDATA', this, 'RFDATA');
    % 53 55
    rfdataObj.RowSpan = [3.0 3.0];
    rfdataObj.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    rfdataObj.DialogRefresh = 1.0;
    % 57 59
    rfdataObjprompt = dspGetLeafWidgetBase('text', 'RFDATA object:', 'RFDATAPrompt', 0.0);
    % 59 61
    rfdataObjprompt.RowSpan = [3.0 3.0];
    rfdataObjprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 62 65
    % 63 65
    file = dspGetLeafWidgetBase('edit', '', 'File', this, 'File');
    % 65 67
    file.RowSpan = [2.0 2.0];
    file.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    file.DialogRefresh = 1.0;
    % 69 71
    fileprompt = dspGetLeafWidgetBase('text', 'Data file:', 'FilePrompt', 0.0);
    % 71 73
    fileprompt.RowSpan = [2.0 2.0];
    fileprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 74 76
    browse = dspGetLeafWidgetBase('pushbutton', 'Browse ...', 'Browse', this);
    browse.RowSpan = [2.0 2.0];
    browse.ColSpan = horzcat(lbutton, rbutton);
    browse.MatlabMethod = 'browseFile';
    browse.MatlabArgs = {'%source','%dialog'};
    % 80 83
    % 81 83
    interpMethod = dspGetLeafWidgetBase('combobox', '', 'InterpMethod', this, 'InterpMethod');
    % 83 85
    interpMethod.Entries = ctranspose(set(this, 'InterpMethod'));
    interpMethod.RowSpan = [4.0 4.0];
    interpMethod.ColSpan = horzcat(lwidget, rwidget);
    % 87 89
    interpMethodprompt = dspGetLeafWidgetBase('text', 'Interpolation method:', 'InterpMethodPrompt', 0.0);
    % 89 91
    interpMethodprompt.RowSpan = [4.0 4.0];
    interpMethodprompt.ColSpan = horzcat(lprompt, rprompt);
    % 92 94
    spacerMain = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerMain.RowSpan = [5.0 5.0];
    spacerMain.ColSpan = horzcat(lprompt, rprompt);
    % 96 100
    % 97 100
    % 98 100
    sourceFreq = dspGetLeafWidgetBase('combobox', '', 'SourceFreq', this, 'SourceFreq');
    sourceFreq.RowSpan = [1.0 1.0];
    sourceFreq.ColSpan = horzcat(lwidget, rwidget);
    sourceFreq.DialogRefresh = 1.0;
    % 103 105
    sourceFreqprompt = dspGetLeafWidgetBase('text', 'Source of frequency data:', 'SourceFreqPrompt', 0.0);
    % 105 107
    sourceFreqprompt.RowSpan = [1.0 1.0];
    sourceFreqprompt.ColSpan = horzcat(lprompt, rprompt);
    % 108 111
    % 109 111
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && not(isempty(Udata.Ckt.SimulationFreq))
        % 112 114
        sourceFreq.Entries = ctranspose(set(this, 'SourceFreq'));
    else
        sourceFreq.Entries = {'Extracted from data source','User-specified'};
        % 116 118
    end % if
    % 118 121
    % 119 121
    freq = dspGetLeafWidgetBase('edit', '', 'Freq', this, 'Freq');
    freq.RowSpan = [2.0 2.0];
    freq.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 123 125
    freqprompt = dspGetLeafWidgetBase('text', 'Frequency data (Hz):', 'FreqPrompt', 0.0);
    % 125 127
    freqprompt.RowSpan = [2.0 2.0];
    freqprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 128 131
    % 129 131
    if strcmpi(this.SourceFreq, 'User-specified')
        freq.Enabled = 1.0;
    else
        freq.Enabled = 0.0;
    end % if
    % 135 138
    % 136 138
    sourcePin = dspGetLeafWidgetBase('combobox', '', 'SourcePin', this, 'SourcePin');
    sourcePin.Entries = ctranspose(set(this, 'SourcePin'));
    sourcePin.RowSpan = [3.0 3.0];
    sourcePin.ColSpan = horzcat(lwidget, rwidget);
    sourcePin.DialogRefresh = 1.0;
    % 142 144
    sourcePinprompt = dspGetLeafWidgetBase('text', 'Source of input power data:', 'SourcePinPrompt', 0.0);
    % 144 146
    sourcePinprompt.RowSpan = [3.0 3.0];
    sourcePinprompt.ColSpan = horzcat(lprompt, rprompt);
    % 147 150
    % 148 150
    pin = dspGetLeafWidgetBase('edit', '', 'Pin', this, 'Pin');
    pin.RowSpan = [4.0 4.0];
    pin.ColSpan = horzcat(plus(lwidget, 1.0), rwidget);
    % 152 154
    pinprompt = dspGetLeafWidgetBase('text', 'Input power data (dBm):', 'PinPrompt', 0.0);
    % 154 156
    pinprompt.RowSpan = [4.0 4.0];
    pinprompt.ColSpan = horzcat(plus(lprompt, 1.0), rprompt);
    % 157 160
    % 158 160
    if strcmpi(this.SourcePin, 'User-specified')
        pin.Enabled = 1.0;
    else
        pin.Enabled = 0.0;
    end % if
    % 164 166
    sourcePinprompt.Visible = 0.0;
    sourcePin.Visible = 0.0;
    pinprompt.Visible = 0.0;
    pin.Visible = 0.0;
    % 169 172
    % 170 172
    plotZ0 = dspGetLeafWidgetBase('edit', '', 'PlotZ0', this, 'PlotZ0');
    plotZ0.RowSpan = [5.0 5.0];
    plotZ0.ColSpan = horzcat(lwidget, rwidget);
    % 174 176
    plotZ0prompt = dspGetLeafWidgetBase('text', 'Reference impedance:', 'PlotZ0Prompt', 0.0);
    % 176 178
    plotZ0prompt.RowSpan = [5.0 5.0];
    plotZ0prompt.ColSpan = horzcat(lprompt, rprompt);
    % 179 182
    % 180 182
    allPlotType = dspGetLeafWidgetBase('combobox', '', 'AllPlotType', this, 'AllPlotType');
    % 182 184
    allPlotType.Entries = ctranspose(set(this, 'AllPlotType'));
    allPlotType.RowSpan = [6.0 6.0];
    allPlotType.ColSpan = horzcat(lwidget, rwidget);
    allPlotType.DialogRefresh = 1.0;
    % 187 189
    allPlotTypeprompt = dspGetLeafWidgetBase('text', 'Plot type:', 'AllPlotTypePrompt', 0.0);
    % 189 191
    allPlotTypeprompt.RowSpan = [6.0 6.0];
    allPlotTypeprompt.ColSpan = horzcat(lprompt, rprompt);
    % 192 195
    % 193 195
    networkData = dspGetLeafWidgetBase('combobox', '', 'NetworkData1', this);
    % 195 197
    networkData.RowSpan = [7.0 7.0];
    networkData.ColSpan = horzcat(lwidget1, rwidget1);
    networkData.DialogRefresh = 1.0;
    networkData.MatlabMethod = 'storePlotControl';
    % 200 202
    networkDataprompt = dspGetLeafWidgetBase('text', 'Y parameter1:', 'NetworkDataPrompt', 0.0);
    % 202 204
    networkDataprompt.RowSpan = [7.0 7.0];
    networkDataprompt.ColSpan = horzcat(lprompt, rprompt);
    % 205 208
    % 206 208
    complexFormat = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat1', this);
    % 208 210
    complexFormat.RowSpan = [7.0 7.0];
    complexFormat.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat.MatlabMethod = 'storePlotControl';
    % 212 214
    complexFormatprompt = dspGetLeafWidgetBase('text', 'Y format1:', 'ComplexFormatPrompt', 0.0);
    % 214 216
    complexFormatprompt.RowSpan = [7.0 7.0];
    complexFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 217 220
    % 218 220
    networkData2 = dspGetLeafWidgetBase('combobox', '', 'NetworkData2', this);
    % 220 222
    networkData2.RowSpan = [8.0 8.0];
    networkData2.ColSpan = horzcat(lwidget1, rwidget1);
    networkData2.DialogRefresh = 1.0;
    networkData2.MatlabMethod = 'storePlotControl';
    % 225 227
    networkData2prompt = dspGetLeafWidgetBase('text', 'Y parameter2:', 'NetworkData2Prompt', 0.0);
    % 227 229
    networkData2prompt.RowSpan = [8.0 8.0];
    networkData2prompt.ColSpan = horzcat(lprompt, rprompt);
    % 230 233
    % 231 233
    complexFormat2 = dspGetLeafWidgetBase('combobox', '', 'ComplexFormat2', this);
    % 233 235
    complexFormat2.RowSpan = [8.0 8.0];
    complexFormat2.ColSpan = horzcat(lwidget2, rwidget2);
    complexFormat2.MatlabMethod = 'storePlotControl';
    % 237 239
    complexFormat2prompt = dspGetLeafWidgetBase('text', 'Y format2:', 'ComplexFormat2Prompt', 0.0);
    % 239 241
    complexFormat2prompt.RowSpan = [8.0 8.0];
    complexFormat2prompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 242 245
    % 243 245
    xParameter = dspGetLeafWidgetBase('combobox', '', 'XParameter', this);
    % 245 247
    xParameter.RowSpan = [9.0 9.0];
    xParameter.ColSpan = horzcat(lwidget1, rwidget1);
    xParameter.DialogRefresh = 1.0;
    xParameter.MatlabMethod = 'storePlotControl';
    % 250 252
    xParameterprompt = dspGetLeafWidgetBase('text', 'X parameter:', 'XParameterPrompt', 0.0);
    % 252 254
    xParameterprompt.RowSpan = [9.0 9.0];
    xParameterprompt.ColSpan = horzcat(lprompt, rprompt);
    % 255 258
    % 256 258
    xFormat = dspGetLeafWidgetBase('combobox', '', 'XFormat', this);
    % 258 260
    xFormat.RowSpan = [9.0 9.0];
    xFormat.ColSpan = horzcat(lwidget2, rwidget2);
    xFormat.MatlabMethod = 'storePlotControl';
    % 262 264
    xFormatprompt = dspGetLeafWidgetBase('text', 'X format:', 'XFormatPrompt', 0.0);
    % 264 266
    xFormatprompt.RowSpan = [9.0 9.0];
    xFormatprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 267 270
    % 268 270
    yoption = dspGetLeafWidgetBase('combobox', '', 'YOption', this, 'YOption');
    % 270 272
    yoption.RowSpan = [10.0 10.0];
    yoption.ColSpan = horzcat(lwidget1, rwidget1);
    % 273 275
    yoptionprompt = dspGetLeafWidgetBase('text', 'Y scale:', 'YOptionPrompt', 0.0);
    % 275 277
    yoptionprompt.RowSpan = [10.0 10.0];
    yoptionprompt.ColSpan = horzcat(lprompt, rprompt);
    % 278 281
    % 279 281
    xoption = dspGetLeafWidgetBase('combobox', '', 'XOption', this, 'XOption');
    % 281 283
    xoption.RowSpan = [10.0 10.0];
    xoption.ColSpan = horzcat(lwidget2, rwidget2);
    % 284 286
    xoptionprompt = dspGetLeafWidgetBase('text', 'X scale:', 'XOptionPrompt', 0.0);
    % 286 288
    xoptionprompt.RowSpan = [10.0 10.0];
    xoptionprompt.ColSpan = horzcat(lprompt2, rprompt2);
    % 289 292
    % 290 292
    plotButton = dspGetLeafWidgetBase('pushbutton', 'Plot', 'PlotButton', this, 'PlotButton');
    % 292 294
    plotButton.RowSpan = [12.0 12.0];
    plotButton.ColSpan = horzcat(minus(rwidget, 1.0), rwidget);
    % 295 297
    spacerVisualization = dspGetLeafWidgetBase('text', '', '', 0.0);
    spacerVisualization.RowSpan = [11.0 11.0];
    spacerVisualization.ColSpan = horzcat(lprompt, rprompt);
    % 299 303
    % 300 303
    % 301 303
    switch this.DataSource
    case 'RFDATA object'
        % 304 306
        rfdataObj.Enabled = 1.0;
        file.Enabled = 0.0;
        browse.Enabled = 0.0;
        % 308 310
        tempbar = waitbar(.1, 'Loading file ...');
        try
            mydata = evalin('base', this.RFDATA);
        catch
            try
                mydata = evalin('caller', this.RFDATA);
            catch
                msg = sprintf('Invalid expression: %s.', this.RFDATA);
                errordlg(msg, horzcat(this.Block.Name, ' Error Dialog'));
                mydata = read(rfdata.data, 'passive.s2p');
            end % try
        end % try
        for ii=2.0:10.0
            waitbar(mrdivide(ii, 10.0))
        end % for
        close(tempbar)
        % 326 328
    case 'Data file'
        % 327 329
        rfdataObj.Enabled = 0.0;
        file.Enabled = 1.0;
        browse.Enabled = 1.0;
        if not(isempty(strtrim(this.File)))
            tempname = strtrim(this.File);
            temppath = fileparts(tempname);
            if isempty(temppath)
                myfile = which(tempname);
                tempinfo = dir(myfile);
            else
                myfile = tempname;
                tempinfo = dir(tempname);
            end % if
        else
            myfile = 'passive.s2p';
            tempinfo = '';
            this.File = 'passive.s2p';
        end % if
        if isempty(tempinfo)
            tempinfo = dir(which('passive.s2p'));
        end % if
        Udata = this.Block.UserData;
        if all(isfield(Udata, {'Filename','Date','RFDATAObj'})) && not(isempty(Udata.Filename)) && not(isempty(Udata.Date)) && strcmp(Udata.Filename, myfile) && strcmp(Udata.Date, tempinfo(1.0).date) && isa(Udata.RFDATAObj, 'rfdata.data') && hasreference(Udata.RFDATAObj)
            % 351 357
            % 352 357
            % 353 357
            % 354 357
            % 355 357
            mydata = Udata.RFDATAObj;
        else
            tempbar = waitbar(.1, 'Loading file ...');
            try
                mydata = read(rfdata.data, this.File);
            catch
                tempname = fliplr(strtok(fliplr(this.File), filesep));
                try
                    mydata = read(rfdata.data, tempname);
                catch
                    errordlg(lasterr, horzcat(this.Block.Name, ' Error Dialog'));
                    mydata = read(rfdata.data, 'passive.s2p');
                end % try
            end % try
            for ii=2.0:10.0
                waitbar(mrdivide(ii, 10.0))
            end % for
            close(tempbar)
            if not(strcmpi(get_param(bdroot, 'BlockDiagramType'), 'library'))
                if isfield(Udata, 'RFDATAObj') && isa(this.Block.UserData.RFDATAObj, 'rfdata.data')
                    % 376 378
                    this.Block.UserData.Date = 'Changed';
                end % if
                this.Block.UserData.RFDATAObj = mydata;
            end % if
        end % if
    end % switch
    % 383 385
    Udata = this.Block.UserData;
    % 385 387
    if isa(mydata, 'rfdata.data')
        if hasreference(mydata)
            temp_filename = mydata.Reference.Filename;
            temp_date = mydata.Reference.Date;
        else
            temp_filename = '';
            temp_date = '';
        end % if
    else
        if isa(mydata, 'rfdata.reference')
            temp_filename = mydata.Filename;
            temp_date = mydata.Date;
        else
            if isa(mydata, 'rfdata.network')
                refobj = rfdata.reference('NetworkData', mydata);
                temp_filename = refobj.Filename;
                temp_date = refobj.Date;
            else
                % 404 406
                msg = sprintf('Object: %s is not supported.', this.RFDATA);
                errordlg(msg, horzcat(this.Block.Name, ' Error Dialog'));
                error(msg);
            end % if
            % 409 411
        end % if
    end % if
    filename_changed = true;
    if all(isfield(Udata, {'Filename','Date'})) && strcmp(Udata.Filename, temp_filename) && strcmp(Udata.Date, temp_date)
        filename_changed = false;
    end % if
    if filename_changed
        if not(strcmpi(get_param(bdroot, 'BlockDiagramType'), 'library'))
            this.Block.UserData.Filename = temp_filename;
            this.Block.UserData.Date = temp_date;
        end % if
    end % if
    % 422 425
    % 423 425
    Udata = this.Block.UserData;
    if isfield(Udata, 'Ckt') && isa(Udata.Ckt, 'rfckt.rfckt') && isa(Udata.Ckt.AnalyzedResult, 'rfdata.data')
        % 426 428
        plotdata = Udata.Ckt.AnalyzedResult;
    else
        plotdata = mydata;
    end % if
    % 431 433
    switch this.AllPlotType
    case 'X-Y plane'
        networkData.Enabled = 1.0;
        networkData.Entries = listparam(plotdata);
        % 436 438
        complexFormat.Enabled = 1.0;
        networkData2.Enabled = 1.0;
        complexFormat2.Enabled = 1.0;
        xoption.Enabled = 1.0;
        yoption.Enabled = 1.0;
        xParameter.Enabled = 1.0;
        xFormat.Enabled = 1.0;
    case 'Composite data'
        % 445 447
        networkData.Enabled = 0.0;
        networkData.Entries = listparam(plotdata);
        complexFormat.Enabled = 0.0;
        networkData2.Enabled = 0.0;
        complexFormat2.Enabled = 0.0;
        xoption.Enabled = 0.0;
        yoption.Enabled = 0.0;
        xParameter.Enabled = 0.0;
        xFormat.Enabled = 0.0;
    case 'Polar plane'
        % 456 458
        networkData.Enabled = 1.0;
        allparam = listparam(plotdata);
        if any(strcmpi(allparam, 'LS11'))
            networkData.Entries = {'S11';'S12';'S21';'S22';'LS11';'LS12';'LS21';'LS22'};
        else
            % 462 464
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
        % 473 475
        networkData.Enabled = 1.0;
        allparam = listparam(plotdata);
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
        % 488 490
    end % switch
    networkData2.Entries = cellhorzcat('   ', networkData.Entries{:});
    % 491 493
    if create_new_dialog && not(isempty(this.Block.AppliedNetworkData)) && not(isempty(this.Block.AppliedXParameter)) && any(strcmpi(this.Block.AppliedNetworkData, networkData.Entries)) && any(strcmpi(this.Block.AppliedNetworkData2, networkData2.Entries))
        % 493 498
        % 494 498
        % 495 498
        % 496 498
        complexFormat.Entries = simplifyformats(listformat(plotdata, this.Block.AppliedNetworkData));
        if not(isempty(strtrim(this.Block.AppliedNetworkData2)))
            complexFormat2.Entries = simplifyformats(listformat(plotdata, this.Block.AppliedNetworkData2));
        else
            complexFormat2.Entries = {'   '};
        end % if
        xParameter.Entries = listxparam(plotdata, this.Block.AppliedNetworkData);
        xFormat.Entries = listxformat(plotdata, this.Block.AppliedXParameter);
        % 505 507
        networkData.Value = this.Block.AppliedNetworkData;
        networkData2.Value = this.Block.AppliedNetworkData2;
        complexFormat.Value = this.Block.AppliedComplexFormat;
        complexFormat2.Value = this.Block.AppliedComplexFormat2;
        xParameter.Value = this.Block.AppliedXParameter;
        xFormat.Value = this.Block.AppliedXFormat;
        % 512 514
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
            % 523 526
            % 524 526
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
            % 537 539
            complexFormat.Entries = simplifyformats(listformat(plotdata, this.Block.UserData.NetworkData1));
            if not(isempty(strtrim(this.Block.UserData.NetworkData2)))
                complexFormat2.Entries = simplifyformats(listformat(plotdata, this.Block.UserData.NetworkData2));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(plotdata, this.Block.UserData.NetworkData1);
            % 545 547
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
            % 564 566
            xFormat.Entries = listxformat(plotdata, this.Block.UserData.XParameter);
            if any(strcmp(this.Block.UserData.XFormat, xFormat.Entries))
                xFormat.Value = this.Block.UserData.XFormat;
            else
                xFormat.Value = xFormat.Entries{1.0};
                this.Block.UserData.XFormat = xFormat.Entries{1.0};
            end % if
        else
            % 573 575
            complexFormat.Entries = simplifyformats(listformat(plotdata, networkData.Entries{1.0}));
            if not(isempty(strtrim(networkData2.Entries{1.0})))
                complexFormat2.Entries = simplifyformats(listformat(plotdata, networkData2.Entries{1.0}));
            else
                complexFormat2.Entries = {'   '};
            end % if
            xParameter.Entries = listxparam(plotdata, networkData.Entries{1.0});
            xFormat.Entries = listxformat(plotdata, xParameter.Entries{1.0});
            % 582 584
            networkData.Value = 0.0;
            networkData2.Value = 0.0;
            complexFormat.Value = 0.0;
            complexFormat2.Value = 0.0;
            xParameter.Value = 0.0;
            xFormat.Value = 0.0;
            % 589 591
            this.Block.UserData.NetworkData1 = networkData.Entries{1.0};
            this.Block.UserData.NetworkData2 = networkData2.Entries{1.0};
            this.Block.UserData.ComplexFormat1 = complexFormat.Entries{1.0};
            this.Block.UserData.ComplexFormat2 = complexFormat2.Entries{1.0};
            this.Block.UserData.XParameter = xParameter.Entries{1.0};
            this.Block.UserData.XFormat = xFormat.Entries{1.0};
            % 596 598
        end % if
        % 598 600
    end % if
    networkData.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData.Entries);
    complexFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat.Entries);
    networkData2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', networkData2.Entries);
    complexFormat2.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', complexFormat2.Entries);
    xParameter.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xParameter.Entries);
    xFormat.MatlabArgs = cellhorzcat('%source', '%dialog', '%tag', xFormat.Entries);
    plotButton.MatlabMethod = 'plotParam';
    plotButton.MatlabArgs = cellhorzcat(horzcat(this.Block.Path, '/', this.Block.Name), '%dialog', networkData.Entries, complexFormat.Entries, networkData2.Entries, complexFormat2.Entries, xParameter.Entries, xFormat.Entries);
    % 608 614
    % 609 614
    % 610 614
    % 611 614
    % 612 614
    mainPane = dspGetContainerWidgetBase('panel', '', 'MainPane');
    mainPane.Items = cellhorzcat(datasource, datasourceprompt, rfdataObj, rfdataObjprompt, file, fileprompt, browse, interpMethod, interpMethodprompt, spacerMain);
    % 615 617
    mainPane.LayoutGrid = horzcat(5.0, numgrid);
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    mainPane.RowStretch = horzcat(zeros(1.0, 4.0), 1.0);
    % 620 623
    % 621 623
    visualizationPane = dspGetContainerWidgetBase('panel', '', 'VisualizationPane');
    visualizationPane.Items = cellhorzcat(sourceFreq, sourceFreqprompt, freq, freqprompt, allPlotType, allPlotTypeprompt, networkData, networkDataprompt, complexFormat, complexFormatprompt, networkData2, networkData2prompt, complexFormat2, complexFormat2prompt, yoption, yoptionprompt, xoption, xoptionprompt, plotButton, xParameter, xParameterprompt, xFormat, xFormatprompt, sourcePin, sourcePinprompt, pin, pinprompt, plotZ0, plotZ0prompt, spacerVisualization);
    % 624 631
    % 625 631
    % 626 631
    % 627 631
    % 628 631
    % 629 631
    visualizationPane.LayoutGrid = horzcat(12.0, numgrid);
    visualizationPane.RowSpan = [1.0 1.0];
    visualizationPane.ColSpan = [1.0 1.0];
    visualizationPane.RowStretch = horzcat(zeros(1.0, 10.0), 1.0, 0.0);
    % 634 638
    % 635 638
    % 636 638
    mainTab.Name = 'Main';
    mainTab.Items = cellhorzcat(mainPane);
    mainTab.LayoutGrid = [1.0 1.0];
    mainTab.RowStretch = 0.0;
    mainTab.ColStretch = 0.0;
    % 642 645
    % 643 645
    visualizationTab.Name = 'Visualization';
    visualizationTab.Items = cellhorzcat(visualizationPane);
    visualizationTab.LayoutGrid = [1.0 1.0];
    visualizationTab.RowStretch = 0.0;
    visualizationTab.ColStretch = 0.0;
    % 649 652
    % 650 652
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'TabPane');
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    tabbedPane.Tabs = cellhorzcat(mainTab, visualizationTab);
    % 655 658
    % 656 658
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
