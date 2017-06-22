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
    % 12 13
    outSizeR = dspGetLeafWidgetBase('combobox', 'Output size:', 'outSizeR', this, 'outSizeR');
    outSizeR.Entries = ctranspose(set(this, 'outSizeR'));
    outSizeR.DialogRefresh = 1.0;
    % 16 18
    % 17 18
    src_angle = dspGetLeafWidgetBase('combobox', 'Rotation angle source:', 'src_angle', this, 'src_angle');
    src_angle.Entries = ctranspose(set(this, 'src_angle'));
    src_angle.DialogRefresh = 1.0;
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    angle = dspGetLeafWidgetBase('edit', 'Angle (radians):', 'angle', this, 'angle');
    % 28 29
    angle.Entries = ctranspose(set(this, 'angle'));
    % 30 32
    % 31 32
    maxAngle = dspGetLeafWidgetBase('edit', 'Maximum angle (enter pi radians to accommodate all positive and negative angles):', 'maxAngle', this, 'maxAngle');
    % 33 34
    maxAngle.Entries = ctranspose(set(this, 'maxAngle'));
    % 35 37
    % 36 37
    dispImage = dspGetLeafWidgetBase('combobox', 'Display rotated image in:', 'dispImage', this, 'dispImage');
    dispImage.Entries = ctranspose(set(this, 'dispImage'));
    % 39 41
    % 40 41
    method = dspGetLeafWidgetBase('combobox', 'Sine value computation method:', 'method', this, 'method');
    method.Entries = ctranspose(set(this, 'method'));
    % 43 45
    % 44 45
    fillVal = dspGetLeafWidgetBase('edit', 'Background fill value:', 'fillVal', this, 'fillVal');
    % 46 47
    fillVal.Visible = 1.0;
    fillVal.Tunable = 1.0;
    fillVal.DialogRefresh = 0.0;
    % 50 52
    % 51 52
    interpMethod = dspGetLeafWidgetBase('combobox', 'Interpolation method:', 'interpMethod', this, 'interpMethod');
    interpMethod.Entries = ctranspose(set(this, 'interpMethod'));
    interpMethod.DialogRefresh = 0.0;
    % 55 56
    this.FixptDialog.DataTypeRows(4.0).Visible = 1.0;
    if strcmp(this.src_angle, 'Specify via dialog')
        angle.Visible = 1.0;
        maxAngle.Visible = 0.0;
        dispImage.Visible = 0.0;
        this.FixptDialog.DataTypeRows(4.0).Visible = 1.0;
    else
        angle.Visible = 0.0;
        maxAngle.Visible = 1.0;
        if strcmp(this.outSizeR, 'Expanded to fit rotated input image')
            dispImage.Visible = 1.0;
        else
            dispImage.Visible = 0.0;
        end % if
        this.FixptDialog.DataTypeRows(4.0).Visible = 0.0;
    end % if
    % 72 75
    % 73 75
    % 74 75
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(outSizeR, src_angle, angle, maxAngle, dispImage, method, fillVal, interpMethod));
    % 76 78
    % 77 78
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 80 81
end % function
