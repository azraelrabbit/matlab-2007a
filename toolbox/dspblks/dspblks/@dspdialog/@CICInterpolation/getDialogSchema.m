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
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    filterSourcePane = dspGetContainerWidgetBase('panel', '', 'filterSourcePane');
    % 24 26
    FilterSource = dspGetLeafWidgetBase('radiobutton', 'Coefficient source', 'filtFrom', this, 'FilterSource');
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    FilterSource.Entries = {'Dialog parameters','Multirate filter object (MFILT)'};
    % 31 33
    FilterSource.DialogRefresh = 1.0;
    % 33 35
    filterSourcePane.Items = cellhorzcat(FilterSource);
    filterSourcePane.RowSpan = [2.0 2.0];
    filterSourcePane.ColSpan = [1.0 1.0];
    % 37 39
    FVToolButtonEnabled = false;
    % 39 42
    % 40 42
    paramsPane = dspGetContainerWidgetBase('group', 'Parameters', 'mainPane');
    paramsPane.RowSpan = [3.0 3.0];
    if eq(this.FilterSource, MFILT_MODE)
        % 44 46
        mask_enables{filtobjEditBox} = 'on';
        mask_enables{decimationFactorEditBox} = 'off';
        mask_enables{differentialDelayEditBox} = 'off';
        mask_enables{numSectionsEditBox} = 'off';
        mask_enables{filterInternalsPopup} = 'off';
        mask_enables{BPSEditBox} = 'off';
        mask_enables{FLPSEditBox} = 'off';
        mask_enables{outputWordLengthEditBox} = 'off';
        mask_enables{outputFracLengthEditBox} = 'off';
        % 54 56
        if isfield(this.Block.UserData, 'filter')
            FVToolButtonEnabled = true;
        end
        % 58 60
        mfiltObjectName = dspGetLeafWidgetBase('edit', 'Multirate filter variable:', 'filtobj', this, 'mfiltObjectName');
        % 60 64
        % 61 64
        % 62 64
        mfiltObjectName.DialogRefresh = 1.0;
        paramsPane.Items = cellhorzcat(mfiltObjectName);
    else
        % 66 69
        % 67 69
        mask_enables{filtobjEditBox} = 'off';
        mask_enables{decimationFactorEditBox} = 'on';
        mask_enables{differentialDelayEditBox} = 'on';
        mask_enables{numSectionsEditBox} = 'on';
        mask_enables{filterInternalsPopup} = 'on';
        mask_enables{BPSEditBox} = 'on';
        mask_enables{FLPSEditBox} = 'on';
        mask_enables{outputWordLengthEditBox} = 'on';
        mask_enables{outputFracLengthEditBox} = 'on';
        % 77 79
        if isfield(this.Block.UserData, 'filterConstructor')
            FVToolButtonEnabled = true;
        end
        % 81 83
        FilterStructure = dspGetLeafWidgetBase('combobox', 'Filter structure:', 'ftype', this, 'FilterStructure');
        % 83 87
        % 84 87
        % 85 87
        FilterStructure.Entries = ctranspose(set(this, 'FilterStructure'));
        % 87 90
        % 88 90
        InterpolationFactor = dspGetLeafWidgetBase('edit', 'Interpolation factor (R):', 'R', this, 'InterpolationFactor');
        % 90 94
        % 91 94
        % 92 94
        DifferentialDelay = dspGetLeafWidgetBase('edit', 'Differential delay (M):', 'M', this, 'DifferentialDelay');
        % 94 98
        % 95 98
        % 96 98
        NumberOfSections = dspGetLeafWidgetBase('edit', 'Number of sections (N):', 'N', this, 'NumberOfSections');
        % 98 102
        % 99 102
        % 100 102
        FilterInternals = dspGetLeafWidgetBase('combobox', 'Data type specification mode:', 'filterInternals', this, 'FilterInternals');
        % 102 106
        % 103 106
        % 104 106
        FilterInternals.Entries = ctranspose(set(this, 'FilterInternals'));
        FilterInternals.DialogRefresh = 1.0;
        % 107 110
        % 108 110
        SectionWordLengths = dspGetLeafWidgetBase('edit', 'Section word lengths:', 'BPS', this, 'SectionWordLengths');
        % 110 115
        % 111 115
        % 112 115
        % 113 115
        SectionFracLengths = dspGetLeafWidgetBase('edit', 'Section fraction lengths:', 'FLPS', this, 'SectionFracLengths');
        % 115 121
        % 116 121
        % 117 121
        % 118 121
        % 119 121
        OutputWordLength = dspGetLeafWidgetBase('edit', 'Output word length:', 'outputWordLength', this, 'OutputWordLength');
        % 121 126
        % 122 126
        % 123 126
        % 124 126
        OutputFracLength = dspGetLeafWidgetBase('edit', 'Output fraction length:', 'outputFracLength', this, 'OutputFracLength');
        % 126 130
        % 127 130
        % 128 130
        SectionWordLengths.Visible = 1.0;
        SectionFracLengths.Visible = 1.0;
        OutputWordLength.Visible = 1.0;
        OutputFracLength.Visible = 1.0;
        % 133 135
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
        paramsPane.Items = cellhorzcat(FilterStructure, InterpolationFactor, DifferentialDelay, NumberOfSections, FilterInternals, SectionWordLengths, SectionFracLengths, OutputWordLength, OutputFracLength);
        % 152 161
        % 153 161
        % 154 161
        % 155 161
        % 156 161
        % 157 161
        % 158 161
        % 159 161
    end
    % 161 164
    % 162 164
    FramingMode = dspGetLeafWidgetBase('combobox', 'Framing:', 'framing', this, 'FramingMode');
    % 164 168
    % 165 168
    % 166 168
    FramingMode.Entries = ctranspose(set(this, 'FramingMode'));
    % 168 170
    paramsPane.Items{plus(end, 1.0)} = FramingMode;
    % 170 175
    % 171 175
    % 172 175
    % 173 175
    fdtbxexists = false;
    if isfdtbxinstalled
        fdtbxexists = true;
    end
    fixptexists = false;
    if isfixptinstalled
        fixptexists = true;
    end
    % 182 185
    % 183 185
    if fixptexists && fdtbxexists
        fvToolButton = dspGetLeafWidgetBase('pushbutton', 'View Filter Response', 'fvToolButton', 0.0);
        % 186 189
        % 187 189
        fvToolButton.ToolTip = 'Launches FVTool to inspect the frequency response of the specified filter.';
        % 189 191
        fvToolButton.Alignment = 4.0;
        fvToolButton.ColSpan = [1.0 1.0];
        fvToolButton.MatlabMethod = 'dspLinkFVTool2Mask';
        fvToolButton.MatlabArgs = cellhorzcat(this.Block.Handle, 'create');
        % 194 196
        fvToolButton.Enabled = FVToolButtonEnabled;
        % 196 198
        openDialogs = this.getOpenDialogs;
        if not(isempty(openDialogs))
            if openDialogs{1.0}.hasUnappliedChanges
                fvToolButton.Enabled = 0.0;
            end
        end
        % 203 205
        buttonPanel = dspGetContainerWidgetBase('panel', 'Buttons', 'buttonPanel');
        buttonPanel.LayoutGrid = [1.0 3.0];
        buttonPanel.Items = cellhorzcat(fvToolButton);
        % 207 209
        paramsPane.Items{plus(end, 1.0)} = buttonPanel;
    end
    % 210 212
    dlgStruct = getBaseSchemaStruct(this, paramsPane, this.Block.MaskDescription, filterSourcePane);
    % 212 216
    % 213 216
    % 214 216
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end
end
