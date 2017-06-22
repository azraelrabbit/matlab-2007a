function fpaPane = getDialogSchemaStruct(this, fixptBlurb)
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
    % 13 14
    if lt(nargin, 2.0)
        fixptBlurb = 1.0;
    end % if
    % 17 18
    switch fixptBlurb
    case 1.0
        discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals.');
    case 2.0
        discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals. In addition, fixed-point accumulator attributes only apply when block inputs are complex.');
    case 3.0
        discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals. In addition, fixed-point accumulator and product output attributes only apply when block inputs are complex.');
    case 4.0
        discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals. In addition, for the fixed-point sine table values, the fraction length is always equal to the word length minus one.');
    case 5.0
        discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals and wrapping occurs because the output size is smaller than the input size.');
    otherwise
        error('invalid fixpt disclaimer string choice in @DSPFixptDialog/getDialogSchemaStruct.m')
    end % switch
    % 32 33
    discText = dspGetLeafWidgetBase('text', discStr, 'discText', 0.0);
    % 34 37
    % 35 37
    % 36 37
    discText.WordWrap = 1.0;
    % 38 40
    % 39 40
    discPane = dspGetContainerWidgetBase('panel', '', 'discPane');
    % 41 43
    % 42 43
    discPane.Items = cellhorzcat(discText);
    discPane.RowSpan = [1.0 1.0];
    discPane.ColSpan = [1.0 1.0];
    % 46 47
    emptyPanel = dspGetContainerWidgetBase('panel', '', 'emptyPanel');
    % 48 51
    % 49 51
    % 50 51
    emptyPanel.RowSpan = [2.0 2.0];
    emptyPanel.ColSpan = [1.0 1.0];
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    fpaOperationalPane = dspGetContainerWidgetBase('group', 'Fixed-point operational parameters', 'fpaOperationalPane');
    % 61 63
    % 62 63
    fpaOperationalPane.Items = {};
    ExtraRows = [];
    for ind=1.0:length(this.extraOp)
        if strcmp(this.extraOp(ind).UserData, 'FixptOP')
            item = this.extraOp(ind).getDialogSchemaCellArray;
            fpaOperationalPane.Items = cat(2.0, fpaOperationalPane.Items, item);
            ExtraRows = cat(2.0, ExtraRows, item{1.0}.RowSpan(1.0):item{1.0}.RowSpan(2.0));
        end % if
    end % for
    % 72 73
    ExtraRows = unique(ExtraRows);
    % 74 76
    % 75 76
    indices = 1.0:length(ExtraRows);
    MissingRow = min(indices(not(eq(ExtraRows(:), indices(:)))));
    if isempty(MissingRow)
        roundOverFlowRowSpan = horzcat(plus(length(ExtraRows), 1.0), plus(length(ExtraRows), 1.0));
    else
        roundOverFlowRowSpan = horzcat(MissingRow, MissingRow);
    end % if
    % 83 84
    roundingMode = dspGetLeafWidgetBase('combobox', 'Rounding mode:', 'roundingMode', this.controller, 'roundingMode');
    % 85 87
    % 86 87
    roundingMode.Entries = ctranspose(set(this, 'roundingMode'));
    roundingMode.RowSpan = roundOverFlowRowSpan;
    roundingMode.ColSpan = [1.0 1.0];
    roundingMode.Source = this;
    % 91 92
    overflowMode = dspGetLeafWidgetBase('combobox', 'Overflow mode:', 'overflowMode', this.controller, 'overflowMode');
    % 93 95
    % 94 95
    overflowMode.Entries = ctranspose(set(this, 'overflowMode'));
    overflowMode.RowSpan = roundOverFlowRowSpan;
    overflowMode.ColSpan = [2.0 2.0];
    overflowMode.Source = this;
    % 99 100
    fpaOperationalPane.Items = cat(2.0, fpaOperationalPane.Items, cellhorzcat(roundingMode, overflowMode));
    % 101 103
    % 102 103
    fpaOperationalPane.LayoutGrid = horzcat(this.TotalOPRows, 2.0);
    fpaOperationalPane.Tag = 'fpaOperationalPane';
    fpaOperationalPane.RowSpan = [3.0 3.0];
    fpaOperationalPane.ColSpan = [1.0 1.0];
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    % 111 112
    if not(isempty(this.DataTypeRows))
        % 113 115
        % 114 115
        fpaDataTypePane = dspGetContainerWidgetBase('group', 'Fixed-point data types', 'fpaDataTypePane');
        % 116 118
        % 117 118
        fpaDataTypePane.Items = {};
        ExtraRows = [];
        for ind=1.0:length(this.extraOp)
            if strcmp(this.extraOp(ind).UserData, 'FixptDType')
                item = this.extraOp(ind).getDialogSchemaCellArray;
                fpaDataTypePane.Items = cat(2.0, fpaDataTypePane.Items, item);
                ExtraRows = cat(2.0, ExtraRows, item{1.0}.RowSpan(1.0):item{1.0}.RowSpan(2.0));
            end % if
        end % for
        % 127 128
        ExtraRows = unique(ExtraRows);
        % 129 131
        % 130 131
        indices = 1.0:length(ExtraRows);
        MissingRow = min(indices(not(eq(ExtraRows(:), indices(:)))));
        if isempty(MissingRow)
            TitleRowSpan = horzcat(plus(length(ExtraRows), 1.0), plus(length(ExtraRows), 1.0));
        else
            TitleRowSpan = horzcat(MissingRow, MissingRow);
        end % if
        % 138 140
        % 139 140
        modeTitle = dspGetLeafWidgetBase('text', 'Mode', 'modeTitle', 0.0);
        modeTitle.RowSpan = TitleRowSpan;
        modeTitle.ColSpan = [2.0 2.0];
        modeTitle.Alignment = 5.0;
        % 144 145
        dtNameTitle = dspGetLeafWidgetBase('text', sprintf('Data type\n   name'), 'dtNameTitle', 0.0);
        % 146 147
        dtNameTitle.RowSpan = TitleRowSpan;
        dtNameTitle.ColSpan = [3.0 3.0];
        dtNameTitle.Alignment = 5.0;
        % 150 151
        signedTitle = dspGetLeafWidgetBase('text', 'Signed', 'signedTitle', 0.0);
        signedTitle.RowSpan = TitleRowSpan;
        signedTitle.ColSpan = [4.0 4.0];
        signedTitle.Alignment = 5.0;
        % 155 156
        wlTitle = dspGetLeafWidgetBase('text', ' Word length', 'wlTitle', 0.0);
        wlTitle.RowSpan = TitleRowSpan;
        wlTitle.ColSpan = [5.0 5.0];
        wlTitle.Alignment = 5.0;
        % 160 161
        flTitle = dspGetLeafWidgetBase('text', 'Fraction length', 'flTitle', 0.0);
        flTitle.RowSpan = TitleRowSpan;
        flTitle.ColSpan = [6.0 6.0];
        flTitle.Alignment = 5.0;
        % 165 166
        slopeTitle = dspGetLeafWidgetBase('text', 'Slope', 'slopeTitle', 0.0);
        slopeTitle.RowSpan = TitleRowSpan;
        slopeTitle.ColSpan = [7.0 7.0];
        slopeTitle.Alignment = 5.0;
        % 170 171
        biasTitle = dspGetLeafWidgetBase('text', 'Bias', 'biasTitle', 0.0);
        biasTitle.RowSpan = TitleRowSpan;
        biasTitle.ColSpan = [8.0 8.0];
        biasTitle.Alignment = 5.0;
        % 175 177
        % 176 177
        cols = this.DataTypeRows.getAllColumns;
        colStretchInds = [];
        if bitand(cols, 1.0)
            % 180 184
            % 181 184
            % 182 184
            % 183 184
            dtNameTitle.Visible = 0.0;
        else
            dtNameTitle.Visible = 0.0;
        end % if
        if bitand(cols, 2.0)
            signedTitle.Visible = 1.0;
        else
            signedTitle.Visible = 0.0;
        end % if
        if bitand(cols, 4.0)
            wlTitle.Visible = 1.0;
            colStretchInds = cat(2.0, colStretchInds, 5.0);
        else
            wlTitle.Visible = 0.0;
        end % if
        if bitand(cols, 8.0)
            flTitle.Visible = 1.0;
            colStretchInds = cat(2.0, colStretchInds, 6.0);
        else
            flTitle.Visible = 0.0;
        end % if
        if bitand(cols, 16.0)
            slopeTitle.Visible = 1.0;
            colStretchInds = cat(2.0, colStretchInds, 7.0);
        else
            slopeTitle.Visible = 0.0;
        end % if
        if bitand(cols, 32.0)
            biasTitle.Visible = 1.0;
        else
            biasTitle.Visible = 0.0;
        end % if
        % 216 218
        % 217 218
        if isempty(colStretchInds)
            colStretchInds = cat(2.0, colStretchInds, 8.0);
        end % if
        % 221 222
        fpaDataTypePane.Items = cat(2.0, fpaDataTypePane.Items, cellhorzcat(modeTitle, dtNameTitle, signedTitle, wlTitle, flTitle, slopeTitle, biasTitle));
        % 223 225
        % 224 225
        fpaDataTypePane.Tag = 'fpaDataTypePane';
        % 226 227
        MaxDTypeRow = 1.0;
        for ind=1.0:length(this.DataTypeRows)
            fpaDataTypePane.Items = cat(2.0, fpaDataTypePane.Items, this.DataTypeRows(ind).getDialogSchemaCellArray(cols));
            % 230 231
            if gt(this.DataTypeRows(ind).Row, MaxDTypeRow)
                MaxDTypeRow = this.DataTypeRows(ind).Row;
            end % if
        end % for
        % 235 237
        % 236 237
        if this.hasLockScale
            LockScaleRow = plus(MaxDTypeRow, 1.0);
                while any(eq(LockScaleRow, ExtraRows))
                LockScaleRow = plus(LockScaleRow, 1.0);
            end % while
            lsPrompt = 'Lock scaling against changes by the autoscaling tool';
            LockScale = dspGetLeafWidgetBase('checkbox', lsPrompt, 'LockScale', this.controller, 'LockScale');
            % 244 245
            LockScale.RowSpan = horzcat(LockScaleRow, LockScaleRow);
            LockScale.ColSpan = [1.0 8.0];
            % 247 248
            fpaDataTypePane.Items = cat(2.0, fpaDataTypePane.Items, cellhorzcat(LockScale));
        end % if
        % 250 251
        fpaDataTypePane.LayoutGrid = horzcat(this.TotalDataTypeRows, 8.0);
        colStretch = zeros(1.0, 8.0);
        colStretch(colStretchInds) = 1.0;
        fpaDataTypePane.ColStretch = colStretch;
        % 255 256
        fpaDataTypePane.RowSpan = [4.0 4.0];
        fpaDataTypePane.ColSpan = [1.0 1.0];
        % 258 259
        items = cellhorzcat(discPane, emptyPanel, fpaOperationalPane, fpaDataTypePane);
    else
        % 261 262
        items = cellhorzcat(discPane, emptyPanel, fpaOperationalPane);
        % 263 264
    end % if
    % 265 270
    % 266 270
    % 267 270
    % 268 270
    % 269 270
    fpaPane = dspGetContainerWidgetBase('panel', '', 'fpaPane');
    fpaPane.Items = items;
    fpaPane.LayoutGrid = horzcat(plus(length(items), 1.0), 1.0);
    fpaPane.RowStretch = zeros(1.0, plus(length(items), 1.0));
    fpaPane.RowStretch(end) = 1.0;
    fpaPane.RowSpan = [1.0 1.0];
    fpaPane.ColSpan = [1.0 1.0];
    fpaPane.Tag = 'fpaPane';
    fpaPane.Source = this;
end % function
