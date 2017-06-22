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
    % 12 14
    % 13 14
    widgets{NAME} = dspGetLeafWidgetBase('text', this.Name, this.Name, 0.0);
    widgets{NAME}.ColSpan = [1.0 1.0];
    widgets{NAME}.Alignment = CENTER_ALIGN;
    % 17 19
    % 18 19
    widgets{MODE} = dspGetLeafWidgetBase('combobox', '', horzcat(this.Prefix, 'Mode'), this.controller, 'Mode');
    % 20 21
    widgets{MODE}.DialogRefresh = 1.0;
    widgets{MODE}.ColSpan = [2.0 2.0];
    widgets{MODE}.Entries = ctranspose(this.Entries(:));
    % 24 26
    % 25 26
    widgets{DTNAME} = dspGetLeafWidgetBase('edit', '', horzcat(this.prefix, 'DataTypeName'), this.controller);
    % 27 29
    % 28 29
    widgets{DTNAME}.ColSpan = [3.0 3.0];
    widgets{DTNAME}.Alignment = CENTER_ALIGN;
    % 31 33
    % 32 33
    if this.SupportsUnsigned
        signedText = sprintf('Same as\n   input');
    else
        signedText = 'yes';
    end % if
    widgets{SIGN} = dspGetLeafWidgetBase('text', signedText, horzcat(this.Prefix, 'Signed'), this.controller);
    % 39 41
    % 40 41
    widgets{SIGN}.ColSpan = [4.0 4.0];
    widgets{SIGN}.Alignment = CENTER_ALIGN;
    % 43 45
    % 44 45
    widgets{WL} = dspGetLeafWidgetBase('edit', '', horzcat(this.Prefix, 'WordLength'), this.controller, 'WordLength');
    % 46 47
    widgets{WL}.ColSpan = [5.0 5.0];
    % 48 51
    % 49 51
    % 50 51
    widgets{FL} = dspGetLeafWidgetBase('edit', '', horzcat(this.Prefix, 'FracLength'), this.controller, 'FracLength');
    % 52 53
    widgets{FL}.ColSpan = [6.0 6.0];
    % 54 57
    % 55 57
    % 56 57
    widgets{SLOPE} = dspGetLeafWidgetBase('edit', '', horzcat(this.Prefix, 'Slope'), 0.0);
    widgets{SLOPE}.Mode = 0.0;
    widgets{SLOPE}.ColSpan = [7.0 7.0];
    widgets{SLOPE}.ObjectMethod = 'updateFracLengthFromSlope';
    widgets{SLOPE}.MethodArgs = {'%value'};
    widgets{SLOPE}.ArgDataTypes = {'mxArray'};
    widgets{SLOPE}.Value = this.loadSlopeFromFracLength;
    widgets{SLOPE}.SaveState = 0.0;
    % 65 68
    % 66 68
    % 67 68
    widgets{BIAS} = dspGetLeafWidgetBase('text', '0', horzcat(this.Prefix, 'Bias'), 0.0);
    widgets{BIAS}.ColSpan = [8.0 8.0];
    widgets{BIAS}.Alignment = CENTER_ALIGN;
    % 71 73
    % 72 73
    widgets{NAME}.Visible = this.Visible;
    widgets{MODE}.Visible = this.Visible;
    % 75 76
    switch this.Mode
    case 'Binary point scaling'
        widgets{DTNAME}.Visible = 0.0;
        widgets{SIGN}.Visible = this.Visible;
        widgets{WL}.Visible = this.Visible;
        widgets{FL}.Visible = this.Visible;
        widgets{SLOPE}.Visible = 0.0;
        widgets{BIAS}.Visible = 0.0;
    case 'Slope and bias scaling'
        % 85 86
        widgets{DTNAME}.Visible = 0.0;
        widgets{SIGN}.Visible = this.Visible;
        widgets{WL}.Visible = this.Visible;
        widgets{FL}.Visible = 0.0;
        widgets{SLOPE}.Visible = this.Visible;
        widgets{BIAS}.Visible = this.Visible;
    otherwise
        % 93 95
        % 94 95
        widgets{DTNAME}.Visible = 0.0;
        widgets{SIGN}.Visible = 0.0;
        widgets{WL}.Visible = 0.0;
        widgets{FL}.Visible = 0.0;
        widgets{SLOPE}.Visible = 0.0;
        widgets{BIAS}.Visible = 0.0;
    end % switch
    % 102 103
    for i=1.0:length(widgets)
        widgets{i}.Source = this;
        widgets{i}.RowSpan = horzcat(this.Row, this.Row);
    end % for
end % function
