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
    blkh = this.Block.Handle;
    mask_enables = get_param(blkh, 'MaskEnables');
    old_mask_enables = mask_enables;
    % 15 17
    FVToolButtonEnabled = false;
    % 17 20
    % 18 20
    FilterSource = dspGetLeafWidgetBase('radiobutton', 'Coefficient source', 'FilterSource', this, 'FilterSource');
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    FilterSource.Entries = {'Dialog parameters','Multirate filter object (MFILT)'};
    % 25 27
    FilterSource.DialogRefresh = 1.0;
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    paramsPanel = dspGetContainerWidgetBase('panel', 'Parameters', 'paramsPanel');
    % 32 36
    % 33 36
    % 34 36
    framing = dspGetLeafWidgetBase('combobox', 'Framing:', 'framing', this, 'framing');
    % 36 38
    framing.Entries = ctranspose(set(this, 'framing'));
    % 38 40
    if eq(this.FilterSource, 0.0)
        % 40 42
        mask_enables{end} = 'off';
        mask_enables(1.0:minus(end, 1.0)) = {'on'};
        % 43 45
        if isfield(this.Block.UserData, 'filterConstructor')
            FVToolButtonEnabled = true;
        end % if
        % 47 49
        h = dspGetLeafWidgetBase('edit', 'FIR filter coefficients:', 'h', this, 'h');
        % 49 52
        % 50 52
        factor = dspGetLeafWidgetBase('edit', 'Decimation factor:', 'D', this, 'factor');
        % 52 57
        % 53 57
        % 54 57
        % 55 57
        filtStruct = dspGetLeafWidgetBase('combobox', 'Filter structure:', 'filtStruct', this, 'filtStruct');
        % 57 59
        filtStruct.Entries = ctranspose(set(this, 'filtStruct'));
        % 59 62
        % 60 62
        prompt = 'Output buffer initial conditions:';
        outputBufInitCond = dspGetLeafWidgetBase('edit', prompt, 'outputBufInitCond', this, 'outputBufInitCond');
        % 63 67
        % 64 67
        % 65 67
        paramsPanel.Items = cellhorzcat(h, factor, filtStruct, framing, outputBufInitCond);
        % 67 73
        % 68 73
        % 69 73
        % 70 73
        % 71 73
        dataTypeTab.Items = cellhorzcat(this.FixptDialog.getDialogSchemaStruct);
    else
        % 74 78
        % 75 78
        % 76 78
        mask_enables(1.0:minus(end, 1.0)) = {'off'};
        mask_enables{4.0} = 'on';
        mask_enables{end} = 'on';
        % 80 82
        FilterObject = dspGetLeafWidgetBase('edit', 'Multirate filter variable:', 'FilterObject', this, 'FilterObject');
        % 82 86
        % 83 86
        % 84 86
        FilterObject.DialogRefresh = 1.0;
        % 86 88
        paramsPanel.Items = cellhorzcat(FilterObject, framing);
        % 88 91
        % 89 91
        filterIsFixpt = false;
        hd = [];
        if isfdtbxinstalled && isfield(this.Block.UserData, 'filter')
            hd = this.Block.UserData.filter;
            if not(isempty(hd))
                FVToolButtonEnabled = true;
                filterIsFixpt = strcmpi(hd.arithmetic, 'fixed');
            end % if
        end % if
        % 99 101
        MWDSP_TOP_LEFT = 1.0;
        MWDSP_TOP_CENTER = 2.0;
        MWDSP_TOP_RIGHT = 3.0;
        MWDSP_CENTER_LEFT = 4.0;
        MWDSP_CENTER = 5.0;
        MWDSP_CENTER_RIGHT = 6.0;
        MWDSP_BOTTOM_LEFT = 7.0;
        MWDSP_BOTTOM_CENTER = 8.0;
        MWDSP_BOTTOM_RIGHT = 9.0;
        % 109 111
        roundingModeLabel = dspGetLeafWidgetBase('text', 'Rounding mode:', 'roundingModeLabel', 0.0);
        % 111 113
        roundingModeLabel.RowSpan = [1.0 1.0];
        roundingModeLabel.ColSpan = [1.0 1.0];
        roundingModeLabel.Alignment = MWDSP_CENTER;
        % 115 117
        if filterIsFixpt
            roundingModeStr = dspGetSPRoundMode(hd.RoundMode);
            overflowModeStr = hd.OverflowMode;
            overflowModeStr = horzcat(upper(overflowModeStr(1.0)), overflowModeStr(2.0:end));
        else
            roundingModeStr = 'Floor';
            overflowModeStr = 'Wrap';
        end % if
        roundingModeText = dspGetLeafWidgetBase('text', roundingModeStr, 'roundingModeText', 0.0);
        % 125 127
        roundingModeText.RowSpan = [1.0 1.0];
        roundingModeText.ColSpan = [2.0 2.0];
        roundingModeText.Alignment = MWDSP_CENTER;
        % 129 131
        overflowModeLabel = dspGetLeafWidgetBase('text', 'Overflow mode:', 'overflowModeLabel', 0.0);
        % 131 133
        overflowModeLabel.RowSpan = [1.0 1.0];
        overflowModeLabel.ColSpan = [4.0 4.0];
        overflowModeLabel.Alignment = MWDSP_CENTER;
        % 135 137
        overflowModeText = dspGetLeafWidgetBase('text', overflowModeStr, 'overflowModeText', 0.0);
        % 137 139
        overflowModeText.RowSpan = [1.0 1.0];
        overflowModeText.ColSpan = [5.0 5.0];
        overflowModeText.Alignment = MWDSP_CENTER;
        % 141 143
        fpaOperationalPane = dspGetContainerWidgetBase('group', 'Fixed-point operational parameters', 'fpaOperationalPane');
        % 143 146
        % 144 146
        fpaOperationalPane.Items = cellhorzcat(roundingModeLabel, roundingModeText, overflowModeLabel, overflowModeText);
        % 146 148
        fpaOperationalPane.LayoutGrid = [1.0 5.0];
        fpaOperationalPane.RowSpan = [2.0 2.0];
        fpaOperationalPane.ColSpan = [1.0 1.0];
        % 150 153
        % 151 153
        modeTitle = dspGetLeafWidgetBase('text', 'Mode', 'modeTitle', 0.0);
        modeTitle.RowSpan = [1.0 1.0];
        modeTitle.ColSpan = [2.0 2.0];
        modeTitle.Alignment = MWDSP_CENTER;
        % 156 158
        fpaDataTypePane = dspGetContainerWidgetBase('group', 'Fixed-point data types', 'fpaDataTypePane');
        % 158 161
        % 159 161
        dtRows = {};
        rowNum = 2.0;
        % 162 164
        if filterIsFixpt
            signedTitle = dspGetLeafWidgetBase('text', 'Signed', 'signedTitle', 0.0);
            signedTitle.RowSpan = [1.0 1.0];
            signedTitle.ColSpan = [3.0 3.0];
            signedTitle.Alignment = MWDSP_CENTER;
            % 168 170
            wlTitle = dspGetLeafWidgetBase('text', ' Word length', 'wlTitle', 0.0);
            wlTitle.RowSpan = [1.0 1.0];
            wlTitle.ColSpan = [4.0 4.0];
            wlTitle.Alignment = MWDSP_CENTER;
            % 173 175
            flTitle = dspGetLeafWidgetBase('text', 'Fraction length', 'flTitle', 0.0);
            flTitle.RowSpan = [1.0 1.0];
            flTitle.ColSpan = [5.0 6.0];
            flTitle.Alignment = MWDSP_CENTER;
            % 178 180
            fpaDataTypePane.Items = cellhorzcat(modeTitle, signedTitle, wlTitle, flTitle);
            % 180 182
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Input', 'input', num2str(hd.InputWordLength), num2str(hd.InputFracLength));
            % 182 186
            % 183 186
            % 184 186
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Coefficients', 'coeff', num2str(hd.CoeffWordLength), num2str(hd.NumFracLength));
            % 186 191
            % 187 191
            % 188 191
            % 189 191
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Product output', 'prod', num2str(hd.ProductWordLength), num2str(hd.ProductFracLength));
            % 191 196
            % 192 196
            % 193 196
            % 194 196
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Accumulator', 'accum', num2str(hd.AccumWordLength), num2str(hd.AccumFracLength));
            % 196 201
            % 197 201
            % 198 201
            % 199 201
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Output', 'output', num2str(hd.OutputWordLength), num2str(hd.OutputFracLength));
        else
            % 202 204
            % 203 205
            fpaDataTypePane.Items = cellhorzcat(modeTitle);
            % 205 208
            % 206 208
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Coefficients', 'coeff', 'Same word length as input');
            % 208 211
            % 209 211
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Product output', 'prod', 'Same as input');
            % 211 214
            % 212 214
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Accumulator', 'accum', 'Same as product output');
            % 214 218
            % 215 218
            % 216 218
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Output', 'output', 'Same as accumulator');
            % 218 220
        end % if
        for ind=1.0:length(dtRows)
            fpaDataTypePane.Items = cat(2.0, fpaDataTypePane.Items, dtRows{ind});
        end % for
        fpaDataTypePane.LayoutGrid = horzcat(plus(1.0, length(dtRows)), 6.0);
        colStretch = zeros(1.0, 6.0);
        colStretch(5.0:6.0) = 1.0;
        fpaDataTypePane.ColStretch = colStretch;
        fpaDataTypePane.RowSpan = [3.0 3.0];
        fpaDataTypePane.ColSpan = [1.0 1.0];
        % 229 231
        discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals.');
        discText = dspGetLeafWidgetBase('text', discStr, 'discText', 0.0);
        % 232 236
        % 233 236
        % 234 236
        discText.WordWrap = 1.0;
        % 236 238
        discPane = dspGetContainerWidgetBase('panel', '', 'discPane');
        % 238 241
        % 239 241
        discPane.Items = cellhorzcat(discText);
        discPane.RowSpan = [1.0 1.0];
        discPane.ColSpan = [1.0 1.0];
        % 243 245
        emptyPanel = dspGetContainerWidgetBase('panel', '', 'emptyPanel');
        % 245 249
        % 246 249
        % 247 249
        emptyPanel.RowSpan = [2.0 2.0];
        emptyPanel.ColSpan = [1.0 1.0];
        % 250 252
        fpaOperationalPane = dspGetContainerWidgetBase('group', 'Fixed-point operational parameters', 'fpaOperationalPane');
        % 252 255
        % 253 255
        fpaOperationalPane.Items = cellhorzcat(roundingModeLabel, roundingModeText, overflowModeLabel, overflowModeText);
        % 255 257
        fpaOperationalPane.LayoutGrid = [1.0 5.0];
        fpaOperationalPane.RowSpan = [2.0 2.0];
        fpaOperationalPane.ColSpan = [1.0 1.0];
        % 259 261
        dataTypeTab.Items = cellhorzcat(discPane, emptyPanel, fpaOperationalPane, fpaDataTypePane);
        % 261 267
        % 262 267
        % 263 267
        % 264 267
        % 265 267
    end % if
    % 267 269
    dataTypeTab.Name = 'Fixed-point';
    % 269 274
    % 270 274
    % 271 274
    % 272 274
    mainPane = dspGetContainerWidgetBase('group', 'Parameters', 'mainPane');
    mainPane.RowSpan = [1.0 1.0];
    % 275 277
    if isfdtbxinstalled
        % 277 279
        fvToolButton = dspGetLeafWidgetBase('pushbutton', 'View Filter Response', 'fvToolButton', 0.0);
        % 279 282
        % 280 282
        fvToolButton.ToolTip = 'Launches FVTool to inspect the frequency response of the specified filter.';
        % 282 284
        fvToolButton.Alignment = 4.0;
        fvToolButton.ColSpan = [1.0 1.0];
        fvToolButton.MatlabMethod = 'dspLinkFVTool2Mask';
        fvToolButton.MatlabArgs = cellhorzcat(this.Block.Handle, 'create');
        % 287 289
        fvToolButton.Enabled = FVToolButtonEnabled;
        % 289 291
        openDialogs = this.getOpenDialogs;
        if not(isempty(openDialogs))
            if openDialogs{1.0}.hasUnappliedChanges
                fvToolButton.Enabled = 0.0;
            end % if
        end % if
        % 296 298
        buttonPanel = dspGetContainerWidgetBase('panel', 'Buttons', 'buttonPanel');
        buttonPanel.LayoutGrid = [1.0 3.0];
        buttonPanel.Items = cellhorzcat(fvToolButton);
        % 300 302
        mainPane.Items = cellhorzcat(paramsPanel, buttonPanel);
    else
        mainPane.Items = cellhorzcat(paramsPanel);
    end % if
    % 305 307
    generalTab.Name = 'Main';
    generalTab.Items = cellhorzcat(mainPane);
    % 308 310
    numGeneralTabItems = length(generalTab.Items);
    generalTab.LayoutGrid = horzcat(plus(1.0, numGeneralTabItems), 1.0);
    generalTab.RowStretch = horzcat(zeros(1.0, numGeneralTabItems), 1.0);
    % 312 314
    numDataTypeTabItems = length(dataTypeTab.Items);
    dataTypeTab.LayoutGrid = horzcat(plus(1.0, numDataTypeTabItems), 1.0);
    dataTypeTab.RowStretch = horzcat(zeros(1.0, numDataTypeTabItems), 1.0);
    % 316 319
    % 317 319
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.RowSpan = [3.0 3.0];
    tabbedPane.ColSpan = [1.0 1.0];
    % 321 323
    tabbedPane.Tabs = cellhorzcat(generalTab, dataTypeTab);
    % 323 326
    % 324 326
    filterSourcePane = dspGetContainerWidgetBase('panel', '', 'filterSourcePane');
    filterSourcePane.Items = cellhorzcat(FilterSource);
    filterSourcePane.RowSpan = [2.0 2.0];
    filterSourcePane.ColSpan = [1.0 1.0];
    % 329 331
    dlgStruct = getBaseSchemaStruct(this, tabbedPane, this.Block.MaskDescription, filterSourcePane);
    % 331 336
    % 332 336
    % 333 336
    % 334 336
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 337 341
    % 338 341
    % 339 341
    mask_enables{6.0} = 'off';
    mask_enables{7.0} = 'off';
    % 342 344
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end % if
end % function
function [dtRows, row] = getDataTypeRowItem(dtRows, row, name, prefix, WLText, FLText)
    % 348 353
    % 349 353
    % 350 353
    % 351 353
    dtIdx = plus(length(dtRows), 1.0);
    [NAME, MODE, SIGN, WL, FL] = deal(1.0, 2.0, 3.0, 4.0, 5.0);
    MWDSP_TOP_LEFT = 1.0;
    MWDSP_TOP_CENTER = 2.0;
    MWDSP_TOP_RIGHT = 3.0;
    MWDSP_CENTER_LEFT = 4.0;
    MWDSP_CENTER = 5.0;
    MWDSP_CENTER_RIGHT = 6.0;
    MWDSP_BOTTOM_LEFT = 7.0;
    MWDSP_BOTTOM_CENTER = 8.0;
    MWDSP_BOTTOM_RIGHT = 9.0;
    % 363 366
    % 364 366
    widgets{NAME} = dspGetLeafWidgetBase('text', name, name, 0.0);
    widgets{NAME}.ColSpan = [1.0 1.0];
    widgets{NAME}.Alignment = MWDSP_CENTER;
    % 368 371
    % 369 371
    widgets{MODE} = dspGetLeafWidgetBase('text', 'Binary point scaling', horzcat(prefix, 'Mode'), 0.0);
    % 371 373
    widgets{MODE}.ColSpan = [2.0 2.0];
    widgets{MODE}.Alignment = MWDSP_CENTER;
    % 374 377
    % 375 377
    widgets{SIGN} = dspGetLeafWidgetBase('text', 'yes', horzcat(prefix, 'Signed'), 0.0);
    % 377 380
    % 378 380
    widgets{SIGN}.ColSpan = [3.0 3.0];
    widgets{SIGN}.Alignment = MWDSP_CENTER;
    % 381 384
    % 382 384
    widgets{WL} = dspGetLeafWidgetBase('text', WLText, horzcat(prefix, 'WordLength'), 0.0);
    % 384 387
    % 385 387
    widgets{WL}.ColSpan = [4.0 4.0];
    widgets{WL}.Alignment = MWDSP_CENTER;
    % 388 391
    % 389 391
    widgets{FL} = dspGetLeafWidgetBase('text', FLText, horzcat(prefix, 'FracLength'), 0.0);
    % 391 394
    % 392 394
    widgets{FL}.ColSpan = [5.0 6.0];
    widgets{FL}.Alignment = MWDSP_CENTER;
    % 395 397
    for i=1.0:length(widgets)
        widgets{i}.RowSpan = horzcat(row, row);
    end % for
    % 399 401
    dtRows{dtIdx} = widgets;
    row = plus(row, 1.0);
end % function
function [dtRows, row] = getDefaultDataTypeRowItem(dtRows, row, name, prefix, mode)
    % 404 406
    dtIdx = plus(length(dtRows), 1.0);
    [NAME, MODE] = deal(1.0, 2.0);
    MWDSP_CENTER = 5.0;
    % 408 411
    % 409 411
    widgets{NAME} = dspGetLeafWidgetBase('text', name, name, 0.0);
    widgets{NAME}.ColSpan = [1.0 1.0];
    widgets{NAME}.Alignment = MWDSP_CENTER;
    % 413 416
    % 414 416
    widgets{MODE} = dspGetLeafWidgetBase('text', mode, horzcat(prefix, 'Mode_'), 0.0);
    % 416 418
    widgets{MODE}.ColSpan = [2.0 2.0];
    widgets{MODE}.Alignment = MWDSP_CENTER;
    % 419 421
    for i=1.0:length(widgets)
        widgets{i}.RowSpan = horzcat(row, row);
    end % for
    % 423 425
    dtRows{dtIdx} = widgets;
    row = plus(row, 1.0);
end % function
