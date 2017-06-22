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
    % 14 15
    rspan = 1.0;
    FileName = dspGetLeafWidgetBase('edit', 'File name:', 'FileName', this, 'FileName');
    % 17 18
    FileName.Entries = ctranspose(set(this, 'FileName'));
    FileName.RowSpan = horzcat(rspan, rspan);
    FileName.ColSpan = [1.0 3.0];
    % 21 22
    blkbutton = dspGetContainerWidgetBase('pushbutton', 'Browse...', 'FileSelect');
    % 23 24
    blkbutton.ObjectMethod = 'FileSelect';
    blkbutton.MethodArgs = {'%dialog'};
    blkbutton.ArgDataTypes = {'handle'};
    blkbutton.RowSpan = horzcat(rspan, rspan);
    blkbutton.ColSpan = [4.0 4.0];
    blkbutton.MinimumSize = [50.0 20.0];
    % 30 31
    maxcol = 4.0;
    % 32 33
    rspan = plus(rspan, 1.0);
    VideoFormat = dspGetLeafWidgetBase('combobox', 'Video format:', 'VideoFormat', this, 'VideoFormat');
    % 35 36
    VideoFormat.Entries = ctranspose(set(this, 'VideoFormat'));
    VideoFormat.RowSpan = horzcat(rspan, rspan);
    VideoFormat.ColSpan = horzcat(1.0, maxcol);
    VideoFormat.DialogRefresh = 1.0;
    % 40 41
    custom = false;
    if strcmp(this.VideoFormat, 'Custom')
        custom = true;
    end % if
    % 45 46
    rspan = plus(rspan, 1.0);
    FourCCURL.Type = 'hyperlink';
    FourCCURL.Name = 'Four character code:';
    FourCCURL.Entries = {'http://www.fourcc.org'};
    FourCCURL.Tag = 'fourcc';
    FourCCURL.ToolTip = 'http://www.fourcc.org';
    FourCCURL.Mode = 1.0;
    FourCCURL.RowSpan = [1.0 1.0];
    FourCCURL.ColSpan = [1.0 1.0];
    FourCCURL.MatlabMethod = 'web';
    FourCCURL.MatlabArgs = {'http://www.fourcc.org','-browser'};
    FourCCURL.Visible = not(custom);
    % 58 59
    FourCC = dspGetLeafWidgetBase('combobox', '', 'FOURCC', this, 'FOURCC');
    % 60 61
    FourCC.Entries = ctranspose(set(this, 'FOURCC'));
    FourCC.RowSpan = [1.0 1.0];
    FourCC.ColSpan = horzcat(2.0, maxcol);
    FourCC.Visible = not(custom);
    % 65 66
    FourCCpane = dspGetContainerWidgetBase('panel', 'FourCCpane', 'FourCCpane');
    FourCCpane.Items = cellhorzcat(FourCCURL, FourCC);
    FourCCpane.RowSpan = horzcat(rspan, rspan);
    FourCCpane.ColSpan = horzcat(1.0, maxcol);
    FourCCpane.LayoutGrid = horzcat(1.0, maxcol);
    FourCCpane.Visible = not(custom);
    FourCCpane.ColStretch = [0.0 1.0 1.0 1.0];
    % 73 75
    % 74 75
    rspan = plus(rspan, 1.0);
    BitStreamFormat = dspGetLeafWidgetBase('combobox', 'Bit stream format:', 'BitStreamFormat', this, 'BitStreamFormat');
    % 77 78
    BitStreamFormat.Entries = ctranspose(set(this, 'BitStreamFormat'));
    BitStreamFormat.RowSpan = horzcat(rspan, rspan);
    BitStreamFormat.ColSpan = horzcat(1.0, maxcol);
    BitStreamFormat.DialogRefresh = 1.0;
    BitStreamFormat.Visible = custom;
    isplanar = strcmp(this.BitStreamFormat, 'Planar');
    % 84 85
    rspan = plus(rspan, 1.0);
    NumInputs = dspGetLeafWidgetBase('combobox', 'Number of input components:', 'NumInputs', this, 'NumInputs');
    % 87 88
    NumInputs.Entries = ctranspose(set(this, 'NumInputs'));
    NumInputs.RowSpan = horzcat(rspan, rspan);
    NumInputs.ColSpan = horzcat(1.0, maxcol);
    NumInputs.DialogRefresh = 1.0;
    NumInputs.Visible = custom;
    % 93 94
    rspan = plus(rspan, 1.0);
    InheritBits = dspGetLeafWidgetBase('checkbox', 'Inherit size of components from input data type', 'InheritBits', this, 'InheritBits');
    % 96 98
    % 97 98
    InheritBits.Entries = ctranspose(set(this, 'InheritBits'));
    InheritBits.RowSpan = horzcat(rspan, rspan);
    InheritBits.ColSpan = horzcat(1.0, maxcol);
    InheritBits.DialogRefresh = 1.0;
    InheritBits.Visible = custom;
    % 103 104
    numinputs = str2num(this.NumInputs);
    % 105 106
    ComponentPrompt = {'Component 1:','Component 2:','Component 3:','Component 4:'};
    % 107 111
    % 108 111
    % 109 111
    % 110 111
    ComponentName = {'Component1','Component2','Component3','Component4'};
    % 112 117
    % 113 117
    % 114 117
    % 115 117
    % 116 117
    NumBitsName = {'Bits1','Bits2','Bits3','Bits4'};
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    % 122 123
    for i=1.0:4.0
        Components{i} = dspGetLeafWidgetBase('edit', ComponentPrompt{i}, ComponentName{i}, this, ComponentName{i});
        % 125 126
        Components{i}.Entries = ctranspose(set(this, ComponentName{i}));
        Components{i}.RowSpan = horzcat(i, i);
        Components{i}.ColSpan = [1.0 2.0];
        Components{i}.Alignment = 1.0;
        % 130 131
        NumBits{i} = dspGetLeafWidgetBase('edit', 'Bits:', NumBitsName{i}, this, NumBitsName{i});
        % 132 133
        NumBits{i}.Entries = ctranspose(set(this, NumBitsName{i}));
        NumBits{i}.RowSpan = horzcat(i, i);
        NumBits{i}.ColSpan = [3.0 4.0];
        NumBits{i}.Visible = and(not(this.InheritBits), custom);
        % 137 138
        if lt(numinputs, i) || not(custom)
            Components{i}.Visible = false;
            NumBits{i}.Visible = false;
        end % if
    end % for
    % 143 144
    rspan = plus(rspan, 1.0);
    % 145 146
    Componentsall = dspGetContainerWidgetBase('panel', 'Components', 'Componentsall');
    Componentsall.Items = cellhorzcat(Components{:}, NumBits{:});
    Componentsall.RowSpan = horzcat(rspan, rspan);
    Componentsall.ColSpan = horzcat(1.0, maxcol);
    Componentsall.LayoutGrid = horzcat(i, 2.0);
    % 151 152
    rspan = plus(plus(rspan, i), 1.0);
    Componentorder = dspGetLeafWidgetBase('edit', 'Component order in binary file:', 'ComponentOrder', this, 'ComponentOrder');
    % 154 156
    % 155 156
    Componentorder.Entries = ctranspose(set(this, 'ComponentOrder'));
    Componentorder.RowSpan = horzcat(rspan, rspan);
    Componentorder.ColSpan = horzcat(1.0, maxcol);
    Componentorder.Visible = custom;
    % 160 161
    rspan = plus(rspan, 1.0);
    Interlaced = dspGetLeafWidgetBase('checkbox', 'Interlaced video', 'Interlaced', this, 'Interlaced');
    % 163 164
    Interlaced.Entries = ctranspose(set(this, 'Interlaced'));
    Interlaced.RowSpan = horzcat(rspan, rspan);
    Interlaced.ColSpan = horzcat(1.0, maxcol);
    Interlaced.Visible = custom;
    % 168 169
    rspan = plus(rspan, 1.0);
    LineOrdering = dspGetLeafWidgetBase('combobox', 'Line ordering:', 'LineOrdering', this, 'LineOrdering');
    % 171 172
    LineOrdering.Entries = ctranspose(set(this, 'LineOrdering'));
    LineOrdering.RowSpan = horzcat(rspan, rspan);
    LineOrdering.ColSpan = horzcat(1.0, maxcol);
    % 175 176
    rspan = plus(rspan, 1.0);
    Signed = dspGetLeafWidgetBase('checkbox', 'Write signed data to output file', 'SignedInput', this, 'SignedInput');
    % 178 179
    Signed.Entries = ctranspose(set(this, 'SignedInput'));
    Signed.RowSpan = horzcat(rspan, rspan);
    Signed.ColSpan = horzcat(1.0, maxcol);
    Signed.Visible = custom;
    % 183 184
    rspan = plus(rspan, 1.0);
    FileEndian = dspGetLeafWidgetBase('combobox', 'Byte order in binary file:', 'FileEndian', this, 'FileEndian');
    % 186 187
    FileEndian.Entries = ctranspose(set(this, 'FileEndian'));
    FileEndian.RowSpan = horzcat(rspan, rspan);
    FileEndian.ColSpan = horzcat(1.0, maxcol);
    FileEndian.Visible = custom;
    % 191 197
    % 192 197
    % 193 197
    % 194 197
    % 195 197
    % 196 197
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = cellhorzcat(FileName, blkbutton, VideoFormat, FourCCpane, BitStreamFormat, NumInputs, InheritBits, Componentsall, Componentorder, Interlaced, LineOrdering, Signed, FileEndian);
    % 199 202
    % 200 202
    % 201 202
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    parameterPane.LayoutGrid = horzcat(rspan, maxcol);
    parameterPane.ColStretch = zeros(1.0, maxcol);
    parameterPane.ColStretch(1.0) = 1.0;
    parameterPane.Tag = 'parameterPane';
    % 208 213
    % 209 213
    % 210 213
    % 211 213
    % 212 213
    dlgStruct = this.getBaseSchemaStruct(parameterPane);
end % function
