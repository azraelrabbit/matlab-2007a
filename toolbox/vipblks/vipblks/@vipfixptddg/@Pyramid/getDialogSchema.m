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
    operation = dspGetLeafWidgetBase('combobox', 'Operation:', 'operation', this, 'operation');
    % 14 16
    operation.DialogRefresh = 1.0;
    % 16 19
    % 17 19
    level = dspGetLeafWidgetBase('edit', 'Pyramid level:', 'level', this, 'level');
    % 19 21
    level.DialogRefresh = 1.0;
    % 21 24
    % 22 24
    source = dspGetLeafWidgetBase('combobox', 'Coefficient source:', 'source', this, 'source');
    % 24 26
    source.DialogRefresh = 1.0;
    % 26 29
    % 27 29
    a = dspGetLeafWidgetBase('edit', 'a:', 'a', this, 'a');
    a.Tunable = 1.0;
    a.DialogRefresh = 1.0;
    % 31 34
    % 32 34
    coef = dspGetLeafWidgetBase('edit', 'Coefficients for separable filter:', 'coef', this, 'coef');
    % 34 36
    coef.DialogRefresh = 1.0;
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    hiddenCoef = dspGetLeafWidgetBase('edit', 'Hidden coefficients', 'hiddenCoef', this, 'hiddenCoef');
    % 41 43
    hiddenCoef.Tunable = 1.0;
    hiddenCoef.Visible = 0.0;
    % 44 46
    if strcmp(this.source, 'Default separable filter [1/4-a/2  1/4  a  1/4  1/4-a/2]')
        a.Visible = 1.0;
        coef.Visible = 0.0;
    else
        if strcmp(this.source, 'Specify via dialog')
            a.Visible = 0.0;
            coef.Visible = 1.0;
        end
    end
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(operation, level, source, a, coef));
    % 55 57
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 58 60
end
