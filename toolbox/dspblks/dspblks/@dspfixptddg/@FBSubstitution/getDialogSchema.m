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
    if strcmp(this.Block.MaskType, 'Forward Substitution')
        Unit = dspGetLeafWidgetBase('checkbox', 'Input L is unit-lower triangular', 'Unit', this, 'Unit');
    else
        % 17 18
        Unit = dspGetLeafWidgetBase('checkbox', 'Input U is unit-upper triangular', 'Unit', this, 'Unit');
        % 19 20
    end % if
    Unit.Tunable = 0.0;
    Unit.DialogRefresh = 1.0;
    % 23 25
    % 24 25
    if strcmp(this.Block.MaskType, 'Forward Substitution')
        RealDiag = dspGetLeafWidgetBase('checkbox', 'Diagonal of complex input L is real', 'RealDiag', this, 'RealDiag');
    else
        % 28 29
        RealDiag = dspGetLeafWidgetBase('checkbox', 'Diagonal of complex input U is real', 'RealDiag', this, 'RealDiag');
        % 30 31
    end % if
    RealDiag.Tunable = 0.0;
    % 33 34
    if this.Unit
        RealDiag.Visible = 0.0;
    else
        RealDiag.Visible = 1.0;
    end % if
    % 39 40
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(Unit, RealDiag));
end % function
