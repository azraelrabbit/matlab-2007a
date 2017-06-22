function dlgStruct = getDialogSchema(this, dummy_arg)
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
    run = dspGetLeafWidgetBase('checkbox', 'Running variance', 'run', this, 'run');
    run.RowSpan = [1.0 1.0];
    run.ColSpan = [1.0 1.0];
    run.DialogRefresh = 1.0;
    % 18 20
    % 19 20
    reset = dspGetLeafWidgetBase('combobox', 'Reset port:', 'reset_popup', this, 'reset_popup');
    % 21 22
    reset.RowSpan = [2.0 2.0];
    reset.ColSpan = [1.0 1.0];
    reset.Entries = transpose(set(this, 'reset'));
    % 25 26
    if this.run
        reset.Visible = 1.0;
    else
        reset.Visible = 0.0;
    end % if
    % 31 33
    % 32 33
    parametersGroup = dspGetContainerWidgetBase('group', 'Parameters', 'parametersGroup');
    parametersGroup.Items = dspTrimItemList(cellhorzcat(run, reset));
    parametersGroup.RowSpan = [1.0 1.0];
    parametersGroup.ColSpan = [1.0 1.0];
    parametersGroup.LayoutGrid = [2.0 1.0];
    parametersGroup.Tag = 'parametersGroup';
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    roiEnable = dspGetLeafWidgetBase('checkbox', 'Enable ROI processing', 'roiEnable', this, 'roiEnable');
    % 46 47
    roiEnable.RowSpan = [1.0 1.0];
    roiEnable.ColSpan = [1.0 1.0];
    roiEnable.DialogRefresh = 1.0;
    % 50 52
    % 51 52
    roiType = dspGetLeafWidgetBase('combobox', 'ROI type:', 'roiType', this, 'roiType');
    % 53 54
    roiType.Entries = ctranspose(set(this, 'roiType'));
    roiType.DialogRefresh = 1.0;
    roiType.ColSpan = [1.0 1.0];
    roiType.RowSpan = [2.0 2.0];
    % 58 60
    % 59 60
    roiPortion = dspGetLeafWidgetBase('combobox', 'ROI portion to process:', 'roiPortion', this, 'roiPortion');
    % 61 62
    roiPortion.Entries = ctranspose(set(this, 'roiPortion'));
    roiPortion.ColSpan = [1.0 1.0];
    roiPortion.RowSpan = [3.0 3.0];
    % 65 67
    % 66 67
    roiOutput = dspGetLeafWidgetBase('combobox', 'Output:', 'roiOutput', this, 'roiOutput');
    % 68 69
    roiOutput.Entries = ctranspose(set(this, 'roiOutput'));
    roiOutput.DialogRefresh = 1.0;
    roiOutput.ColSpan = [1.0 1.0];
    roiOutput.RowSpan = [4.0 4.0];
    % 73 75
    % 74 75
    if strncmp(this.roiType, 'Lab', 3.0)
        flagPrompt = 'Output flag indicating if input label numbers are valid';
    else
        flagPrompt = 'Output flag indicating if ROI is within image bounds';
    end % if
    % 80 81
    roiFlag = dspGetLeafWidgetBase('checkbox', flagPrompt, 'roiFlag', this, 'roiFlag');
    % 82 85
    % 83 85
    % 84 85
    roiFlag.ColSpan = [1.0 1.0];
    roiFlag.RowSpan = [5.0 5.0];
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    if this.roiEnable
        roiType.Visible = 1.0;
        % 93 94
        if strncmp(this.roiType, 'Rec', 3.0)
            roiPortion.Visible = 1.0;
        else
            roiPortion.Visible = 0.0;
        end % if
        % 99 100
        if strncmp(this.roiType, 'Bin', 3.0)
            roiOutput.Visible = 0.0;
            roiFlag.Visible = 0.0;
        else
            roiOutput.Visible = 1.0;
            roiFlag.Visible = 1.0;
        end % if
    else
        roiType.Visible = 0.0;
        roiPortion.Visible = 0.0;
        roiOutput.Visible = 0.0;
        roiFlag.Visible = 0.0;
    end % if
    % 113 115
    % 114 115
    roiGroup = dspGetContainerWidgetBase('group', 'ROI Processing', 'roiGroup');
    roiGroup.Items = dspTrimItemList(cellhorzcat(roiEnable, roiType, roiPortion, roiOutput, roiFlag));
    roiGroup.RowSpan = [2.0 2.0];
    roiGroup.ColSpan = [1.0 1.0];
    roiGroup.LayoutGrid = [5.0 1.0];
    roiGroup.Tag = 'roiGroup';
    % 121 122
    if this.run
        roiGroup.Visible = 0.0;
    else
        roiGroup.Visible = 1.0;
    end % if
    % 127 131
    % 128 131
    % 129 131
    % 130 131
    mainTabItems = cellhorzcat(parametersGroup, roiGroup);
    % 132 134
    % 133 134
    dlgStruct = this.getRootSchemaStruct({});
    % 135 137
    % 136 137
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{1.0}.Items = mainTabItems;
    % 138 144
    % 139 144
    % 140 144
    % 141 144
    % 142 144
    % 143 144
    if any(strcmp(this.Root.SimulationStatus, {'running','paused'}))
        % 145 146
        dlgStruct = this.disableNontunables(dlgStruct);
    end % if
    % 148 153
    % 149 153
    % 150 153
    % 151 153
    % 152 153
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{1.0}.LayoutGrid = [3.0 1.0];
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{1.0}.RowStretch = [0.0 0.0 1.0];
end % function
