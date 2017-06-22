function dlgStruct = getDialogSchema(this, dummy)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    PhStr = dspGetLeafWidgetBase('text', 'Phase offset(rad):', 'PhStr', 0.0);
    PhStr.RowSpan = [1.0 1.0];
    PhStr.ColSpan = [1.0 1.0];
    % 19 21
    Ph = dspGetLeafWidgetBase('edit', '', 'Ph', this, 'Ph');
    Ph.Visible = 1.0;
    Ph.DialogRefresh = 1.0;
    % 23 25
    Ph.Entries = set(this, 'Ph');
    Ph.RowSpan = [1.0 1.0];
    Ph.ColSpan = [2.0 2.0];
    % 27 30
    % 28 30
    DecStr = dspGetLeafWidgetBase('text', 'Constellation ordering:', 'DecStr', 0.0);
    DecStr.RowSpan = [2.0 2.0];
    DecStr.ColSpan = [1.0 1.0];
    % 32 34
    Dec = dspGetLeafWidgetBase('combobox', '', 'Dec', this, 'Dec');
    Dec.Visible = 1.0;
    Dec.DialogRefresh = 1.0;
    % 36 38
    Dec.Entries = ctranspose(set(this, 'Dec'));
    Dec.RowSpan = [2.0 2.0];
    Dec.ColSpan = [2.0 2.0];
    % 40 43
    % 41 43
    lineSpace = dspGetLeafWidgetBase('text', ' ', 'lineSpace', 0.0);
    % 43 45
    lineSpace.RowSpan = [3.0 3.0];
    lineSpace.ColSpan = [1.0 2.0];
    % 46 49
    % 47 49
    OutTypeStr = dspGetLeafWidgetBase('text', 'Output type:', 'OutTypeStr', 0.0);
    OutTypeStr.RowSpan = [4.0 4.0];
    OutTypeStr.ColSpan = [1.0 1.0];
    % 51 53
    OutType = dspGetLeafWidgetBase('combobox', '', 'OutType', this, 'OutType');
    % 53 55
    OutType.Visible = 1.0;
    OutType.DialogRefresh = 1.0;
    % 56 58
    OutType.Entries = ctranspose(set(this, 'OutType'));
    OutType.RowSpan = [4.0 4.0];
    OutType.ColSpan = [2.0 2.0];
    % 60 63
    % 61 63
    DecTypeStr = dspGetLeafWidgetBase('text', 'Decision type:', 'DecTypeStr', 0.0);
    % 63 65
    DecTypeStr.RowSpan = [5.0 5.0];
    DecTypeStr.ColSpan = [1.0 1.0];
    % 66 68
    DecType = dspGetLeafWidgetBase('combobox', '', 'DecType', this, 'DecType');
    % 68 70
    DecType.DialogRefresh = 1.0;
    % 70 72
    DecType.Entries = ctranspose(set(this, 'DecType'));
    DecType.RowSpan = [5.0 5.0];
    DecType.ColSpan = [2.0 2.0];
    % 74 76
    if strcmpi(this.OutType, 'bit')
        DecTypeStr.Visible = 1.0;
        DecType.Visible = 1.0;
    else
        DecTypeStr.Visible = 0.0;
        DecType.Visible = 0.0;
    end % if
    % 82 85
    % 83 85
    VarSourceStr = dspGetLeafWidgetBase('text', 'Noise variance source:', 'VarSourceStr', 0.0);
    % 85 87
    VarSourceStr.RowSpan = [6.0 6.0];
    VarSourceStr.ColSpan = [1.0 1.0];
    % 88 90
    VarSource = dspGetLeafWidgetBase('combobox', '', 'VarSource', this, 'VarSource');
    % 90 92
    VarSource.DialogRefresh = 1.0;
    % 92 94
    VarSource.Entries = ctranspose(set(this, 'VarSource'));
    VarSource.RowSpan = [6.0 6.0];
    VarSource.ColSpan = [2.0 2.0];
    % 96 98
    if eq(DecType.Visible, 1.0) && not(strcmpi(this.DecType, 'hard decision'))
        VarSourceStr.Visible = 1.0;
        VarSource.Visible = 1.0;
    else
        VarSourceStr.Visible = 0.0;
        VarSource.Visible = 0.0;
    end % if
    % 104 107
    % 105 107
    VarianceStr = dspGetLeafWidgetBase('text', 'Noise variance:', 'VarianceStr', 0.0);
    % 107 109
    VarianceStr.RowSpan = [7.0 7.0];
    VarianceStr.ColSpan = [1.0 1.0];
    % 110 112
    Variance = dspGetLeafWidgetBase('edit', '', 'Variance', this, 'Variance');
    % 112 114
    Variance.DialogRefresh = 1.0;
    % 114 116
    Variance.Entries = set(this, 'Variance');
    Variance.RowSpan = [7.0 7.0];
    Variance.ColSpan = [2.0 2.0];
    % 118 120
    if eq(VarSource.Visible, 1.0) && strcmpi(this.VarSource, 'dialog')
        VarianceStr.Visible = 1.0;
        Variance.Visible = 1.0;
        Variance.Tunable = 1.0;
    else
        VarianceStr.Visible = 0.0;
        Variance.Visible = 0.0;
        Variance.Tunable = 0.0;
    end % if
    % 128 131
    % 129 131
    outDtype1Str = dspGetLeafWidgetBase('text', 'Output data type:', 'outDtype1Str', 0.0);
    % 131 133
    outDtype1Str.RowSpan = [8.0 8.0];
    outDtype1Str.ColSpan = [1.0 1.0];
    % 134 137
    % 135 137
    outDtype1 = dspGetLeafWidgetBase('combobox', '', 'outDtype1', this, 'outDtype1');
    % 137 139
    outDtype1.Entries = ctranspose(set(this, 'outDtype1'));
    outDtype1.RowSpan = [8.0 8.0];
    outDtype1.ColSpan = [2.0 2.0];
    % 141 144
    % 142 144
    outDtype2 = dspGetLeafWidgetBase('combobox', '', 'outDtype2', this, 'outDtype2');
    % 144 146
    outDtype2.Entries = ctranspose(set(this, 'outDtype2'));
    outDtype2.RowSpan = [8.0 8.0];
    outDtype2.ColSpan = [2.0 2.0];
    % 148 151
    % 149 151
    if strcmpi(this.OutType, 'bit')
        if strcmpi(this.DecType, 'hard decision')
            outDtype1Str.Visible = 1.0;
            outDtype1.Visible = 1.0;
        else
            outDtype1Str.Visible = 0.0;
            outDtype1.Visible = 0.0;
        end % if
        outDtype2.Visible = 0.0;
    else
        outDtype1.Visible = 0.0;
        outDtype2.Visible = 1.0;
    end % if
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    mainParamsPanel = dspGetContainerWidgetBase('group', 'Parameters', 'mainParamsPanel');
    mainParamsPanel.Items = cellhorzcat(PhStr, Ph, DecStr, Dec, lineSpace, OutTypeStr, OutType, DecTypeStr, DecType, VarSourceStr, VarSource, VarianceStr, Variance, outDtype1Str, outDtype1, outDtype2);
    % 169 177
    % 170 177
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    mainParamsPanel.LayoutGrid = [8.0 2.0];
    mainParamsPanel.RowSpan = [2.0 2.0];
    mainParamsPanel.ColSpan = [1.0 1.0];
    mainParamsPanel.ColStretch = [0.0 1.0];
    % 180 185
    % 181 185
    % 182 185
    % 183 185
    dlgStruct = getBaseSchemaStruct(this, mainParamsPanel);
    % 185 194
    % 186 194
    % 187 194
    % 188 194
    % 189 194
    % 190 194
    % 191 194
    % 192 194
    blkh = this.Block.Handle;
    mask_enables = get_param(blkh, 'MaskEnables');
    old_mask_enables = mask_enables;
    % 196 199
    % 197 199
    varianceIdx = getblockmaskparamindex(blkh, 'Variance');
    % 199 204
    % 200 204
    % 201 204
    % 202 204
    if eq(Variance.Visible, 1.0)
        mask_enables{varianceIdx} = 'on';
    else
        mask_enables{varianceIdx} = 'off';
    end % if
    % 208 215
    % 209 215
    % 210 215
    % 211 215
    % 212 215
    % 213 215
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end % if
end % function
