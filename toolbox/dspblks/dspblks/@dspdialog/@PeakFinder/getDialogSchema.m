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
    polarity = dspGetLeafWidgetBase('combobox', 'Peak type(s):', 'polarity', this, 'polarity');
    % 13 15
    polarity.Entries = ctranspose(set(this, 'polarity'));
    polarity.Tunable = 1.0;
    % 16 18
    outputIdx = dspGetLeafWidgetBase('checkbox', 'Output peak indices', 'outputIdx', this, 'outputIdx');
    % 18 20
    outputIdx.Tunable = 1.0;
    % 20 22
    outputVal = dspGetLeafWidgetBase('checkbox', 'Output peak values', 'outputVal', this, 'outputVal');
    % 22 24
    outputVal.Tunable = 1.0;
    % 24 26
    maxPeaks = dspGetLeafWidgetBase('edit', 'Maximum number of peaks to find:', 'maxPeaks', this, 'maxPeaks');
    % 26 28
    maxPeaks.Tunable = 1.0;
    % 28 30
    prompt = 'Ignore peaks within threshold of neighboring values';
    NoiseDistinguish = dspGetLeafWidgetBase('checkbox', prompt, 'NoiseDistinguish', this, 'NoiseDistinguish');
    % 31 33
    NoiseDistinguish.Tunable = 1.0;
    NoiseDistinguish.DialogRefresh = 1.0;
    % 34 36
    thresh = dspGetLeafWidgetBase('edit', 'Threshold', 'thresh', this, 'thresh');
    % 36 38
    thresh.Tunable = 1.0;
    if this.NoiseDistinguish
        thresh.Visible = 1.0;
    else
        thresh.Visible = 0.0;
    end % if
    % 43 45
    mainPane = dspGetContainerWidgetBase('group', 'Parameters', 'mainPane');
    mainPane.Items = cellhorzcat(polarity, outputIdx, outputVal, maxPeaks, NoiseDistinguish, thresh);
    % 46 48
    generalTab.Name = 'Main';
    generalTab.Items = cellhorzcat(mainPane);
    % 49 51
    numGeneralTabItems = length(generalTab.Items);
    generalTab.LayoutGrid = horzcat(plus(1.0, numGeneralTabItems), 1.0);
    generalTab.RowStretch = horzcat(zeros(1.0, numGeneralTabItems), 1.0);
    % 53 57
    % 54 57
    % 55 57
    MWDSP_AUTO = 0.0;
    MWDSP_LEFT = 1.0;
    MWDSP_TOP_LEFT = 2.0;
    MWDSP_TOP_CENTER = 3.0;
    MWDSP_TOP_RIGHT = 4.0;
    MWDSP_CENTER_LEFT = 5.0;
    MWDSP_CENTER = 6.0;
    MWDSP_CENTER_RIGHT = 7.0;
    MWDSP_BOTTOM_LEFT = 8.0;
    MWDSP_BOTTOM_CENTER = 9.0;
    MWDSP_BOTTOM_RIGHT = 10.0;
    roundingModeLabel = dspGetLeafWidgetBase('text', 'Rounding mode:', 'roundingModeLabel', 0.0);
    % 68 70
    roundingModeLabel.RowSpan = [1.0 1.0];
    roundingModeLabel.ColSpan = [1.0 1.0];
    roundingModeLabel.Alignment = MWDSP_CENTER_LEFT;
    % 72 74
    roundingModeText = dspGetLeafWidgetBase('text', 'Floor', 'roundingModeText', 0.0);
    % 74 76
    roundingModeText.RowSpan = [1.0 1.0];
    roundingModeText.ColSpan = [2.0 2.0];
    roundingModeText.Alignment = MWDSP_CENTER_LEFT;
    % 78 80
    overflowMode = dspGetLeafWidgetBase('combobox', 'Overflow mode:', 'overflowMode', this, 'overflowMode');
    % 80 83
    % 81 83
    overflowMode.Entries = ctranspose(set(this, 'overflowMode'));
    overflowMode.RowSpan = [1.0 1.0];
    overflowMode.ColSpan = [3.0 3.0];
    overflowMode.Alignment = MWDSP_CENTER_LEFT;
    overflowMode.Source = this;
    % 87 89
    fpaOperationalPane = dspGetContainerWidgetBase('group', 'Fixed-point operational parameters', 'fpaOperationalPane');
    % 89 92
    % 90 92
    fpaOperationalPane.Items = cellhorzcat(roundingModeLabel, roundingModeText, overflowMode);
    % 92 94
    fpaOperationalPane.LayoutGrid = [1.0 3.0];
    fpaOperationalPane.RowSpan = [3.0 3.0];
    fpaOperationalPane.ColSpan = [1.0 1.0];
    % 96 98
    discStr = sprintf('Settings on this pane only apply when block inputs are fixed-point signals.');
    discText = dspGetLeafWidgetBase('text', discStr, 'discText', 0.0);
    % 99 103
    % 100 103
    % 101 103
    discText.WordWrap = 1.0;
    % 103 105
    discPane = dspGetContainerWidgetBase('panel', '', 'discPane');
    % 105 108
    % 106 108
    discPane.Items = cellhorzcat(discText);
    discPane.RowSpan = [1.0 1.0];
    discPane.ColSpan = [1.0 1.0];
    % 110 112
    emptyPanel = dspGetContainerWidgetBase('panel', '', 'emptyPanel');
    % 112 116
    % 113 116
    % 114 116
    emptyPanel.RowSpan = [2.0 2.0];
    emptyPanel.ColSpan = [1.0 1.0];
    % 117 119
    dataTypeTab.Name = 'Fixed-point';
    dataTypeTab.Items = cellhorzcat(discPane, emptyPanel, fpaOperationalPane);
    % 120 124
    % 121 124
    % 122 124
    numDataTypeTabItems = length(dataTypeTab.Items);
    dataTypeTab.LayoutGrid = horzcat(plus(1.0, numDataTypeTabItems), 1.0);
    dataTypeTab.RowStretch = horzcat(zeros(1.0, numDataTypeTabItems), 1.0);
    % 126 129
    % 127 129
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.RowSpan = [3.0 3.0];
    tabbedPane.ColSpan = [1.0 1.0];
    % 131 133
    tabbedPane.Tabs = cellhorzcat(generalTab, dataTypeTab);
    % 133 135
    dlgStruct = getBaseSchemaStruct(this, tabbedPane, this.Block.MaskDescription);
    % 135 137
end % function
