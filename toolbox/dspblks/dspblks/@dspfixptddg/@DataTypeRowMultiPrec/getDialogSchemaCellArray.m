function widgets = getDialogSchemaCellArray(this, cols)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    [NAME, MODE, DTNAME, SIGN, WL, FL, SLOPE, BIAS] = deal(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
    CENTER_ALIGN = 5.0;
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    widgets{NAME} = dspGetLeafWidgetBase('text', this.Name, this.Name, this.Controller);
    % 19 22
    % 20 22
    % 21 22
    widgets{MODE} = dspGetLeafWidgetBase('combobox', '', horzcat(this.Prefix, 'Mode'), this.Controller, 'Mode');
    % 23 24
    widgets{MODE}.Entries = ctranspose(this.Entries(:));
    widgets{MODE}.DialogRefresh = 1.0;
    % 26 28
    % 27 28
    widgets{DTNAME} = dspGetLeafWidgetBase('edit', '', horzcat(this.prefix, 'DataTypeName'), this.Controller);
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    widgets{SIGN} = dspGetLeafWidgetBase('text', 'yes', horzcat(this.Prefix, 'Signed'), this.Controller);
    % 34 37
    % 35 37
    % 36 37
    widgets{WL} = dspGetLeafWidgetBase('edit', '', horzcat(this.Prefix, 'WordLength'), this.Controller, 'WordLength');
    % 38 41
    % 39 41
    % 40 41
    widgets{FL} = dspGetContainerWidgetBase('panel', '', horzcat(this.Prefix, 'FracLengthPanel'));
    % 42 43
    widgets{FL}.LayoutGrid = [1.0 2.0];
    % 44 46
    % 45 46
    widgets{SLOPE} = dspGetContainerWidgetBase('panel', '', horzcat(this.Prefix, 'SlopePanel'));
    % 47 48
    widgets{SLOPE}.LayoutGrid = [1.0 2.0];
    % 49 51
    % 50 51
    widgets{BIAS} = dspGetLeafWidgetBase('text', '0', horzcat(this.Prefix, 'Bias'), this.Controller);
    % 52 55
    % 53 55
    % 54 55
    widgets{NAME}.Visible = this.Visible;
    widgets{MODE}.Visible = this.Visible;
    % 57 58
    switch this.Mode
    case 'Specify word length'
        widgets{DTNAME}.Visible = 0.0;
        widgets{SIGN}.Visible = this.Visible;
        widgets{WL}.Visible = this.Visible;
        widgets{WL}.DialogRefresh = 1.0;
        fracPanelVisibility = 0.0;
        slopePanelVisibility = 0.0;
        widgets{BIAS}.Visible = 0.0;
    case 'Binary point scaling'
        % 68 69
        widgets{DTNAME}.Visible = 0.0;
        widgets{SIGN}.Visible = this.Visible;
        widgets{WL}.Visible = this.Visible;
        fracPanelVisibility = this.Visible;
        slopePanelVisibility = 0.0;
        widgets{BIAS}.Visible = 0.0;
    case 'Slope and bias scaling'
        % 76 77
        widgets{DTNAME}.Visible = 0.0;
        widgets{SIGN}.Visible = this.Visible;
        widgets{WL}.Visible = this.Visible;
        fracPanelVisibility = 0.0;
        slopePanelVisibility = this.Visible;
        widgets{BIAS}.Visible = this.Visible;
    otherwise
        % 84 87
        % 85 87
        % 86 87
        widgets{DTNAME}.Visible = 0.0;
        widgets{SIGN}.Visible = 0.0;
        widgets{WL}.Visible = 0.0;
        fracPanelVisibility = 0.0;
        slopePanelVisibility = 0.0;
        widgets{BIAS}.Visible = 0.0;
        % 93 94
    end % switch
    % 95 96
    widgets{FL}.Items = this.createFracLengthPanel(fracPanelVisibility);
    widgets{SLOPE}.Items = this.createSlopePanel(slopePanelVisibility);
    % 98 100
    % 99 100
    widgets{NAME}.ColSpan = [1.0 1.0];
    widgets{MODE}.ColSpan = [2.0 2.0];
    widgets{DTNAME}.ColSpan = [3.0 3.0];
    widgets{SIGN}.ColSpan = [4.0 4.0];
    widgets{WL}.ColSpan = [5.0 5.0];
    widgets{FL}.ColSpan = [6.0 6.0];
    widgets{SLOPE}.ColSpan = [7.0 7.0];
    widgets{BIAS}.ColSpan = [8.0 8.0];
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    % 113 114
    widgets{NAME}.Alignment = CENTER_ALIGN;
    widgets{DTNAME}.Alignment = CENTER_ALIGN;
    widgets{SIGN}.Alignment = CENTER_ALIGN;
    widgets{BIAS}.Alignment = CENTER_ALIGN;
    % 118 119
    for i=1.0:length(widgets)
        widgets{i}.Source = this;
        widgets{i}.RowSpan = horzcat(this.Row, this.Row);
    end % for
end % function
