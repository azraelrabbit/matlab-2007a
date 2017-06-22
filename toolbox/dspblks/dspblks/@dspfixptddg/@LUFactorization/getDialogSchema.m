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
    singular = dspGetLeafWidgetBase('checkbox', 'Show singularity status', 'singular', this, 'singular');
    % 15 16
    singular.Tunable = 0.0;
    singular.Visible = 1.0;
    % 18 19
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(singular));
end % function
