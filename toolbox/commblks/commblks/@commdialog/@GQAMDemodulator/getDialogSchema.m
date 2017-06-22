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
    SigConstStr = dspGetLeafWidgetBase('text', 'Signal constellation:', 'SigConstStr', 0.0);
    % 17 19
    SigConstStr.RowSpan = [1.0 1.0];
    SigConstStr.ColSpan = [1.0 1.0];
    SigConstStr.MinimumSize = [110.0 10.0];
    % 21 24
    % 22 24
    SigConst = dspGetLeafWidgetBase('edit', '', 'SigCon', this, 'SigCon');
    % 24 26
    SigConst.Entries = ctranspose(set(this, 'SigCon'));
    SigConst.RowSpan = [1.0 1.0];
    SigConst.ColSpan = [2.0 2.0];
    % 28 31
    % 29 31
    OutTypeStr = dspGetLeafWidgetBase('text', 'Output type:', 'OutTypeStr', 0.0);
    OutTypeStr.RowSpan = [2.0 2.0];
    OutTypeStr.ColSpan = [1.0 1.0];
    % 33 35
    OutType = dspGetLeafWidgetBase('combobox', '', 'OutType', this, 'OutType');
    % 35 37
    OutType.DialogRefresh = 1.0;
    % 37 40
    % 38 40
    OutType.Entries = ctranspose(set(this, 'OutType'));
    OutType.RowSpan = [2.0 2.0];
    OutType.ColSpan = [2.0 2.0];
    % 42 45
    % 43 45
    DecTypeStr = dspGetLeafWidgetBase('text', 'Decision type:', 'DecTypeStr', 0.0);
    DecTypeStr.RowSpan = [3.0 3.0];
    DecTypeStr.ColSpan = [1.0 1.0];
    % 47 49
    DecType = dspGetLeafWidgetBase('combobox', '', 'DecType', this, 'DecType');
    % 49 51
    DecType.DialogRefresh = 1.0;
    % 51 54
    % 52 54
    DecType.Entries = ctranspose(set(this, 'DecType'));
    DecType.RowSpan = [3.0 3.0];
    DecType.ColSpan = [2.0 2.0];
    % 56 58
    if strcmpi(this.OutType, 'bit')
        DecTypeStr.Visible = 1.0;
        DecType.Visible = 1.0;
    else
        DecTypeStr.Visible = 0.0;
        DecType.Visible = 0.0;
    end % if
    % 64 67
    % 65 67
    VarSourceStr = dspGetLeafWidgetBase('text', 'Noise variance source:', 'VarSourceStr', 0.0);
    % 67 69
    VarSourceStr.RowSpan = [4.0 4.0];
    VarSourceStr.ColSpan = [1.0 1.0];
    % 70 72
    VarSource = dspGetLeafWidgetBase('combobox', '', 'VarSource', this, 'VarSource');
    % 72 74
    VarSource.DialogRefresh = 1.0;
    % 74 78
    % 75 78
    % 76 78
    VarSource.Entries = ctranspose(set(this, 'VarSource'));
    VarSource.RowSpan = [4.0 4.0];
    VarSource.ColSpan = [2.0 2.0];
    % 80 82
    if eq(DecType.Visible, 1.0) && not(strcmpi(this.DecType, 'hard decision'))
        VarSourceStr.Visible = 1.0;
        VarSource.Visible = 1.0;
    else
        VarSourceStr.Visible = 0.0;
        VarSource.Visible = 0.0;
    end % if
    % 88 91
    % 89 91
    VarianceStr = dspGetLeafWidgetBase('text', 'Noise variance:', 'VarianceStr', 0.0);
    VarianceStr.RowSpan = [5.0 5.0];
    VarianceStr.ColSpan = [1.0 1.0];
    % 93 95
    Variance = dspGetLeafWidgetBase('edit', '', 'Variance', this, 'Variance');
    % 95 97
    Variance.Entries = set(this, 'Variance');
    Variance.RowSpan = [5.0 5.0];
    Variance.ColSpan = [2.0 2.0];
    % 99 101
    if eq(VarSource.Visible, 1.0) && strcmpi(this.VarSource, 'dialog')
        VarianceStr.Visible = 1.0;
        Variance.Visible = 1.0;
        Variance.Tunable = 1.0;
    else
        VarianceStr.Visible = 0.0;
        Variance.Visible = 0.0;
        Variance.Tunable = 0.0;
    end % if
    % 109 112
    % 110 112
    outDtypeBitStr = dspGetLeafWidgetBase('text', 'Output data type:', 'outDtypeBitStr', 0.0);
    % 112 114
    outDtypeBitStr.RowSpan = [6.0 6.0];
    outDtypeBitStr.ColSpan = [1.0 1.0];
    % 115 118
    % 116 118
    outDtypeBit = dspGetLeafWidgetBase('combobox', '', 'outDtypeBit', this, 'outDtypeBit');
    % 118 120
    outDtypeBit.Entries = ctranspose(set(this, 'outDtypeBit'));
    outDtypeBit.RowSpan = [6.0 6.0];
    outDtypeBit.ColSpan = [2.0 2.0];
    % 122 125
    % 123 125
    outDtype = dspGetLeafWidgetBase('combobox', '', 'outDtype', this, 'outDtype');
    % 125 127
    outDtype.Entries = ctranspose(set(this, 'outDtype'));
    outDtype.RowSpan = [6.0 6.0];
    outDtype.ColSpan = [2.0 2.0];
    % 129 131
    if strcmpi(this.OutType, 'bit')
        if strcmpi(this.DecType, 'hard decision')
            outDtypeBitStr.Visible = 1.0;
            outDtypeBit.Visible = 1.0;
        else
            % 135 137
            outDtypeBitStr.Visible = 0.0;
            outDtypeBit.Visible = 0.0;
        end % if
        outDtype.Visible = 0.0;
    else
        % 141 143
        outDtypeBit.Visible = 0.0;
        outDtype.Visible = 1.0;
    end % if
    % 145 150
    % 146 150
    % 147 150
    % 148 150
    mainParamsPanel = dspGetContainerWidgetBase('group', 'Parameters', 'mainParamsPanel');
    mainParamsPanel.Items = cellhorzcat(SigConstStr, SigConst, OutTypeStr, OutType, DecTypeStr, DecType, VarSourceStr, VarSource, VarianceStr, Variance, outDtypeBitStr, outDtypeBit, outDtype);
    % 151 158
    % 152 158
    % 153 158
    % 154 158
    % 155 158
    % 156 158
    mainParamsPanel.LayoutGrid = [6.0 2.0];
    mainParamsPanel.RowSpan = [2.0 2.0];
    mainParamsPanel.ColSpan = [1.0 1.0];
    mainParamsPanel.ColStretch = [0.0 1.0];
    % 161 163
    dlgStruct = getBaseSchemaStruct(this, mainParamsPanel);
end % function
