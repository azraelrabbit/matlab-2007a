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
    method = dspGetLeafWidgetBase('combobox', 'Deinterlacing method:', 'method', this, 'method');
    method.Entries = ctranspose(set(this, 'method'));
    method.DialogRefresh = 1.0;
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(method));
    % 18 20
    % 19 20
    emptyFixpt = dspGetLeafWidgetBase('text', ' Fixed-point parameters are applicable only for linear interpolation method.', 'emptyFixpt', 0.0);
    % 21 22
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items = cellhorzcat(emptyFixpt, dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0});
    % 23 25
    % 24 25
    if strncmp(this.method, 'Linear ...', 6.0)
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Visible = 0.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Visible = 1.0;
    else
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Visible = 1.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Visible = 0.0;
    end % if
end % function
