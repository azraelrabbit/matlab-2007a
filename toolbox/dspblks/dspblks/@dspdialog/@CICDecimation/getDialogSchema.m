function dlgStruct = getDialogSchema(this, name)
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
    MFILT_MODE = 1.0;
    blkh = this.Block.Handle;
    mask_enables = get_param(blkh, 'MaskEnables');
    old_mask_enables = mask_enables;
    % 16 18
    [filtobjEditBox, decimationFactorEditBox, differentialDelayEditBox, numSectionsEditBox, filterInternalsPopup, BPSEditBox, FLPSEditBox, outputWordLengthEditBox, outputFracLengthEditBox] = deal(2.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0);
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    filterSourcePane = dspGetContainerWidgetBase('panel', '', 'filterSourcePane');
    % 23 25
    FilterSource = dspGetLeafWidgetBase('radiobutton', 'Coefficient source', 'filtFrom', this, 'FilterSource');
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    FilterSource.Entries = {'Dialog parameters','Multirate filter object (MFILT)'};
    % 30 32
    FilterSource.DialogRefresh = 1.0;
    % 32 34
    filterSourcePane.Items = cellhorzcat(FilterSource);
    filterSourcePane.RowSpan = [2.0 2.0];
    filterSourcePane.ColSpan = [1.0 1.0];
    % 36 38
    FVToolButtonEnabled = false;
    % 38 41
    % 39 41
    paramsPane = dspGetContainerWidgetBase('group', 'Parameters', 'mainPane');
    paramsPane.RowSpan = [3.0 3.0];
    if eq(this.FilterSource, MFILT_MODE)
        % 43 45
        mask_enables{filtobjEditBox} = 'on';
        mask_enables{decimationFactorEditBox} = 'off';
        mask_enables{differentialDelayEditBox} = 'off';
        mask_enables{numSectionsEditBox} = 'off';
        mask_enables{filterInternalsPopup} = 'off';
        mask_enables{BPSEditBox} = 'off';
        mask_enables{FLPSEditBox} = 'off';
        mask_enables{outputWordLengthEditBox} = 'off';
        mask_enables{outputFracLengthEditBox} = 'off';
        % 53 55
        if isfield(this.Block.UserData, 'filter')
            FVToolButtonEnabled = true;
        end
        % 57 59
        mfiltObjectName = dspGetLeafWidgetBase('edit', 'Multirate filter variable:', 'filtobj', this, 'mfiltObjectName');
        % 59 63
        % 60 63
        % 61 63
        mfiltObjectName.DialogRefresh = 1.0;
        paramsPane.Items = cellhorzcat(mfiltObjectName);
    else
        % 65 68
        % 66 68
        mask_enables{filtobjEditBox} = 'off';
        mask_enables{decimationFactorEditBox} = 'on';
        mask_enables{differentialDelayEditBox} = 'on';
        mask_enables{numSectionsEditBox} = 'on';
        mask_enables{filterInternalsPopup} = 'on';
        mask_enables{BPSEditBox} = 'on';
        mask_enables{FLPSEditBox} = 'on';
        mask_enables{outputWordLengthEditBox} = 'on';
        mask_enables{outputFracLengthEditBox} = 'on';
        % 76 78
        if isfield(this.Block.UserData, 'filterConstructor')
            FVToolButtonEnabled = true;
        end
        % 80 82
        FilterStructure = dspGetLeafWidgetBase('combobox', 'Filter structure:', 'ftype', this, 'FilterStructure');
        % 82 86
        % 83 86
        % 84 86
        FilterStructure.Entries = ctranspose(set(this, 'FilterStructure'));
        % 86 89
        % 87 89
        DecimationFactor = dspGetLeafWidgetBase('edit', 'Decimation factor (R):', 'R', this, 'DecimationFactor');
        % 89 93
        % 90 93
        % 91 93
        DifferentialDelay = dspGetLeafWidgetBase('edit', 'Differential delay (M):', 'M', this, 'DifferentialDelay');
        % 93 97
        % 94 97
        % 95 97
        NumberOfSections = dspGetLeafWidgetBase('edit', 'Number of sections (N):', 'N', this, 'NumberOfSections');
        % 97 101
        % 98 101
        % 99 101
        FilterInternals = dspGetLeafWidgetBase('combobox', 'Data type specification mode:', 'filterInternals', this, 'FilterInternals');
        % 101 105
        % 102 105
        % 103 105
        FilterInternals.Entries = ctranspose(set(this, 'FilterInternals'));
        FilterInternals.DialogRefresh = 1.0;
        % 106 109
        % 107 109
        SectionWordLengths = dspGetLeafWidgetBase('edit', 'Section word lengths:', 'BPS', this, 'SectionWordLengths');
        % 109 114
        % 110 114
        % 111 114
        % 112 114
        SectionFracLengths = dspGetLeafWidgetBase('edit', 'Section fraction lengths:', 'FLPS', this, 'SectionFracLengths');
        % 114 119
        % 115 119
        % 116 119
        % 117 119
        OutputWordLength = dspGetLeafWidgetBase('edit', 'Output word length:', 'outputWordLength', this, 'OutputWordLength');
        % 119 124
        % 120 124
        % 121 124
        % 122 124
        OutputFracLength = dspGetLeafWidgetBase('edit', 'Output fraction length:', 'outputFracLength', this, 'OutputFracLength');
        % 124 128
        % 125 128
        % 126 128
        SectionWordLengths.Visible = 1.0;
        SectionFracLengths.Visible = 1.0;
        OutputWordLength.Visible = 1.0;
        OutputFracLength.Visible = 1.0;
        % 131 133
        if strcmpi(this.FilterInternals, 'Full precision')
            SectionWordLengths.Visible = 0.0;
            SectionFracLengths.Visible = 0.0;
            OutputWordLength.Visible = 0.0;
            OutputFracLength.Visible = 0.0;
        else
            if strcmpi(this.FilterInternals, 'Minimum section word lengths')
                SectionWordLengths.Visible = 0.0;
                SectionFracLengths.Visible = 0.0;
                OutputFracLength.Visible = 0.0;
            else
                if strcmpi(this.FilterInternals, 'Specify word lengths')
                    SectionFracLengths.Visible = 0.0;
                    OutputFracLength.Visible = 0.0;
                end
            end
        end
        paramsPane.Items = cellhorzcat(FilterStructure, DecimationFactor, DifferentialDelay, NumberOfSections, FilterInternals, SectionWordLengths, SectionFracLengths, OutputWordLength, OutputFracLength);
        % 150 159
        % 151 159
        % 152 159
        % 153 159
        % 154 159
        % 155 159
        % 156 159
        % 157 159
    end
    % 159 164
    % 160 164
    % 161 164
    % 162 164
    fdtbxexists = false;
    if isfdtbxinstalled
        fdtbxexists = true;
    end
    fixptexists = false;
    if isfixptinstalled
        fixptexists = true;
    end
    % 171 174
    % 172 174
    if fixptexists && fdtbxexists
        fvToolButton = dspGetLeafWidgetBase('pushbutton', 'View Filter Response', 'fvToolButton', 0.0);
        % 175 178
        % 176 178
        fvToolButton.ToolTip = 'Launches FVTool to inspect the frequency response of the specified filter.';
        % 178 180
        fvToolButton.Alignment = 4.0;
        fvToolButton.ColSpan = [1.0 1.0];
        fvToolButton.MatlabMethod = 'dspLinkFVTool2Mask';
        fvToolButton.MatlabArgs = cellhorzcat(this.Block.Handle, 'create');
        % 183 185
        fvToolButton.Enabled = FVToolButtonEnabled;
        % 185 187
        openDialogs = this.getOpenDialogs;
        if not(isempty(openDialogs))
            if openDialogs{1.0}.hasUnappliedChanges
                fvToolButton.Enabled = 0.0;
            end
        end
        % 192 194
        buttonPanel = dspGetContainerWidgetBase('panel', 'Buttons', 'buttonPanel');
        buttonPanel.LayoutGrid = [1.0 3.0];
        buttonPanel.Items = cellhorzcat(fvToolButton);
        % 196 198
        paramsPane.Items{plus(end, 1.0)} = buttonPanel;
    end
    % 199 201
    dlgStruct = getBaseSchemaStruct(this, paramsPane, this.Block.MaskDescription, filterSourcePane);
    % 201 205
    % 202 205
    % 203 205
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end
end
