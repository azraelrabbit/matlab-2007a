function dlgStruct = getDialogSchema(this, dummy)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    num_targets = dspGetLeafWidgetBase('edit', 'Number of filters:', 'num_targets', this, 'num_targets');
    % 15 17
    num_targets.Entries = ctranspose(set(this, 'num_targets'));
    num_targets.DialogRefresh = 1.0;
    num_targets.Tunable = 0.0;
    num_targets.RowSpan = [1.0 1.0];
    num_targets.ColSpan = [1.0 3.0];
    % 21 24
    % 22 24
    sourceEnable = dspGetLeafWidgetBase('combobox', 'Enable filters:      ', 'sourceEnable', this, 'sourceEnable');
    % 24 27
    % 25 27
    sourceEnable.Entries = ctranspose(set(this, 'sourceEnable'));
    sourceEnable.DialogRefresh = 1.0;
    sourceEnable.Tunable = 0.0;
    sourceEnable.RowSpan = [2.0 2.0];
    sourceEnable.ColSpan = [1.0 3.0];
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    indent1 = dspGetLeafWidgetBase('text', ' ', 'indent1', 0.0);
    indent1.MinimumSize = [24.0 0.0];
    indent1.MaximumSize = [24.0 24.0];
    indent1.RowSpan = [3.0 3.0];
    indent1.ColSpan = [1.0 1.0];
    % 40 43
    % 41 43
    isReset = dspGetLeafWidgetBase('checkbox', 'Reset estimated state and estimated error covariance when filters are disabled', 'isReset', this, 'isReset');
    % 43 46
    % 44 46
    isReset.Entries = ctranspose(set(this, 'isReset'));
    isReset.DialogRefresh = 1.0;
    isReset.Tunable = 0.0;
    isReset.RowSpan = [3.0 3.0];
    isReset.ColSpan = [2.0 3.0];
    % 50 54
    % 51 54
    % 52 54
    separatorPane = dspGetContainerWidgetBase('group', '', 'separatorPane');
    separatorPane.RowSpan = [4.0 4.0];
    separatorPane.ColSpan = [1.0 3.0];
    separatorPane.Flat = 1.0;
    % 57 60
    % 58 60
    X = dspGetLeafWidgetBase('edit', 'Initial condition for estimated state:                       ', 'X', this, 'X');
    % 60 62
    X.Entries = ctranspose(set(this, 'X'));
    X.Tunable = 0.0;
    X.RowSpan = [5.0 5.0];
    X.ColSpan = [1.0 3.0];
    % 65 68
    % 66 68
    P = dspGetLeafWidgetBase('edit', 'Initial condition for estimated error covariance:', 'P', this, 'P');
    % 68 71
    % 69 71
    P.Entries = ctranspose(set(this, 'P'));
    P.Tunable = 0.0;
    P.RowSpan = [6.0 6.0];
    P.ColSpan = [1.0 3.0];
    % 74 77
    % 75 77
    A = dspGetLeafWidgetBase('edit', 'State transition matrix:                     ', 'A', this, 'A');
    % 77 79
    A.Entries = ctranspose(set(this, 'A'));
    A.Tunable = 0.0;
    A.RowSpan = [7.0 7.0];
    A.ColSpan = [1.0 3.0];
    % 82 85
    % 83 85
    Q = dspGetLeafWidgetBase('edit', 'Process noise covariance:           ', 'Q', this, 'Q');
    % 85 87
    Q.Entries = ctranspose(set(this, 'Q'));
    Q.Tunable = 0.0;
    Q.RowSpan = [8.0 8.0];
    Q.ColSpan = [1.0 3.0];
    % 90 93
    % 91 93
    sourceMeasure = dspGetLeafWidgetBase('combobox', 'Measurement matrix source:        ', 'sourceMeasure', this, 'sourceMeasure');
    % 93 96
    % 94 96
    sourceMeasure.Entries = ctranspose(set(this, 'sourceMeasure'));
    sourceMeasure.DialogRefresh = 1.0;
    sourceMeasure.Tunable = 0.0;
    sourceMeasure.RowSpan = [9.0 9.0];
    sourceMeasure.ColSpan = [1.0 3.0];
    % 100 103
    % 101 103
    indent2 = dspGetLeafWidgetBase('text', ' ', 'indent2', 0.0);
    indent2.MinimumSize = [24.0 0.0];
    indent2.MaximumSize = [24.0 24.0];
    indent2.RowSpan = [10.0 10.0];
    indent2.ColSpan = [1.0 1.0];
    % 107 110
    % 108 110
    H = dspGetLeafWidgetBase('edit', 'Measurement matrix:              ', 'H', this, 'H');
    % 110 112
    H.Entries = ctranspose(set(this, 'H'));
    H.Tunable = 0.0;
    H.RowSpan = [10.0 10.0];
    H.ColSpan = [2.0 3.0];
    % 115 118
    % 116 118
    R = dspGetLeafWidgetBase('edit', 'Measurement noise covariance:', 'R', this, 'R');
    % 118 120
    R.Entries = ctranspose(set(this, 'R'));
    R.Tunable = 0.0;
    R.RowSpan = [11.0 11.0];
    R.ColSpan = [1.0 3.0];
    % 123 126
    % 124 126
    isOutputEstMeasure = dspGetLeafWidgetBase('checkbox', 'Output estimated measurement <Z_est>', 'isOutputEstMeasure', this, 'isOutputEstMeasure');
    % 126 129
    % 127 129
    isOutputEstMeasure.Entries = ctranspose(set(this, 'isOutputEstMeasure'));
    isOutputEstMeasure.Tunable = 0.0;
    isOutputEstMeasure.RowSpan = [12.0 12.0];
    isOutputEstMeasure.ColSpan = [1.0 2.0];
    % 132 135
    % 133 135
    isOutputPrdMeasure = dspGetLeafWidgetBase('checkbox', 'Output predicted measurement <Z_prd>', 'isOutputPrdMeasure', this, 'isOutputPrdMeasure');
    % 135 138
    % 136 138
    isOutputPrdMeasure.Entries = ctranspose(set(this, 'isOutputPrdMeasure'));
    isOutputPrdMeasure.Tunable = 0.0;
    isOutputPrdMeasure.RowSpan = [12.0 12.0];
    isOutputPrdMeasure.ColSpan = [3.0 3.0];
    % 141 144
    % 142 144
    isOutputEstState = dspGetLeafWidgetBase('checkbox', 'Output estimated state <X_est>', 'isOutputEstState', this, 'isOutputEstState');
    % 144 147
    % 145 147
    isOutputEstState.Entries = ctranspose(set(this, 'isOutputEstState'));
    isOutputEstState.Tunable = 0.0;
    isOutputEstState.RowSpan = [13.0 13.0];
    isOutputEstState.ColSpan = [1.0 2.0];
    % 150 153
    % 151 153
    isOutputPrdState = dspGetLeafWidgetBase('checkbox', 'Output predicted state <X_prd>', 'isOutputPrdState', this, 'isOutputPrdState');
    % 153 156
    % 154 156
    isOutputPrdState.Entries = ctranspose(set(this, 'isOutputPrdState'));
    isOutputPrdState.Tunable = 0.0;
    isOutputPrdState.RowSpan = [13.0 13.0];
    isOutputPrdState.ColSpan = [3.0 3.0];
    % 159 162
    % 160 162
    isOutputEstError = dspGetLeafWidgetBase('checkbox', 'Output MSE of estimated state <MSE_est>', 'isOutputEstError', this, 'isOutputEstError');
    % 162 165
    % 163 165
    isOutputEstError.Entries = ctranspose(set(this, 'isOutputEstError'));
    isOutputEstError.Tunable = 0.0;
    isOutputEstError.RowSpan = [14.0 14.0];
    isOutputEstError.ColSpan = [1.0 2.0];
    % 168 171
    % 169 171
    isOutputPrdError = dspGetLeafWidgetBase('checkbox', 'Output MSE of predicted state <MSE_prd>', 'isOutputPrdError', this, 'isOutputPrdError');
    % 171 174
    % 172 174
    isOutputPrdError.Entries = ctranspose(set(this, 'isOutputPrdError'));
    isOutputPrdError.Tunable = 0.0;
    isOutputPrdError.RowSpan = [14.0 14.0];
    isOutputPrdError.ColSpan = [3.0 3.0];
    % 177 180
    % 178 180
    if strcmp(this.sourceEnable, 'Always')
        indent1.Visible = 0.0;
        isReset.Visible = 0.0;
    else
        indent1.Visible = 1.0;
        isReset.Visible = 1.0;
    end % if
    % 186 189
    % 187 189
    if strcmp(this.sourceMeasure, 'Specify via dialog')
        indent2.Visible = 1.0;
        H.Visible = 1.0;
    else
        indent2.Visible = 0.0;
        H.Visible = 0.0;
    end % if
    % 195 198
    % 196 198
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Tag = 'parameterPane';
    parameterPane.Items = dspTrimItemList(cellhorzcat(num_targets, sourceEnable, indent1, isReset, separatorPane, X, P, A, Q, sourceMeasure, indent2, H, R));
    % 200 203
    % 201 203
    parameterPane.RowSpan = [1.0 1.0];
    parameterPane.ColSpan = [1.0 1.0];
    parameterPane.LayoutGrid = [1.0 1.0];
    % 205 208
    % 206 208
    outputPane = dspGetContainerWidgetBase('group', 'Outputs', 'outputPane');
    outputPane.Tag = 'outputPane';
    outputPane.Items = dspTrimItemList(cellhorzcat(isOutputEstState, isOutputEstMeasure, isOutputEstError, isOutputPrdState, isOutputPrdMeasure, isOutputPrdError));
    % 210 213
    % 211 213
    outputPane.RowSpan = [2.0 2.0];
    outputPane.ColSpan = [1.0 1.0];
    outputPane.LayoutGrid = [1.0 1.0];
    % 215 218
    % 216 218
    wholePane = dspGetContainerWidgetBase('panel', '', '');
    wholePane.Tag = 'wholePane';
    wholePane.Items = dspTrimItemList(cellhorzcat(parameterPane, outputPane));
    wholePane.RowSpan = [2.0 2.0];
    wholePane.ColSpan = [1.0 1.0];
    wholePane.LayoutGrid = [1.0 1.0];
    % 223 225
    dlgStruct = getBaseSchemaStruct(this, wholePane);
    dlgStruct.DialogTitle = this.Block.Name;
end % function
