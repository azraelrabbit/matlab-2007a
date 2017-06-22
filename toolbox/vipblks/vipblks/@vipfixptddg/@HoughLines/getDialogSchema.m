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
    sineCompMethod = dspGetLeafWidgetBase('combobox', 'Sine value computation method:', 'sineCompMethod', this, 'sineCompMethod');
    sineCompMethod.Entries = ctranspose(set(this, 'sineCompMethod'));
    sineCompMethod.DialogRefresh = 1.0;
    % 16 18
    % 17 18
    thetaRes = dspGetLeafWidgetBase('edit', 'Theta resolution (radians):', 'thetaRes', this, 'thetaRes');
    % 19 21
    % 20 21
    if strcmp(this.sineCompMethod, 'Table lookup')
        thetaRes.Visible = 1.0;
    else
        thetaRes.Visible = 0.0;
    end % if
    % 26 27
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(sineCompMethod, thetaRes));
end % function
