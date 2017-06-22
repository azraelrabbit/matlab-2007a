function dlgStruct = getDialogSchema(this, dummy)
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
    InputTypeMenu = dspGetLeafWidgetBase('combobox', 'Image format:', 'inputType', this, 'inputType');
    % 15 16
    InputTypeMenu.Entries = ctranspose(set(this, 'inputType'));
    InputTypeMenu.RowSpan = [1.0 1.0];
    InputTypeMenu.ColSpan = [1.0 1.0];
    InputTypeMenu.DialogRefresh = 1.0;
    % 20 21
    imagePortsMenu = dspGetLeafWidgetBase('combobox', 'Image signal:', 'imagePorts', this, 'imagePorts');
    % 22 23
    imagePortsMenu.Entries = ctranspose(set(this, 'imagePorts'));
    imagePortsMenu.RowSpan = [1.0 1.0];
    imagePortsMenu.ColSpan = [1.0 2.0];
    imagePortsMenu.DialogRefresh = 1.0;
    % 27 28
    UseColorMapCheck = dspGetLeafWidgetBase('checkbox', 'Use colormap', 'useColorMap', this, 'useColorMap');
    % 29 30
    UseColorMapCheck.RowSpan = [2.0 2.0];
    UseColorMapCheck.ColSpan = [1.0 2.0];
    UseColorMapCheck.DialogRefresh = 1.0;
    % 33 34
    indent1 = dspGetLeafWidgetBase('text', ' ', 'indent1', 0.0);
    indent1.MinimumSize = [24.0 0.0];
    indent1.MaximumSize = [24.0 24.0];
    indent1.RowSpan = [3.0 3.0];
    indent1.ColSpan = [1.0 1.0];
    % 39 40
    ColorMapEdit = dspGetLeafWidgetBase('edit', 'Colormap:', 'colormapValue', this, 'colormapValue');
    % 41 42
    ColorMapEdit.Entries = ctranspose(set(this, 'colormapValue'));
    ColorMapEdit.RowSpan = [3.0 3.0];
    ColorMapEdit.ColSpan = [2.0 2.0];
    % 45 46
    SpecRangeCheck = dspGetLeafWidgetBase('checkbox', 'Specify range of values', 'specRange', this, 'specRange');
    % 47 48
    SpecRangeCheck.RowSpan = [4.0 4.0];
    SpecRangeCheck.ColSpan = [1.0 2.0];
    SpecRangeCheck.DialogRefresh = 1.0;
    % 51 52
    indent2 = dspGetLeafWidgetBase('text', ' ', 'indent2', 0.0);
    indent2.MinimumSize = [24.0 0.0];
    indent2.MaximumSize = [24.0 24.0];
    indent2.RowSpan = [5.0 5.0];
    indent2.ColSpan = [1.0 1.0];
    % 57 58
    MinInputValEdit = dspGetLeafWidgetBase('edit', 'Minimum input value:', 'minInputVal', this, 'minInputVal');
    % 59 60
    MinInputValEdit.Entries = ctranspose(set(this, 'minInputVal'));
    MinInputValEdit.RowSpan = [5.0 5.0];
    MinInputValEdit.ColSpan = [2.0 2.0];
    % 63 64
    indent3 = dspGetLeafWidgetBase('text', ' ', 'indent3', 0.0);
    indent3.MinimumSize = [24.0 0.0];
    indent3.MaximumSize = [24.0 24.0];
    indent3.RowSpan = [6.0 6.0];
    indent3.ColSpan = [1.0 1.0];
    % 69 70
    MaxInputValEdit = dspGetLeafWidgetBase('edit', 'Maximum input value:', 'maxInputVal', this, 'maxInputVal');
    % 71 72
    MaxInputValEdit.Entries = ctranspose(set(this, 'maxInputVal'));
    MaxInputValEdit.RowSpan = [6.0 6.0];
    MaxInputValEdit.ColSpan = [2.0 2.0];
    % 75 76
    FigPosEdit = dspGetLeafWidgetBase('edit', 'Figure position:', 'FigPos', this, 'FigPos');
    % 77 78
    FigPosEdit.Entries = ctranspose(set(this, 'FigPos'));
    FigPosEdit.RowSpan = [7.0 7.0];
    FigPosEdit.ColSpan = [1.0 2.0];
    FigPosEdit.Visible = 0.0;
    % 82 83
    AxisZoomCheck = dspGetLeafWidgetBase('checkbox', 'Axis Zoom', 'AxisZoom', this, 'AxisZoom');
    % 84 85
    AxisZoomCheck.RowSpan = [8.0 8.0];
    AxisZoomCheck.ColSpan = [1.0 2.0];
    AxisZoomCheck.DialogRefresh = 1.0;
    AxisZoomCheck.Visible = 0.0;
    % 89 90
    TrueSizedOnceCheck = dspGetLeafWidgetBase('checkbox', 'True sized once', 'trueSizedOnce', this, 'trueSizedOnce');
    % 91 92
    TrueSizedOnceCheck.RowSpan = [9.0 9.0];
    TrueSizedOnceCheck.ColSpan = [1.0 2.0];
    TrueSizedOnceCheck.DialogRefresh = 1.0;
    TrueSizedOnceCheck.Visible = 0.0;
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    % 100 101
    if not(strcmp(this.inputType, 'Obsolete'))
        if strcmp(this.inputType, 'Intensity')
            this.imagePorts = 'One multidimensional signal';
        else
            this.imagePorts = 'Separate color signals';
        end % if
        % 107 108
        this.inputType = 'Obsolete';
    end % if
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    % 114 115
    InputTypeMenu.Visible = 0.0;
    imagePortsMenu.Visible = 1.0;
    UseColorMapCheck.Visible = 0.0;
    SpecRangeCheck.Visible = 0.0;
    indent1.Visible = 0.0;
    ColorMapEdit.Visible = 0.0;
    indent2.Visible = 0.0;
    MinInputValEdit.Visible = 0.0;
    indent3.Visible = 0.0;
    MaxInputValEdit.Visible = 0.0;
    % 125 126
    if strcmp(this.imagePorts, 'One multidimensional signal')
        UseColorMapCheck.Visible = 1.0;
        SpecRangeCheck.Visible = 1.0;
        % 129 130
        if this.UseColorMap
            indent1.Visible = 1.0;
            ColorMapEdit.Visible = 1.0;
        end % if
        % 134 135
        if this.SpecRange
            indent2.Visible = 1.0;
            MinInputValEdit.Visible = 1.0;
            indent3.Visible = 1.0;
            MaxInputValEdit.Visible = 1.0;
        end % if
    end % if
    % 142 149
    % 143 149
    % 144 149
    % 145 149
    % 146 149
    % 147 149
    % 148 149
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = dspTrimItemList(cellhorzcat(InputTypeMenu, imagePortsMenu, UseColorMapCheck, indent1, ColorMapEdit, SpecRangeCheck, indent2, MinInputValEdit, indent3, MaxInputValEdit, FigPosEdit, AxisZoomCheck, TrueSizedOnceCheck));
    % 151 154
    % 152 154
    % 153 154
    parameterPane.RowSpan = [2.0 9.0];
    parameterPane.ColSpan = [1.0 1.0];
    parameterPane.LayoutGrid = [1.0 1.0];
    parameterPane.Tag = 'parameterPane';
    % 158 163
    % 159 163
    % 160 163
    % 161 163
    % 162 163
    dlgStruct = this.getBaseSchemaStruct(parameterPane);
end % function
