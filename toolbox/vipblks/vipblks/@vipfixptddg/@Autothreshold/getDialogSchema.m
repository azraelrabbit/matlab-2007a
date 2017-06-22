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
    operator = dspGetLeafWidgetBase('combobox', 'Thresholding operator:', 'operator', this, 'operator');
    method.Entries = ctranspose(set(this, 'operator'));
    % 17 19
    % 18 19
    threshOut = dspGetLeafWidgetBase('checkbox', 'Output threshold', 'threshOut', this, 'threshOut');
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    effMetricOut = dspGetLeafWidgetBase('checkbox', 'Output effectiveness metric', 'effMetricOut', this, 'effMetricOut');
    % 25 28
    % 26 28
    % 27 28
    effMetricOut.DialogRefresh = 1.0;
    if this.effMetricOut
        % 30 31
        this.FixptDialog.DataTypeRows(10.0).Visible = 1.0;
        % 32 33
        this.FixptDialog.DataTypeRows(6.0).Visible = 1.0;
    else
        this.FixptDialog.DataTypeRows(10.0).Visible = 0.0;
        this.FixptDialog.DataTypeRows(6.0).Visible = 0.0;
    end % if
    % 38 40
    % 39 40
    userDefinedRange = dspGetLeafWidgetBase('checkbox', 'Specify data range', 'userDefinedRange', this, 'userDefinedRange');
    % 41 44
    % 42 44
    % 43 44
    userDefinedRange.DialogRefresh = 1.0;
    % 45 47
    % 46 47
    umin = dspGetLeafWidgetBase('edit', 'Minimum value of input:', 'umin', this, 'umin');
    % 48 49
    if this.userDefinedRange
        umin.Visible = 1.0;
    else
        umin.Visible = 0.0;
    end % if
    % 54 56
    % 55 56
    umax = dspGetLeafWidgetBase('edit', 'Maximum value of input:', 'umax', this, 'umax');
    % 57 58
    if this.userDefinedRange
        umax.Visible = 1.0;
    else
        umax.Visible = 0.0;
    end % if
    % 63 65
    % 64 65
    outOfRngOpt = dspGetLeafWidgetBase('combobox', 'When data range is exceeded:', 'outOfRngOpt', this, 'outOfRngOpt');
    method.Entries = ctranspose(set(this, 'outOfRngOpt'));
    % 67 68
    if this.userDefinedRange
        outOfRngOpt.Visible = 1.0;
    else
        outOfRngOpt.Visible = 0.0;
    end % if
    % 73 75
    % 74 75
    umin.Tunable = 1.0;
    umax.Tunable = 1.0;
    % 77 79
    % 78 79
    scaleThreshold = dspGetLeafWidgetBase('checkbox', 'Scale threshold', 'scaleThreshold', this, 'scaleThreshold');
    % 80 83
    % 81 83
    % 82 83
    scaleThreshold.DialogRefresh = 1.0;
    scaleThreshold.Visible = 1.0;
    % 85 87
    % 86 87
    scaleFactor = dspGetLeafWidgetBase('edit', 'Threshold scaling factor:', 'scaleFactor', this, 'scaleFactor');
    % 88 89
    if this.scaleThreshold
        scaleFactor.Visible = 1.0;
    else
        scaleFactor.Visible = 0.0;
    end % if
    scaleFactor.Tunable = 1.0;
    % 95 96
    items = cellhorzcat(operator, threshOut, effMetricOut, userDefinedRange, umin, umax, outOfRngOpt, scaleThreshold, scaleFactor);
    % 97 99
    % 98 99
    dlgStruct = this.getRootSchemaStruct(items);
end % function
