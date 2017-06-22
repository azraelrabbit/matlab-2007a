function dlgStruct = getBaseSchemaStruct(this, parameters, maskDescription, optPane)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if lt(nargin, 3.0)
        maskDescription = this.Block.MaskDescription;
    end % if
    % 23 24
    description.Type = 'text';
    description.Name = maskDescription;
    description.Tag = 'description';
    description.WordWrap = 1.0;
    % 28 29
    descriptionPane = dspGetContainerWidgetBase('group', this.Block.MaskType, 'descriptionPane');
    % 30 31
    descriptionPane.Items = cellhorzcat(description);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    % 34 35
    mainPane = dspGetContainerWidgetBase('panel', '', 'mainPane');
    if lt(nargin, 4.0)
        if iscell(parameters)
            mainPane.Items = cat(2.0, cellhorzcat(descriptionPane), parameters);
        else
            mainPane.Items = cellhorzcat(descriptionPane, parameters);
        end % if
        mainPane.Tag = 'mainPane';
        mainPane.LayoutGrid = [3.0 1.0];
        mainPane.RowStretch = [0.0 0.0 1.0];
        mainPane.RowSpan = [1.0 1.0];
        mainPane.ColSpan = [1.0 1.0];
    else
        if iscell(parameters)
            mainPane.Items = cat(2.0, cellhorzcat(descriptionPane), cellhorzcat(optPane), parameters);
        else
            mainPane.Items = cellhorzcat(descriptionPane, optPane, parameters);
        end % if
        mainPane.Tag = 'mainPane';
        mainPane.LayoutGrid = [4.0 1.0];
        mainPane.RowStretch = [0.0 0.0 0.0 1.0];
        mainPane.RowSpan = [1.0 1.0];
        mainPane.ColSpan = [1.0 1.0];
    end % if
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    title = this.Block.Name;
    % 64 65
    title(find(eq(double(title), 10.0))) = ' ';
    dlgStruct.DialogTitle = horzcat('Block Parameters: ', title);
    dlgStruct.HelpMethod = 'slhelp';
    dlgStruct.HelpArgs = cellhorzcat(this, this.Block.Handle);
    dlgStruct.Items = cellhorzcat(mainPane);
    dlgStruct.DialogTag = this.Block.Name;
    dlgStruct.PreApplyCallback = 'dspDDGPreApply';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog');
    dlgStruct.PostApplyCallback = 'dspPostApply';
    dlgStruct.PostApplyArgs = cellhorzcat(this, '%dialog');
    dlgStruct.SmartApply = 0.0;
    dlgStruct.CloseMethod = 'closeCallback';
    dlgStruct.CloseMethodArgs = {'%dialog'};
    dlgStruct.CloseMethodArgsDT = {'handle'};
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    % 85 86
    [isLibrary, isLocked] = this.isLibraryBlock(this.Block);
    if isLibrary && isLocked
        dlgStruct.DisableDialog = 1.0;
        % 89 90
        return;
    end % if
    % 92 94
    % 93 94
    if any(strcmp(this.Root.SimulationStatus, {'running','paused'}))
        dlgStruct = this.disableNontunables(dlgStruct);
    end % if
end % function
