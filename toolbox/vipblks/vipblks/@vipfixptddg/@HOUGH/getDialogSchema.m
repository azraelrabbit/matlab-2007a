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
    theta_res = dspGetLeafWidgetBase('edit', 'Theta resolution (radians):', 'theta_res', this, 'theta_res');
    % 15 19
    % 16 19
    % 17 19
    rho_res = dspGetLeafWidgetBase('edit', 'Rho resolution:', 'rho_res', this, 'rho_res');
    % 19 23
    % 20 23
    % 21 23
    out_theta_rho = dspGetLeafWidgetBase('checkbox', 'Output theta and rho values', 'out_theta_rho', this, 'out_theta_rho');
    % 23 26
    % 24 26
    outdtmode = dspGetLeafWidgetBase('combobox', 'Output data type:', 'outdtmode', this, 'outdtmode');
    % 26 28
    outdtmode.Entries = ctranspose(set(this, 'outdtmode'));
    outdtmode.DialogRefresh = 1.0;
    % 29 31
    items = cellhorzcat(theta_res, rho_res, out_theta_rho, outdtmode);
    % 31 33
    dlgStruct = this.getRootSchemaStruct(items);
    % 33 36
    % 34 36
    emptyFixpt = dspGetLeafWidgetBase('text', ' When the Output data type parameter is set to double or single, fixed-point parameters are not applicable.', 'emptyFixpt', 0.0);
    % 36 38
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items = cellhorzcat(emptyFixpt, dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0});
    % 38 41
    % 39 41
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Items{end}.Items{45.0}.Enabled = 0.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Items{end}.Items{46.0}.Enabled = 0.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Items{end}.Items{43.0}.Name = 'no';
    % 43 45
    isOutFixpt = strncmp(this.outdtmode, 'Spe', 3.0);
    if isOutFixpt
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Visible = 0.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Visible = 1.0;
    else
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Visible = 1.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Visible = 0.0;
    end % if
