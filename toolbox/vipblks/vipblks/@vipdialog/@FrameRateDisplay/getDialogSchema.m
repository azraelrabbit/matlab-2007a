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
    UpdateRatebox = dspGetLeafWidgetBase('edit', 'Calculate and display rate every:', 'UpdateRate', this, 'UpdateRate');
    % 15 16
    UpdateRatebox.RowSpan = [1.0 1.0];
    UpdateRatebox.ColSpan = [1.0 1.0];
    UpdateRatebox.Tunable = 1.0;
    % 19 20
    Frames = dspGetContainerWidgetBase('text', 'frames', 'frames');
    Frames.RowSpan = [1.0 1.0];
    Frames.ColSpan = [2.0 2.0];
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = dspTrimItemList(cellhorzcat(UpdateRatebox, Frames));
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    parameterPane.LayoutGrid = [1.0 2.0];
    parameterPane.Tag = 'parameterPane';
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    dlgStruct = this.getBaseSchemaStruct(parameterPane);
end % function
