function dlgStruct = getDialogSchema(this, dummy)
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
    blkh = this.Block.Handle;
    mask_enables = get_param(blkh, 'MaskEnables');
    old_mask_enables = mask_enables;
    % 16 18
    FVToolButtonEnabled = false;
    % 18 21
    % 19 21
    FilterSource = dspGetLeafWidgetBase('radiobutton', 'Coefficient source', 'FilterSource', this, 'FilterSource');
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    FilterSource.Entries = {'Dialog parameters','Multirate filter object (MFILT)'};
    % 26 28
    FilterSource.DialogRefresh = 1.0;
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    paramsPanel = dspGetContainerWidgetBase('panel', 'Parameters', 'paramsPanel');
    % 33 35
    if eq(this.FilterSource, 0.0)
        % 35 37
        mask_enables{end} = 'off';
        mask_enables(1.0:minus(end, 1.0)) = {'on'};
        % 38 40
        if isfield(this.Block.UserData, 'filterConstructor')
            FVToolButtonEnabled = true;
        end % if
        % 42 45
        % 43 45
        interpFactor = dspGetLeafWidgetBase('edit', 'Interpolation factor:', 'L', this, 'L');
        % 45 49
        % 46 49
        % 47 49
        coeffs = dspGetLeafWidgetBase('edit', 'FIR filter coefficients:', 'h', this, 'h');
        % 49 53
        % 50 53
        % 51 53
        decimFactor = dspGetLeafWidgetBase('edit', 'Decimation factor:', 'M', this, 'M');
        % 53 56
        % 54 56
        paramsPanel.Items = cellhorzcat(interpFactor, coeffs, decimFactor);
        % 56 58
        dataTypeTab.Items = cellhorzcat(this.FixptDialog.getDialogSchemaStruct);
    else
        % 59 63
        % 60 63
        % 61 63
        mask_enables{end} = 'on';
        mask_enables(1.0:minus(end, 1.0)) = {'off'};
        % 64 66
        FilterObject = dspGetLeafWidgetBase('edit', 'Multirate filter variable:', 'FilterObject', this, 'FilterObject');
        % 66 70
        % 67 70
        % 68 70
        FilterObject.DialogRefresh = 1.0;
        % 70 72
        paramsPanel.Items = cellhorzcat(FilterObject);
        % 72 75
        % 73 75
        filterIsFixpt = false;
        hd = [];
        if isfdtbxinstalled && isfield(this.Block.UserData, 'filter')
            hd = this.Block.UserData.filter;
            if not(isempty(hd))
                FVToolButtonEnabled = true;
                filterIsFixpt = strcmpi(hd.arithmetic, 'fixed');
            end % if
        end % if
        % 83 85
        MWDSP_TOP_LEFT = 1.0;
        MWDSP_TOP_CENTER = 2.0;
        MWDSP_TOP_RIGHT = 3.0;
        MWDSP_CENTER_LEFT = 4.0;
        MWDSP_CENTER = 5.0;
        MWDSP_CENTER_RIGHT = 6.0;
        MWDSP_BOTTOM_LEFT = 7.0;
        MWDSP_BOTTOM_CENTER = 8.0;
        MWDSP_BOTTOM_RIGHT = 9.0;
        % 93 95
        roundingModeLabel = dspGetLeafWidgetBase('text', 'Rounding mode:', 'roundingModeLabel', 0.0);
        % 95 97
        roundingModeLabel.RowSpan = [1.0 1.0];
        roundingModeLabel.ColSpan = [1.0 1.0];
        roundingModeLabel.Alignment = MWDSP_CENTER;
        % 99 101
        if filterIsFixpt
            roundingModeStr = dspGetSPRoundMode(hd.RoundMode);
            overflowModeStr = hd.OverflowMode;
            overflowModeStr = horzcat(upper(overflowModeStr(1.0)), overflowModeStr(2.0:end));
        else
            roundingModeStr = 'Floor';
            overflowModeStr = 'Wrap';
        end % if
        roundingModeText = dspGetLeafWidgetBase('text', roundingModeStr, 'roundingModeText', 0.0);
        % 109 111
        roundingModeText.RowSpan = [1.0 1.0];
        roundingModeText.ColSpan = [2.0 2.0];
        roundingModeText.Alignment = MWDSP_CENTER;
        % 113 115
        overflowModeLabel = dspGetLeafWidgetBase('text', 'Overflow mode:', 'overflowModeLabel', 0.0);
        % 115 117
        overflowModeLabel.RowSpan = [1.0 1.0];
        overflowModeLabel.ColSpan = [4.0 4.0];
        overflowModeLabel.Alignment = MWDSP_CENTER;
        % 119 121
        overflowModeText = dspGetLeafWidgetBase('text', overflowModeStr, 'overflowModeText', 0.0);
        % 121 123
        overflowModeText.RowSpan = [1.0 1.0];
        overflowModeText.ColSpan = [5.0 5.0];
        overflowModeText.Alignment = MWDSP_CENTER;
        % 125 127
        fpaOperationalPane = dspGetContainerWidgetBase('group', 'Fixed-point operational parameters', 'fpaOperationalPane');
        % 127 130
        % 128 130
        fpaOperationalPane.Items = cellhorzcat(roundingModeLabel, roundingModeText, overflowModeLabel, overflowModeText);
        % 130 132
        fpaOperationalPane.LayoutGrid = [1.0 5.0];
        fpaOperationalPane.RowSpan = [2.0 2.0];
        fpaOperationalPane.ColSpan = [1.0 1.0];
        % 134 137
        % 135 137
        modeTitle = dspGetLeafWidgetBase('text', 'Mode', 'modeTitle', 0.0);
        modeTitle.RowSpan = [1.0 1.0];
        modeTitle.ColSpan = [2.0 2.0];
        modeTitle.Alignment = MWDSP_CENTER;
        % 140 142
        fpaDataTypePane = dspGetContainerWidgetBase('group', 'Fixed-point data types', 'fpaDataTypePane');
        % 142 145
        % 143 145
        dtRows = {};
        rowNum = 2.0;
        % 146 148
        if filterIsFixpt
            signedTitle = dspGetLeafWidgetBase('text', 'Signed', 'signedTitle', 0.0);
            signedTitle.RowSpan = [1.0 1.0];
            signedTitle.ColSpan = [3.0 3.0];
            signedTitle.Alignment = MWDSP_CENTER;
            % 152 154
            wlTitle = dspGetLeafWidgetBase('text', ' Word length', 'wlTitle', 0.0);
            wlTitle.RowSpan = [1.0 1.0];
            wlTitle.ColSpan = [4.0 4.0];
            wlTitle.Alignment = MWDSP_CENTER;
            % 157 159
            flTitle = dspGetLeafWidgetBase('text', 'Fraction length', 'flTitle', 0.0);
            flTitle.RowSpan = [1.0 1.0];
            flTitle.ColSpan = [5.0 6.0];
            flTitle.Alignment = MWDSP_CENTER;
            % 162 164
            fpaDataTypePane.Items = cellhorzcat(modeTitle, signedTitle, wlTitle, flTitle);
            % 164 166
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Input', 'input', num2str(hd.InputWordLength), num2str(hd.InputFracLength));
            % 166 170
            % 167 170
            % 168 170
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Coefficients', 'coeff', num2str(hd.CoeffWordLength), num2str(hd.NumFracLength));
            % 170 175
            % 171 175
            % 172 175
            % 173 175
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Product output', 'prod', num2str(hd.ProductWordLength), num2str(hd.ProductFracLength));
            % 175 180
            % 176 180
            % 177 180
            % 178 180
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Accumulator', 'accum', num2str(hd.AccumWordLength), num2str(hd.AccumFracLength));
            % 180 185
            % 181 185
            % 182 185
            % 183 185
            [dtRows, rowNum] = getDataTypeRowItem(dtRows, rowNum, 'Output', 'output', num2str(hd.OutputWordLength), num2str(hd.OutputFracLength));
        else
            % 186 188
            % 187 189
            fpaDataTypePane.Items = cellhorzcat(modeTitle);
            % 189 192
            % 190 192
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Coefficients', 'coeff', 'Same word length as input');
            % 192 195
            % 193 195
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Product output', 'prod', 'Same as input');
            % 195 198
            % 196 198
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Accumulator', 'accum', 'Same as product output');
            % 198 202
            % 199 202
            % 200 202
            [dtRows, rowNum] = getDefaultDataTypeRowItem(dtRows, rowNum, 'Output', 'output', 'Same as accumulator');
            % 202 204
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
        % 213 215
        discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals.');
        discText = dspGetLeafWidgetBase('text', discStr, 'discText', 0.0);
        % 216 220
        % 217 220
        % 218 220
        discText.WordWrap = 1.0;
        % 220 222
        discPane = dspGetContainerWidgetBase('panel', '', 'discPane');
        % 222 225
        % 223 225
        discPane.Items = cellhorzcat(discText);
        discPane.RowSpan = [1.0 1.0];
        discPane.ColSpan = [1.0 1.0];
        % 227 229
        emptyPanel = dspGetContainerWidgetBase('panel', '', 'emptyPanel');
        % 229 233
        % 230 233
        % 231 233
        emptyPanel.RowSpan = [2.0 2.0];
        emptyPanel.ColSpan = [1.0 1.0];
        % 234 236
        fpaOperationalPane = dspGetContainerWidgetBase('group', 'Fixed-point operational parameters', 'fpaOperationalPane');
        % 236 239
        % 237 239
        fpaOperationalPane.Items = cellhorzcat(roundingModeLabel, roundingModeText, overflowModeLabel, overflowModeText);
        % 239 241
        fpaOperationalPane.LayoutGrid = [1.0 5.0];
        fpaOperationalPane.RowSpan = [2.0 2.0];
        fpaOperationalPane.ColSpan = [1.0 1.0];
        % 243 245
        dataTypeTab.Items = cellhorzcat(discPane, emptyPanel, fpaOperationalPane, fpaDataTypePane);
        % 245 251
        % 246 251
        % 247 251
        % 248 251
        % 249 251
    end % if
    % 251 253
    dataTypeTab.Name = 'Fixed-point';
    % 253 258
    % 254 258
    % 255 258
    % 256 258
    mainPane = dspGetContainerWidgetBase('group', 'Parameters', 'mainPane');
    mainPane.RowSpan = [1.0 1.0];
    % 259 261
    if isfdtbxinstalled
        % 261 263
        fvToolButton = dspGetLeafWidgetBase('pushbutton', 'View Filter Response', 'fvToolButton', 0.0);
        % 263 266
        % 264 266
        fvToolButton.ToolTip = 'Launches FVTool to inspect the frequency response of the specified filter.';
        % 266 268
        fvToolButton.Alignment = 4.0;
        fvToolButton.ColSpan = [1.0 1.0];
        fvToolButton.MatlabMethod = 'dspLinkFVTool2Mask';
        fvToolButton.MatlabArgs = cellhorzcat(this.Block.Handle, 'create');
        % 271 273
        fvToolButton.Enabled = FVToolButtonEnabled;
        % 273 275
        openDialogs = this.getOpenDialogs;
        if not(isempty(openDialogs))
            if openDialogs{1.0}.hasUnappliedChanges
                fvToolButton.Enabled = 0.0;
            end % if
        end % if
        % 280 282
        buttonPanel = dspGetContainerWidgetBase('panel', 'Buttons', 'buttonPanel');
        buttonPanel.LayoutGrid = [1.0 3.0];
        buttonPanel.Items = cellhorzcat(fvToolButton);
        % 284 286
        mainPane.Items = cellhorzcat(paramsPanel, buttonPanel);
    else
        mainPane.Items = cellhorzcat(paramsPanel);
    end % if
    % 289 291
    generalTab.Name = 'Main';
    generalTab.Items = cellhorzcat(mainPane);
    % 292 294
    numGeneralTabItems = length(generalTab.Items);
    generalTab.LayoutGrid = horzcat(plus(1.0, numGeneralTabItems), 1.0);
    generalTab.RowStretch = horzcat(zeros(1.0, numGeneralTabItems), 1.0);
    % 296 298
    numDataTypeTabItems = length(dataTypeTab.Items);
    dataTypeTab.LayoutGrid = horzcat(plus(1.0, numDataTypeTabItems), 1.0);
    dataTypeTab.RowStretch = horzcat(zeros(1.0, numDataTypeTabItems), 1.0);
    % 300 303
    % 301 303
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.RowSpan = [3.0 3.0];
    tabbedPane.ColSpan = [1.0 1.0];
    % 305 307
    tabbedPane.Tabs = cellhorzcat(generalTab, dataTypeTab);
    % 307 310
    % 308 310
    filterSourcePane = dspGetContainerWidgetBase('panel', '', 'filterSourcePane');
    filterSourcePane.Items = cellhorzcat(FilterSource);
    filterSourcePane.RowSpan = [2.0 2.0];
    filterSourcePane.ColSpan = [1.0 1.0];
    % 313 315
    dlgStruct = getBaseSchemaStruct(this, tabbedPane, this.Block.MaskDescription, filterSourcePane);
    % 315 320
    % 316 320
    % 317 320
    % 318 320
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 321 325
    % 322 325
    % 323 325
    mask_enables{5.0} = 'off';
    mask_enables{6.0} = 'off';
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end % if
end % function
function [dtRows, row] = getDataTypeRowItem(dtRows, row, name, prefix, WLText, FLText)
    % 331 336
    % 332 336
    % 333 336
    % 334 336
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
    % 346 349
    % 347 349
    widgets{NAME} = dspGetLeafWidgetBase('text', name, name, 0.0);
    widgets{NAME}.ColSpan = [1.0 1.0];
    widgets{NAME}.Alignment = MWDSP_CENTER;
    % 351 354
    % 352 354
    widgets{MODE} = dspGetLeafWidgetBase('text', 'Binary point scaling', horzcat(prefix, 'Mode'), 0.0);
    % 354 356
    widgets{MODE}.ColSpan = [2.0 2.0];
    widgets{MODE}.Alignment = MWDSP_CENTER;
    % 357 360
    % 358 360
    widgets{SIGN} = dspGetLeafWidgetBase('text', 'yes', horzcat(prefix, 'Signed'), 0.0);
    % 360 363
    % 361 363
    widgets{SIGN}.ColSpan = [3.0 3.0];
    widgets{SIGN}.Alignment = MWDSP_CENTER;
    % 364 367
    % 365 367
    widgets{WL} = dspGetLeafWidgetBase('text', WLText, horzcat(prefix, 'WordLength'), 0.0);
    % 367 370
    % 368 370
    widgets{WL}.ColSpan = [4.0 4.0];
    widgets{WL}.Alignment = MWDSP_CENTER;
    % 371 374
    % 372 374
    widgets{FL} = dspGetLeafWidgetBase('text', FLText, horzcat(prefix, 'FracLength'), 0.0);
    % 374 377
    % 375 377
    widgets{FL}.ColSpan = [5.0 6.0];
    widgets{FL}.Alignment = MWDSP_CENTER;
    % 378 380
    for i=1.0:length(widgets)
        widgets{i}.RowSpan = horzcat(row, row);
    end % for
    % 382 384
    dtRows{dtIdx} = widgets;
    row = plus(row, 1.0);
end % function
function [dtRows, row] = getDefaultDataTypeRowItem(dtRows, row, name, prefix, mode)
    % 387 389
    dtIdx = plus(length(dtRows), 1.0);
    [NAME, MODE] = deal(1.0, 2.0);
    MWDSP_CENTER = 5.0;
    % 391 394
    % 392 394
    widgets{NAME} = dspGetLeafWidgetBase('text', name, name, 0.0);
    widgets{NAME}.ColSpan = [1.0 1.0];
    widgets{NAME}.Alignment = MWDSP_CENTER;
    % 396 399
    % 397 399
    widgets{MODE} = dspGetLeafWidgetBase('text', mode, horzcat(prefix, 'Mode_'), 0.0);
    % 399 401
    widgets{MODE}.ColSpan = [2.0 2.0];
    widgets{MODE}.Alignment = MWDSP_CENTER;
    % 402 404
    for i=1.0:length(widgets)
        widgets{i}.RowSpan = horzcat(row, row);
    end % for
    % 406 408
    dtRows{dtIdx} = widgets;
    row = plus(row, 1.0);
end % function
