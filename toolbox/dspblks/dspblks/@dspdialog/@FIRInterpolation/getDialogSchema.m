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
        factor = dspGetLeafWidgetBase('edit', 'Interpolation factor:', 'L', this, 'factor');
        % 52 57
        % 53 57
        % 54 57
        % 55 57
        prompt = 'Output buffer initial conditions:';
        outputBufInitCond = dspGetLeafWidgetBase('edit', prompt, 'outputBufInitCond', this, 'outputBufInitCond');
        % 58 62
        % 59 62
        % 60 62
        paramsPanel.Items = cellhorzcat(h, factor, framing, outputBufInitCond);
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        dataTypeTab.Items = cellhorzcat(this.FixptDialog.getDialogSchemaStruct);
    else
        % 68 72
        % 69 72
        % 70 72
        mask_enables(1.0:minus(end, 1.0)) = {'off'};
        mask_enables{3.0} = 'on';
        mask_enables{end} = 'on';
        % 74 76
        FilterObject = dspGetLeafWidgetBase('edit', 'Multirate filter variable:', 'FilterObject', this, 'FilterObject');
        % 76 80
        % 77 80
        % 78 80
        FilterObject.DialogRefresh = 1.0;
        % 80 82
        paramsPanel.Items = cellhorzcat(FilterObject, framing);
        % 82 85
        % 83 85
        filterIsFixpt = false;
        hd = [];
        if isfdtbxinstalled && isfield(this.Block.UserData, 'filter')
            hd = this.Block.UserData.filter;
            if not(isempty(hd))
                FVToolButtonEnabled = true;
                filterIsFixpt = strcmpi(hd.arithmetic, 'fixed');
            end % if
        end % if
        % 93 95
        MWDSP_TOP_LEFT = 1.0;
        MWDSP_TOP_CENTER = 2.0;
        MWDSP_TOP_RIGHT = 3.0;
        MWDSP_CENTER_LEFT = 4.0;
        MWDSP_CENTER = 5.0;
        MWDSP_CENTER_RIGHT = 6.0;
        MWDSP_BOTTOM_LEFT = 7.0;
        MWDSP_BOTTOM_CENTER = 8.0;
        MWDSP_BOTTOM_RIGHT = 9.0;
        % 103 105
        roundingModeLabel = dspGetLeafWidgetBase('text', 'Rounding mode:', 'roundingModeLabel', 0.0);
        % 105 107
        roundingModeLabel.RowSpan = [1.0 1.0];
        roundingModeLabel.ColSpan = [1.0 1.0];
        roundingModeLabel.Alignment = MWDSP_CENTER;
        % 109 111
        if filterIsFixpt
            roundingModeStr = dspGetSPRoundMode(hd.RoundMode);
            overflowModeStr = hd.OverflowMode;
            overflowModeStr = horzcat(upper(overflowModeStr(1.0)), overflowModeStr(2.0:end));
        else
            roundingModeStr = 'Floor';
            overflowModeStr = 'Wrap';
        end % if
        roundingModeText = dspGetLeafWidgetBase('text', roundingModeStr, 'roundingModeText', 0.0);
        % 119 121
        roundingModeText.RowSpan = [1.0 1.0];
        roundingModeText.ColSpan = [2.0 2.0];
        roundingModeText.Alignment = MWDSP_CENTER;
        % 123 125
        overflowModeLabel = dspGetLeafWidgetBase('text', 'Overflow mode:', 'overflowModeLabel', 0.0);
        % 125 127
        overflowModeLabel.RowSpan = [1.0 1.0];
        overflowModeLabel.ColSpan = [4.0 4.0];
        overflowModeLabel.Alignment = MWDSP_CENTER;
        % 129 131
        overflowModeText = dspGetLeafWidgetBase('text', overflowModeStr, 'overflowModeText', 0.0);
        % 131 133
        overflowModeText.RowSpan = [1.0 1.0];
        overflowModeText.ColSpan = [5.0 5.0];
        overflowModeText.Alignment = MWDSP_CENTER;
        % 135 137
        fpaOperationalPane = dspGetContainerWidgetBase('group', 'Fixed-point operational parameters', 'fpaOperationalPane');
        % 137 140
        % 138 140
        fpaOperationalPane.Items = cellhorzcat(roundingModeLabel, roundingModeText, overflowModeLabel, overflowModeText);
        % 140 142
        fpaOperationalPane.LayoutGrid = [1.0 5.0];
        fpaOperationalPane.RowSpan = [2.0 2.0];
        fpaOperationalPane.ColSpan = [1.0 1.0];
        % 144 147
        % 145 147
        modeTitle = dspGetLeafWidgetBase('text', 'Mode', 'modeTitle', 0.0);
        modeTitle.RowSpan = [1.0 1.0];
        modeTitle.ColSpan = [2.0 2.0];
        modeTitle.Alignment = MWDSP_CENTER;
        % 150 152
        fpaDataTypePane = dspGetContainerWidgetBase('group', 'Fixed-point data types', 'fpaDataTypePane');
        % 152 155
        % 153 155
        dtRows = {};
        rowNum = 2.0;
        % 156 158
        if filterIsFixpt
            signedTitle = dspGetLeafWidgetBase('text', 'Signed', 'signedTitle', 0.0);
            signedTitle.RowSpan = [1.0 1.0];
            signedTitle.ColSpan = [3.0 3.0];
            signedTitle.Alignment = MWDSP_CENTER;
            % 162 164
            wlTitle = dspGetLeafWidgetBase('text', ' Word length', 'wlTitle', 0.0);
            wlTitle.RowSpan = [1.0 1.0];
            wlTitle.ColSpan = [4.0 4.0];
            wlTitle.Alignment = MWDSP_CENTER;
            % 167 169
            flTitle = dspGetLeafWidgetBase('text', 'Fraction length', 'flTitle', 0.0);
            flTitle.RowSpan = [1.0 1.0];
            flTitle.ColSpan = [5.0 6.0];
            flTitle.Alignment = MWDSP_CENTER;
            % 172 174
            fpaDataTypePane.Items = cellhorzcat(modeTitle, signedTitle, wlTitle, flTitle);
            % 174 176
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Input', 'input', num2str(hd.InputWordLength), num2str(hd.InputFracLength));
            % 176 180
            % 177 180
            % 178 180
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Coefficients', 'coeff', num2str(hd.CoeffWordLength), num2str(hd.NumFracLength));
            % 180 185
            % 181 185
            % 182 185
            % 183 185
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Product output', 'prod', num2str(hd.ProductWordLength), num2str(hd.ProductFracLength));
            % 185 190
            % 186 190
            % 187 190
            % 188 190
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Accumulator', 'accum', num2str(hd.AccumWordLength), num2str(hd.AccumFracLength));
            % 190 195
            % 191 195
            % 192 195
            % 193 195
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Output', 'output', num2str(hd.OutputWordLength), num2str(hd.OutputFracLength));
        else
            % 196 198
            % 197 199
            fpaDataTypePane.Items = cellhorzcat(modeTitle);
            % 199 202
            % 200 202
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Coefficients', 'coeff', 'Same word length as input');
            % 202 205
            % 203 205
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Product output', 'prod', 'Same as input');
            % 205 208
            % 206 208
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Accumulator', 'accum', 'Same as product output');
            % 208 212
            % 209 212
            % 210 212
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Output', 'output', 'Same as accumulator');
            % 212 214
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
        % 223 225
        discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals.');
        discText = dspGetLeafWidgetBase('text', discStr, 'discText', 0.0);
        % 226 230
        % 227 230
        % 228 230
        discText.WordWrap = 1.0;
        % 230 232
        discPane = dspGetContainerWidgetBase('panel', '', 'discPane');
        % 232 235
        % 233 235
        discPane.Items = cellhorzcat(discText);
        discPane.RowSpan = [1.0 1.0];
        discPane.ColSpan = [1.0 1.0];
        % 237 239
        emptyPanel = dspGetContainerWidgetBase('panel', '', 'emptyPanel');
        % 239 243
        % 240 243
        % 241 243
        emptyPanel.RowSpan = [2.0 2.0];
        emptyPanel.ColSpan = [1.0 1.0];
        % 244 246
        fpaOperationalPane = dspGetContainerWidgetBase('group', 'Fixed-point operational parameters', 'fpaOperationalPane');
        % 246 249
        % 247 249
        fpaOperationalPane.Items = cellhorzcat(roundingModeLabel, roundingModeText, overflowModeLabel, overflowModeText);
        % 249 251
        fpaOperationalPane.LayoutGrid = [1.0 5.0];
        fpaOperationalPane.RowSpan = [2.0 2.0];
        fpaOperationalPane.ColSpan = [1.0 1.0];
        % 253 255
        dataTypeTab.Items = cellhorzcat(discPane, emptyPanel, fpaOperationalPane, fpaDataTypePane);
        % 255 261
        % 256 261
        % 257 261
        % 258 261
        % 259 261
    end % if
    % 261 263
    dataTypeTab.Name = 'Fixed-point';
    % 263 268
    % 264 268
    % 265 268
    % 266 268
    mainPane = dspGetContainerWidgetBase('group', 'Parameters', 'mainPane');
    mainPane.RowSpan = [1.0 1.0];
    % 269 271
    if isfdtbxinstalled
        % 271 273
        fvToolButton = dspGetLeafWidgetBase('pushbutton', 'View Filter Response', 'fvToolButton', 0.0);
        % 273 276
        % 274 276
        fvToolButton.ToolTip = 'Launches FVTool to inspect the frequency response of the specified filter.';
        % 276 278
        fvToolButton.Alignment = 4.0;
        fvToolButton.ColSpan = [1.0 1.0];
        fvToolButton.MatlabMethod = 'dspLinkFVTool2Mask';
        fvToolButton.MatlabArgs = cellhorzcat(this.Block.Handle, 'create');
        % 281 283
        fvToolButton.Enabled = FVToolButtonEnabled;
        % 283 285
        openDialogs = this.getOpenDialogs;
        if not(isempty(openDialogs))
            if openDialogs{1.0}.hasUnappliedChanges
                fvToolButton.Enabled = 0.0;
            end % if
        end % if
        % 290 292
        buttonPanel = dspGetContainerWidgetBase('panel', 'Buttons', 'buttonPanel');
        buttonPanel.LayoutGrid = [1.0 3.0];
        buttonPanel.Items = cellhorzcat(fvToolButton);
        % 294 296
        mainPane.Items = cellhorzcat(paramsPanel, buttonPanel);
    else
        mainPane.Items = cellhorzcat(paramsPanel);
    end % if
    % 299 301
    generalTab.Name = 'Main';
    generalTab.Items = cellhorzcat(mainPane);
    % 302 304
    numGeneralTabItems = length(generalTab.Items);
    generalTab.LayoutGrid = horzcat(plus(1.0, numGeneralTabItems), 1.0);
    generalTab.RowStretch = horzcat(zeros(1.0, numGeneralTabItems), 1.0);
    % 306 308
    numDataTypeTabItems = length(dataTypeTab.Items);
    dataTypeTab.LayoutGrid = horzcat(plus(1.0, numDataTypeTabItems), 1.0);
    dataTypeTab.RowStretch = horzcat(zeros(1.0, numDataTypeTabItems), 1.0);
    % 310 313
    % 311 313
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.RowSpan = [3.0 3.0];
    tabbedPane.ColSpan = [1.0 1.0];
    % 315 317
    tabbedPane.Tabs = cellhorzcat(generalTab, dataTypeTab);
    % 317 320
    % 318 320
    filterSourcePane = dspGetContainerWidgetBase('panel', '', 'filterSourcePane');
    filterSourcePane.Items = cellhorzcat(FilterSource);
    filterSourcePane.RowSpan = [2.0 2.0];
    filterSourcePane.ColSpan = [1.0 1.0];
    % 323 325
    dlgStruct = getBaseSchemaStruct(this, tabbedPane, this.Block.MaskDescription, filterSourcePane);
    % 325 330
    % 326 330
    % 327 330
    % 328 330
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 331 335
    % 332 335
    % 333 335
    mask_enables{5.0} = 'off';
    mask_enables{6.0} = 'off';
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end % if
end % function
function [dtRows, row] = getDataTypeRowItem(dtRows, row, name, prefix, WLText, FLText)
    % 341 346
    % 342 346
    % 343 346
    % 344 346
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
    % 356 359
    % 357 359
    widgets{NAME} = dspGetLeafWidgetBase('text', name, name, 0.0);
    widgets{NAME}.ColSpan = [1.0 1.0];
    widgets{NAME}.Alignment = MWDSP_CENTER;
    % 361 364
    % 362 364
    widgets{MODE} = dspGetLeafWidgetBase('text', 'Binary point scaling', horzcat(prefix, 'Mode'), 0.0);
    % 364 366
    widgets{MODE}.ColSpan = [2.0 2.0];
    widgets{MODE}.Alignment = MWDSP_CENTER;
    % 367 370
    % 368 370
    widgets{SIGN} = dspGetLeafWidgetBase('text', 'yes', horzcat(prefix, 'Signed'), 0.0);
    % 370 373
    % 371 373
    widgets{SIGN}.ColSpan = [3.0 3.0];
    widgets{SIGN}.Alignment = MWDSP_CENTER;
    % 374 377
    % 375 377
    widgets{WL} = dspGetLeafWidgetBase('text', WLText, horzcat(prefix, 'WordLength'), 0.0);
    % 377 380
    % 378 380
    widgets{WL}.ColSpan = [4.0 4.0];
    widgets{WL}.Alignment = MWDSP_CENTER;
    % 381 384
    % 382 384
    widgets{FL} = dspGetLeafWidgetBase('text', FLText, horzcat(prefix, 'FracLength'), 0.0);
    % 384 387
    % 385 387
    widgets{FL}.ColSpan = [5.0 6.0];
    widgets{FL}.Alignment = MWDSP_CENTER;
    % 388 390
    for i=1.0:length(widgets)
        widgets{i}.RowSpan = horzcat(row, row);
    end % for
    % 392 394
    dtRows{dtIdx} = widgets;
    row = plus(row, 1.0);
end % function
function [dtRows, row] = getDefaultDataTypeRowItem(dtRows, row, name, prefix, mode)
    % 397 399
    dtIdx = plus(length(dtRows), 1.0);
    [NAME, MODE] = deal(1.0, 2.0);
    MWDSP_CENTER = 5.0;
    % 401 404
    % 402 404
    widgets{NAME} = dspGetLeafWidgetBase('text', name, name, 0.0);
    widgets{NAME}.ColSpan = [1.0 1.0];
    widgets{NAME}.Alignment = MWDSP_CENTER;
    % 406 409
    % 407 409
    widgets{MODE} = dspGetLeafWidgetBase('text', mode, horzcat(prefix, 'Mode_'), 0.0);
    % 409 411
    widgets{MODE}.ColSpan = [2.0 2.0];
    widgets{MODE}.Alignment = MWDSP_CENTER;
    % 412 414
    for i=1.0:length(widgets)
        widgets{i}.RowSpan = horzcat(row, row);
    end % for
    % 416 418
    dtRows{dtIdx} = widgets;
    row = plus(row, 1.0);
end % function
