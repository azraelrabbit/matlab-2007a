function dlgStruct = getDialogSchema(this, dummy_arg)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    winmode = dspGetLeafWidgetBase('combobox', 'Operation:', 'winmode', this, 'winmode');
    % 14 16
    winmode.Entries = ctranspose(set(this, 'winmode'));
    winmode.DialogRefresh = 1.0;
    % 17 20
    % 18 20
    wintype = dspGetLeafWidgetBase('combobox', 'Window type:', 'wintype', this, 'wintype');
    % 20 22
    wintype.Entries = ctranspose(set(this, 'wintype'));
    wintype.DialogRefresh = 1.0;
    wintype.Tunable = 1.0;
    % 24 27
    % 25 27
    sampmode = dspGetLeafWidgetBase('combobox', 'Sample mode: ', 'sampmode', this, 'sampmode');
    % 27 29
    sampmode.Entries = ctranspose(set(this, 'sampmode'));
    sampmode.DialogRefresh = 1.0;
    % 30 33
    % 31 33
    samptime = dspGetLeafWidgetBase('edit', 'Sample time:', 'samptime', this, 'samptime');
    % 33 37
    % 34 37
    % 35 37
    N = dspGetLeafWidgetBase('edit', 'Window length:', 'N', this, 'N');
    % 37 40
    % 38 40
    Rs = dspGetLeafWidgetBase('edit', 'Stopband attenuation in dB:', 'Rs', this, 'Rs');
    % 40 42
    Rs.Tunable = 1.0;
    % 42 45
    % 43 45
    beta = dspGetLeafWidgetBase('edit', 'Beta:', 'beta', this, 'beta');
    beta.Tunable = 1.0;
    % 46 49
    % 47 49
    numSidelobes = dspGetLeafWidgetBase('edit', 'Number of sidelobes:', 'numSidelobes', this, 'numSidelobes');
    % 49 51
    numSidelobes.Tunable = 1.0;
    % 51 54
    % 52 54
    sidelobeLevel = dspGetLeafWidgetBase('edit', 'Maximum sidelobe level relative to mainlobe (dB):', 'sidelobeLevel', this, 'sidelobeLevel');
    % 54 56
    sidelobeLevel.Tunable = 1.0;
    % 56 59
    % 57 59
    winsamp = dspGetLeafWidgetBase('combobox', 'Sampling:', 'winsamp', this, 'winsamp');
    % 59 61
    winsamp.Entries = ctranspose(set(this, 'winsamp'));
    winsamp.Tunable = 1.0;
    % 62 65
    % 63 65
    UserWindow = dspGetLeafWidgetBase('edit', 'Window function name:', 'UserWindow', this, 'UserWindow');
    % 65 67
    UserWindow.DialogRefresh = 1.0;
    % 67 70
    % 68 70
    txt = 'The window length is automatically passed in as the first argument to the ';
    txt = horzcat(txt, this.UserWindow, ' function.');
    FirstArgText = dspGetLeafWidgetBase('text', txt, 'FirstArgText', this);
    % 72 75
    % 73 75
    FirstArgTextSpacer = dspGetLeafWidgetBase('text', '   ', 'FirstArgTextSpacer', this);
    % 75 77
    maxSize = [5.0 5.0];
    FirstArgTextSpacer.MaximumSize = maxSize;
    FirstArgTextSpacer2 = dspGetLeafWidgetBase('text', '   ', 'FirstArgTextSpacer2', this);
    % 79 81
    FirstArgTextSpacer2.MaximumSize = maxSize;
    % 81 84
    % 82 84
    prompt = 'Specify additional arguments to the ';
    prompt = horzcat(prompt, this.UserWindow, ' function');
    OptParams = dspGetLeafWidgetBase('checkbox', prompt, 'OptParams', this, 'OptParams');
    % 86 88
    OptParams.DialogRefresh = 1.0;
    % 88 91
    % 89 91
    prompt = 'Cell array of additional arguments';
    UserParams = dspGetLeafWidgetBase('edit', prompt, 'UserParams', this, 'UserParams');
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    if strcmp(this.winmode, 'Generate window')
        sampmode.Visible = 1.0;
        N.Visible = 1.0;
        if strcmp(this.sampmode, 'Discrete')
            samptime.Visible = 1.0;
        else
            samptime.Visible = 0.0;
        end % if
    else
        sampmode.Visible = 0.0;
        N.Visible = 0.0;
        samptime.Visible = 0.0;
    end % if
    % 109 111
    if strcmp(this.wintype, 'Chebyshev')
        Rs.Visible = 1.0;
    else
        Rs.Visible = 0.0;
    end % if
    % 115 117
    if strcmp(this.wintype, 'Kaiser')
        beta.Visible = 1.0;
    else
        beta.Visible = 0.0;
    end % if
    % 121 123
    if strcmp(this.wintype, 'Taylor')
        numSidelobes.Visible = 1.0;
        sidelobeLevel.Visible = 1.0;
    else
        numSidelobes.Visible = 0.0;
        sidelobeLevel.Visible = 0.0;
    end % if
    % 129 131
    if any(strcmp(this.wintype, {'Blackman','Hamming','Hanning','Hann'}))
        winsamp.Visible = 1.0;
    else
        winsamp.Visible = 0.0;
    end % if
    % 135 137
    if strcmp(this.wintype, 'User defined')
        UserWindow.Visible = 1.0;
        FirstArgText.Visible = 1.0;
        FirstArgTextSpacer.Visible = 1.0;
        FirstArgTextSpacer2.Visible = 1.0;
        OptParams.Visible = 1.0;
        if this.OptParams
            UserParams.Visible = 1.0;
        else
            UserParams.Visible = 0.0;
        end % if
    else
        UserWindow.Visible = 0.0;
        FirstArgText.Visible = 0.0;
        FirstArgTextSpacer.Visible = 0.0;
        FirstArgTextSpacer2.Visible = 0.0;
        OptParams.Visible = 0.0;
        UserParams.Visible = 0.0;
    end % if
    % 155 161
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    items = cellhorzcat(winmode, wintype, sampmode, samptime, N, Rs, beta, numSidelobes, sidelobeLevel, winsamp, UserWindow, FirstArgTextSpacer, FirstArgText, FirstArgTextSpacer2, OptParams, UserParams);
    % 161 180
    % 162 180
    % 163 180
    % 164 180
    % 165 180
    % 166 180
    % 167 180
    % 168 180
    % 169 180
    % 170 180
    % 171 180
    % 172 180
    % 173 180
    % 174 180
    % 175 180
    % 176 180
    % 177 180
    % 178 180
    dlgStruct = this.getRootSchemaStruct(items);
    % 180 182
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(3.0).BestPrecString);
    % 183 196
    % 184 196
    % 185 196
    % 186 196
    % 187 196
    % 188 196
    % 189 196
    % 190 196
    % 191 196
    % 192 196
    % 193 196
    % 194 196
    dataType = dspGetLeafWidgetBase('combobox', 'Output data type:', 'dataType', this, 'dataType');
    % 196 198
    dataType.Entries = ctranspose(set(this, 'dataType'));
    dataType.DialogRefresh = 1.0;
    % 199 202
    % 200 202
    isSigned = dspGetLeafWidgetBase('checkbox', 'Signed', 'isSigned', this, 'isSigned');
    % 202 206
    % 203 206
    % 204 206
    wordLen = dspGetLeafWidgetBase('edit', 'Word length:', 'wordLen', this, 'wordLen');
    % 206 210
    % 207 210
    % 208 210
    prompt = 'User-defined data type  (e.g. sfix(16), float(''single'')):';
    udDataType = dspGetLeafWidgetBase('edit', prompt, 'udDataType', this, 'udDataType');
    % 211 213
    udDataType.DialogRefresh = 1.0;
    % 213 216
    % 214 216
    fracBitsMode = dspGetLeafWidgetBase('combobox', 'Set fraction length in output to:', 'fracBitsMode', this, 'fracBitsMode');
    % 216 219
    % 217 219
    fracBitsMode.Entries = ctranspose(set(this, 'fracBitsMode'));
    fracBitsMode.DialogRefresh = 1.0;
    % 220 223
    % 221 223
    numFracBits = dspGetLeafWidgetBase('edit', 'Fraction length:', 'numFracBits', this, 'numFracBits');
    % 223 227
    % 224 227
    % 225 227
    if any(strcmp(this.dataType, {'double','single','Inherit via back propagation'}))
        isSigned.Visible = 0.0;
        wordLen.Visible = 0.0;
        udDataType.Visible = 0.0;
        fracBitsMode.Visible = 0.0;
        numFracBits.Visible = 0.0;
    else
        if strcmp(this.dataType, 'Fixed-point')
            isSigned.Visible = 1.0;
            wordLen.Visible = 1.0;
            udDataType.Visible = 0.0;
            fracBitsMode.Visible = 1.0;
            if strcmp(this.fracBitsMode, 'Best precision')
                numFracBits.Visible = 0.0;
            else
                numFracBits.Visible = 1.0;
            end % if
        else
            isSigned.Visible = 0.0;
            wordLen.Visible = 0.0;
            udDataType.Visible = 1.0;
            if dspDataTypeDeterminesFracBits(this.udDataType)
                fracBitsMode.Visible = 0.0;
                numFracBits.Visible = 0.0;
            else
                fracBitsMode.Visible = 1.0;
                if strcmp(this.fracBitsMode, 'Best precision')
                    numFracBits.Visible = 0.0;
                else
                    numFracBits.Visible = 1.0;
                end % if
            end % if
        end % if
        % 259 261
    end % if
    sourceParamPanel = dspGetContainerWidgetBase('panel', '', 'sourceParamPanel');
    sourceParamPanel.Items = cellhorzcat(dataType, isSigned, wordLen, udDataType, fracBitsMode, ctranspose(numFracBits));
    % 263 268
    % 264 268
    % 265 268
    % 266 268
    sourceParamPanel.ColSpan = [1.0 1.0];
    sourceParamPanel.Source = this;
    % 269 273
    % 270 273
    % 271 273
    sourceParamPanel.RowSpan = dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.RowSpan;
    % 273 276
    % 274 276
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.RowSpan = plus(dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.RowSpan, [1.0 1.0]);
    % 276 279
    % 277 279
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{plus(end, 1.0)} = sourceParamPanel;
    % 279 281
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.LayoutGrid = plus(dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.LayoutGrid, [1.0 0.0]);
    % 281 284
    % 282 284
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.RowStretch = horzcat(0.0, dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.RowStretch);
    % 284 288
    % 285 288
    % 286 288
    len = minus(length(dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items), 1.0);
    if strcmp(this.winmode, 'Generate window')
        for ii=1.0:len
            dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{ii}.Visible = 0.0;
        end % for
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Visible = 1.0;
        % 293 295
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Name = 'Data types';
    else
        for ii=1.0:len
            dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{ii}.Visible = 1.0;
        end % for
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Visible = 0.0;
    end % if
