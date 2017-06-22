function dlgStruct = getDialogSchema(this, dummy)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    operation = dspGetLeafWidgetBase('combobox', 'Operation:', 'operation', this, 'operation');
    operation.Entries = ctranspose(set(this, 'operation'));
    operation.DialogRefresh = 1.0;
    % 14 17
    % 15 17
    bFacSrc = dspGetLeafWidgetBase('combobox', 'Opacity factor(s) source:', 'bFacSrc', this, 'bFacSrc');
    bFacSrc.Entries = ctranspose(set(this, 'bFacSrc'));
    bFacSrc.DialogRefresh = 1.0;
    % 19 22
    % 20 22
    mFacSrc = dspGetLeafWidgetBase('combobox', 'Mask source:', 'mFacSrc', this, 'mFacSrc');
    mFacSrc.Entries = ctranspose(set(this, 'mFacSrc'));
    mFacSrc.DialogRefresh = 1.0;
    % 24 27
    % 25 27
    bFactor = dspGetLeafWidgetBase('edit', 'Opacity factor(s):', 'bFactor', this, 'bFactor');
    % 27 30
    % 28 30
    mFactor = dspGetLeafWidgetBase('edit', 'Mask:', 'mFactor', this, 'mFactor');
    % 30 32
    if strcmp(this.operation, 'Blend')
        bFacSrc.Visible = 1.0;
        if strcmp(this.bFacSrc, 'Specify via dialog')
            bFactor.Visible = 1.0;
            bFactor.Tunable = 1.0;
            this.FixptDialog.DataTypeRows(4.0).Visible = 1.0;
        else
            bFactor.Visible = 0.0;
            bFactor.Tunable = 0.0;
            this.FixptDialog.DataTypeRows(4.0).Visible = 0.0;
        end % if
        mFacSrc.Visible = 0.0;
        mFactor.Visible = 0.0;
    else
        if strcmp(this.operation, 'Binary mask')
            mFacSrc.Visible = 1.0;
            if strcmp(this.mFacSrc, 'Specify via dialog')
                mFactor.Visible = 1.0;
                mFactor.Tunable = 1.0;
            else
                mFactor.Visible = 0.0;
                mFactor.Tunable = 0.0;
            end % if
            bFacSrc.Visible = 0.0;
            bFactor.Visible = 0.0;
            this.FixptDialog.DataTypeRows(4.0).Visible = 0.0;
        else
            mFacSrc.Visible = 0.0;
            mFactor.Visible = 0.0;
            bFacSrc.Visible = 0.0;
            bFactor.Visible = 0.0;
            this.FixptDialog.DataTypeRows(4.0).Visible = 0.0;
        end % if
        % 64 67
        % 65 67
    end % if
    source = dspGetLeafWidgetBase('combobox', 'Location source:', 'source', this, 'source');
    source.Entries = ctranspose(set(this, 'source'));
    source.DialogRefresh = 1.0;
    coordinates = dspGetLeafWidgetBase('edit', 'Location [row column]:', 'coordinates', this, 'coordinates');
    % 71 73
    if strcmp(this.source, 'Specify via dialog')
        coordinates.Visible = 1.0;
        coordinates.Tunable = 1.0;
    else
        coordinates.Visible = 0.0;
        coordinates.Tunable = 0.0;
    end % if
    % 79 81
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(operation, bFacSrc, mFacSrc, bFactor, mFactor, source, coordinates));
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    dlgStruct.PreApplyCallback = 'compositePreApply';
    % 86 88
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    emptyFixpt = dspGetLeafWidgetBase('text', ' When the Operation parameter is set to Binary mask, fixed-point parameters are not applicable.', 'emptyFixpt', 0.0);
    % 93 95
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items = cellhorzcat(emptyFixpt, dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0});
    % 95 98
    % 96 98
    if not(strcmp(this.operation, 'Blend'))
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Visible = 1.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Visible = 0.0;
    else
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Visible = 0.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Visible = 1.0;
    end % if
end % function
