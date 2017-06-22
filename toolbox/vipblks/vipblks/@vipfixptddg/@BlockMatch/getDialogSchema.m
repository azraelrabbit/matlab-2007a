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
    which2img = dspGetLeafWidgetBase('combobox', 'Estimate motion between:', 'which2img', this, 'which2img');
    which2img.Entries = ctranspose(set(this, 'which2img'));
    which2img.Visible = 1.0;
    which2img.DialogRefresh = 1.0;
    % 18 20
    % 19 20
    N = dspGetLeafWidgetBase('edit', 'N:', 'N', this, 'N');
    N.Entries = ctranspose(set(this, 'N'));
    if strncmp(this.which2img, 'Current frame and N-th frame back', 1.0)
        N.Visible = 1.0;
    else
        N.Visible = 0.0;
    end % if
    % 27 29
    % 28 29
    searchMethod = dspGetLeafWidgetBase('combobox', 'Search method:', 'searchMethod', this, 'searchMethod');
    searchMethod.Entries = ctranspose(set(this, 'searchMethod'));
    searchMethod.Visible = 1.0;
    % 32 34
    % 33 34
    matchCriteria = dspGetLeafWidgetBase('combobox', 'Block matching criteria:', 'matchCriteria', this, 'matchCriteria');
    matchCriteria.Entries = ctranspose(set(this, 'matchCriteria'));
    matchCriteria.Visible = 1.0;
    matchCriteria.DialogRefresh = 1.0;
    % 38 40
    % 39 40
    blockSize = dspGetLeafWidgetBase('edit', 'Block size [height width]:', 'blockSize', this, 'blockSize');
    blockSize.Entries = ctranspose(set(this, 'blockSize'));
    blockSize.Visible = 1.0;
    % 43 45
    % 44 45
    overlapping = dspGetLeafWidgetBase('edit', 'Overlap [r c]:', 'overlapping', this, 'overlapping');
    overlapping.Entries = ctranspose(set(this, 'overlapping'));
    overlapping.Visible = 1.0;
    % 48 50
    % 49 50
    maxDisplacement = dspGetLeafWidgetBase('edit', 'Maximum displacement [r c]:', 'maxDisplacement', this, 'maxDisplacement');
    maxDisplacement.Entries = ctranspose(set(this, 'maxDisplacement'));
    maxDisplacement.Visible = 1.0;
    % 53 55
    % 54 55
    outVelForm = dspGetLeafWidgetBase('combobox', 'Velocity output:', 'outVelForm', this, 'outVelForm');
    outVelForm.Entries = ctranspose(set(this, 'outVelForm'));
    outVelForm.Visible = 1.0;
    outVelForm.DialogRefresh = 1.0;
    % 59 60
    isOutVelMagsq = strncmp(this.outVelForm, 'Magnitude-squared', 3.0);
    % 61 62
    isMatchCriteriaMAD = strncmp(this.matchCriteria, 'Mean absolute difference', 7.0);
    if isMatchCriteriaMAD
        this.FixptDialog.DataTypeRows(1.0).Visible = 0.0;
    else
        this.FixptDialog.DataTypeRows(1.0).Visible = 1.0;
    end % if
    % 68 69
    items = cellhorzcat(which2img, N, searchMethod, matchCriteria, blockSize, overlapping, maxDisplacement, outVelForm);
    % 70 71
    dlgStruct = this.getRootSchemaStruct(items);
    % 72 73
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{11.0}.Name = 'yes';
    if isMatchCriteriaMAD
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{11.0}.Visible = 0.0;
    else
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{11.0}.Visible = 1.0;
    end % if
    % 79 80
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{19.0}.Name = 'yes';
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{19.0}.Visible = 1.0;
    % 82 83
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{27.0}.Visible = 1.0;
    % 84 85
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{29.0}.Visible = 0.0;
    % 86 87
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{30.0}.Visible = 0.0;
    % 88 89
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{31.0}.Visible = 0.0;
    % 90 91
    if isOutVelMagsq
        % 92 93
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{27.0}.Name = 'no';
    else
        % 95 96
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{4.0}.Items{27.0}.Name = 'yes';
    end % if
end % function
