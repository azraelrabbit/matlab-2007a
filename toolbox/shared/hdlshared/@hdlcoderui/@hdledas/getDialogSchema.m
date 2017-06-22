function dlg = getDialogSchema(this, mode)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(isempty(this.CLIProperties))
        dlg = getTabDialogSchema(this, 'tab', this.CLIProperties);
    end % if
    dlg.DialogTitle = 'EDA Tool Scripts';
    dlg.DisplayIcon = '\toolbox\shared\dastudio\resources\MatlabIcon.png';
    dlg.LayoutGrid = [1.0 1.0];
    dlg.RowStretch = 0.0;
    dlg.ColStretch = 0.0;
    dlg.HelpMethod = 'edahelp';
    dlg.HelpArgs = cellhorzcat(this);
end % function
