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
    % 19 23
    % 20 23
    % 21 23
    PhStr.MinimumSize = [110.0 0.0];
    % 23 25
    Ph = dspGetLeafWidgetBase('edit', '', 'Ph', this, 'Ph');
    Ph.Visible = 1.0;
    Ph.DialogRefresh = 1.0;
    % 27 29
    Ph.Entries = set(this, 'Ph');
    Ph.RowSpan = [1.0 1.0];
    Ph.ColSpan = [2.0 2.0];
    % 31 34
    % 32 34
    DecTypeStr = dspGetLeafWidgetBase('text', 'Decision type:', 'DecTypeStr', 0.0);
    % 34 36
    DecTypeStr.RowSpan = [2.0 2.0];
    DecTypeStr.ColSpan = [1.0 1.0];
    % 37 39
    DecType = dspGetLeafWidgetBase('combobox', '', 'DecType', this, 'DecType');
    % 39 41
    DecType.DialogRefresh = 1.0;
    % 41 43
    DecType.Entries = ctranspose(set(this, 'DecType'));
    DecType.RowSpan = [2.0 2.0];
    DecType.ColSpan = [2.0 2.0];
    % 45 48
    % 46 48
    VarSourceStr = dspGetLeafWidgetBase('text', 'Noise variance source:', 'VarSourceStr', 0.0);
    % 48 50
    VarSourceStr.RowSpan = [3.0 3.0];
    VarSourceStr.ColSpan = [1.0 1.0];
    % 51 53
    VarSource = dspGetLeafWidgetBase('combobox', '', 'VarSource', this, 'VarSource');
    % 53 55
    VarSource.DialogRefresh = 1.0;
    % 55 57
    VarSource.Entries = ctranspose(set(this, 'VarSource'));
    VarSource.RowSpan = [3.0 3.0];
    VarSource.ColSpan = [2.0 2.0];
    % 59 61
    if not(strcmpi(this.DecType, 'hard decision'))
        VarSourceStr.Visible = 1.0;
        VarSource.Visible = 1.0;
    else
        VarSourceStr.Visible = 0.0;
        VarSource.Visible = 0.0;
    end % if
    % 67 70
    % 68 70
    VarianceStr = dspGetLeafWidgetBase('text', 'Noise variance:', 'VarianceStr', 0.0);
    % 70 72
    VarianceStr.RowSpan = [4.0 4.0];
    VarianceStr.ColSpan = [1.0 1.0];
    % 73 75
    Variance = dspGetLeafWidgetBase('edit', '', 'Variance', this, 'Variance');
    % 75 77
    Variance.DialogRefresh = 1.0;
    % 77 79
    Variance.Entries = set(this, 'Variance');
    Variance.RowSpan = [4.0 4.0];
    Variance.ColSpan = [2.0 2.0];
    % 81 83
    if eq(VarSource.Visible, 1.0) && strcmpi(this.VarSource, 'dialog')
        VarianceStr.Visible = 1.0;
        Variance.Visible = 1.0;
        Variance.Tunable = 1.0;
    else
        VarianceStr.Visible = 0.0;
        Variance.Visible = 0.0;
        Variance.Tunable = 0.0;
    end % if
    % 91 94
    % 92 94
    outDtypeStr = dspGetLeafWidgetBase('text', 'Output data type:', 'outDtype1Str', 0.0);
    % 94 96
    outDtypeStr.RowSpan = [5.0 5.0];
    outDtypeStr.ColSpan = [1.0 1.0];
    % 97 100
    % 98 100
    outDtype = dspGetLeafWidgetBase('combobox', '', 'outDtype', this, 'outDtype');
    % 100 102
    if strcmpi(this.DecType, 'hard decision')
        outDtypeStr.Visible = 1.0;
        outDtype.Visible = 1.0;
    else
        outDtypeStr.Visible = 0.0;
        outDtype.Visible = 0.0;
    end % if
    outDtype.Entries = ctranspose(set(this, 'outDtype'));
    outDtype.RowSpan = [5.0 5.0];
    outDtype.ColSpan = [2.0 2.0];
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    mainParamsPanel = dspGetContainerWidgetBase('group', 'Parameters', 'mainParamsPanel');
    mainParamsPanel.Items = cellhorzcat(PhStr, Ph, DecTypeStr, DecType, VarSourceStr, VarSource, VarianceStr, Variance, outDtypeStr, outDtype);
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    mainParamsPanel.LayoutGrid = [5.0 2.0];
    mainParamsPanel.RowSpan = [2.0 2.0];
    mainParamsPanel.ColSpan = [1.0 1.0];
    mainParamsPanel.ColStretch = [0.0 1.0];
    % 125 130
    % 126 130
    % 127 130
    % 128 130
    dlgStruct = getBaseSchemaStruct(this, mainParamsPanel);
    % 130 139
    % 131 139
    % 132 139
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    blkh = this.Block.Handle;
    mask_enables = get_param(blkh, 'MaskEnables');
    old_mask_enables = mask_enables;
    % 141 144
    % 142 144
    varianceIdx = getblockmaskparamindex(blkh, 'Variance');
    % 144 149
    % 145 149
    % 146 149
    % 147 149
    if eq(Variance.Visible, 1.0)
        mask_enables{varianceIdx} = 'on';
    else
        mask_enables{varianceIdx} = 'off';
    end % if
    % 153 160
    % 154 160
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end % if
end % function
