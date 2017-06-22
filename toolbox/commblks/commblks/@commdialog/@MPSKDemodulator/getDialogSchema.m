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
    MStr = dspGetLeafWidgetBase('text', 'M-ary number:', 'MStr', 0.0);
    MStr.RowSpan = [1.0 1.0];
    MStr.ColSpan = [1.0 1.0];
    % 19 21
    M = dspGetLeafWidgetBase('edit', '', 'M', this, 'M');
    M.Entries = set(this, 'M');
    M.RowSpan = [1.0 1.0];
    M.ColSpan = [2.0 2.0];
    % 24 27
    % 25 27
    PhStr = dspGetLeafWidgetBase('text', 'Phase offset (rad):', 'PhStr', 0.0);
    PhStr.RowSpan = [2.0 2.0];
    PhStr.ColSpan = [1.0 1.0];
    % 29 31
    Ph = dspGetLeafWidgetBase('edit', '', 'Ph', this, 'Ph');
    Ph.Entries = set(this, 'Ph');
    Ph.RowSpan = [2.0 2.0];
    Ph.ColSpan = [2.0 2.0];
    % 34 37
    % 35 37
    DecStr = dspGetLeafWidgetBase('text', 'Constellation ordering:', 'DecStr', 0.0);
    DecStr.RowSpan = [3.0 3.0];
    DecStr.ColSpan = [1.0 1.0];
    % 39 41
    Dec = dspGetLeafWidgetBase('combobox', '', 'Dec', this, 'Dec');
    Dec.DialogRefresh = 1.0;
    % 42 45
    % 43 45
    Dec.Entries = ctranspose(set(this, 'Dec'));
    Dec.RowSpan = [3.0 3.0];
    Dec.ColSpan = [2.0 2.0];
    % 47 50
    % 48 50
    MappingStr = dspGetLeafWidgetBase('text', 'Constellation mapping:', 'MappingStr', 0.0);
    % 50 52
    MappingStr.RowSpan = [4.0 4.0];
    MappingStr.ColSpan = [1.0 1.0];
    % 53 55
    Mapping = dspGetLeafWidgetBase('edit', '', 'Mapping', this, 'Mapping');
    % 55 57
    Mapping.Entries = ctranspose(set(this, 'Mapping'));
    Mapping.RowSpan = [4.0 4.0];
    Mapping.ColSpan = [2.0 2.0];
    % 59 61
    if strcmpi(this.Dec, 'user-defined')
        MappingStr.Visible = 1.0;
        Mapping.Visible = 1.0;
    else
        MappingStr.Visible = 0.0;
        Mapping.Visible = 0.0;
    end % if
    % 67 70
    % 68 70
    lineSpace = dspGetLeafWidgetBase('text', ' ', 'lineSpace', 0.0);
    % 70 72
    lineSpace.RowSpan = [5.0 5.0];
    lineSpace.ColSpan = [1.0 2.0];
    % 73 76
    % 74 76
    OutTypeStr = dspGetLeafWidgetBase('text', 'Output type:', 'OutTypeStr', 0.0);
    OutTypeStr.RowSpan = [6.0 6.0];
    OutTypeStr.ColSpan = [1.0 1.0];
    % 78 80
    OutType = dspGetLeafWidgetBase('combobox', '', 'OutType', this, 'OutType');
    % 80 82
    OutType.DialogRefresh = 1.0;
    % 82 85
    % 83 85
    OutType.Entries = ctranspose(set(this, 'OutType'));
    OutType.RowSpan = [6.0 6.0];
    OutType.ColSpan = [2.0 2.0];
    % 87 90
    % 88 90
    DecTypeStr = dspGetLeafWidgetBase('text', 'Decision type:', 'DecTypeStr', 0.0);
    % 90 92
    DecTypeStr.RowSpan = [7.0 7.0];
    DecTypeStr.ColSpan = [1.0 1.0];
    % 93 95
    DecType = dspGetLeafWidgetBase('combobox', '', 'DecType', this, 'DecType');
    % 95 97
    DecType.DialogRefresh = 1.0;
    % 97 100
    % 98 100
    DecType.Entries = ctranspose(set(this, 'DecType'));
    DecType.RowSpan = [7.0 7.0];
    DecType.ColSpan = [2.0 2.0];
    % 102 104
    if strcmpi(this.OutType, 'bit')
        DecTypeStr.Visible = 1.0;
        DecType.Visible = 1.0;
    else
        DecTypeStr.Visible = 0.0;
        DecType.Visible = 0.0;
    end % if
    % 110 113
    % 111 113
    VarSourceStr = dspGetLeafWidgetBase('text', 'Noise variance source:', 'VarSourceStr', 0.0);
    % 113 115
    VarSourceStr.RowSpan = [8.0 8.0];
    VarSourceStr.ColSpan = [1.0 1.0];
    % 116 118
    VarSource = dspGetLeafWidgetBase('combobox', '', 'VarSource', this, 'VarSource');
    % 118 120
    VarSource.DialogRefresh = 1.0;
    % 120 123
    % 121 123
    VarSource.Entries = ctranspose(set(this, 'VarSource'));
    VarSource.RowSpan = [8.0 8.0];
    VarSource.ColSpan = [2.0 2.0];
    % 125 127
    if eq(DecType.Visible, 1.0) && not(strcmpi(this.DecType, 'hard decision'))
        VarSourceStr.Visible = 1.0;
        VarSource.Visible = 1.0;
    else
        VarSourceStr.Visible = 0.0;
        VarSource.Visible = 0.0;
    end % if
    % 133 136
    % 134 136
    VarianceStr = dspGetLeafWidgetBase('text', 'Noise variance:', 'VarianceStr', 0.0);
    % 136 138
    VarianceStr.RowSpan = [9.0 9.0];
    VarianceStr.ColSpan = [1.0 1.0];
    % 139 141
    Variance = dspGetLeafWidgetBase('edit', '', 'Variance', this, 'Variance');
    % 141 143
    Variance.Entries = set(this, 'Variance');
    Variance.RowSpan = [9.0 9.0];
    Variance.ColSpan = [2.0 2.0];
    % 145 147
    if eq(VarSource.Visible, 1.0) && strcmpi(this.VarSource, 'dialog')
        VarianceStr.Visible = 1.0;
        Variance.Visible = 1.0;
        Variance.Tunable = 1.0;
    else
        VarianceStr.Visible = 0.0;
        Variance.Visible = 0.0;
        Variance.Tunable = 0.0;
    end % if
    % 155 158
    % 156 158
    outDtype1Str = dspGetLeafWidgetBase('text', 'Output data type:', 'outDtype1Str', 0.0);
    % 158 160
    outDtype1Str.RowSpan = [10.0 10.0];
    outDtype1Str.ColSpan = [1.0 1.0];
    % 161 164
    % 162 164
    outDtype1 = dspGetLeafWidgetBase('combobox', '', 'outDtype1', this, 'outDtype1');
    % 164 166
    outDtype1.Entries = ctranspose(set(this, 'outDtype1'));
    outDtype1.RowSpan = [10.0 10.0];
    outDtype1.ColSpan = [2.0 2.0];
    % 168 171
    % 169 171
    outDtype2 = dspGetLeafWidgetBase('combobox', '', 'outDtype2', this, 'outDtype2');
    % 171 173
    outDtype2.Entries = ctranspose(set(this, 'outDtype2'));
    outDtype2.RowSpan = [10.0 10.0];
    outDtype2.ColSpan = [2.0 2.0];
    % 175 178
    % 176 178
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
    % 190 195
    % 191 195
    % 192 195
    % 193 195
    mainParamsPanel = dspGetContainerWidgetBase('group', 'Parameters', 'mainParamsPanel');
    mainParamsPanel.Items = cellhorzcat(MStr, M, PhStr, Ph, DecStr, Dec, MappingStr, Mapping, lineSpace, OutTypeStr, OutType, DecTypeStr, DecType, VarSourceStr, VarSource, VarianceStr, Variance, outDtype1Str, outDtype1, outDtype2);
    % 196 206
    % 197 206
    % 198 206
    % 199 206
    % 200 206
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    mainParamsPanel.LayoutGrid = [10.0 2.0];
    mainParamsPanel.RowSpan = [2.0 2.0];
    mainParamsPanel.ColSpan = [1.0 1.0];
    mainParamsPanel.ColStretch = [0.0 1.0];
    % 209 214
    % 210 214
    % 211 214
    % 212 214
    dlgStruct = getBaseSchemaStruct(this, mainParamsPanel);
end % function
