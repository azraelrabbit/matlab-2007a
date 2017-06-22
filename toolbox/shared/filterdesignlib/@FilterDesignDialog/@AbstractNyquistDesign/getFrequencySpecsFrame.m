function fspecs = getFrequencySpecsFrame(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    items = getConstraintsWidgets(this, 'Frequency', 1.0);
    % 9 11
    items = getFrequencyUnitsWidgets(this, 2.0, items);
    % 11 14
    % 12 14
    if strcmpi(this.FrequencyConstraints, 'transition width')
        % 14 16
        items = addConstraint(this, 3.0, 1.0, items, true, 'TransitionWidth', 'Transition width', 'Transition width');
    else
        % 17 21
        % 18 21
        % 19 21
        spacer.Name = ' ';
        spacer.Type = 'text';
        spacer.ColSpan = [1.0 1.0];
        spacer.RowSpan = [3.0 3.0];
        spacer.Tag = 'Spacer';
        % 25 27
        items = cellhorzcat(items{:}, spacer);
        % 27 29
        spacer.RowSpan = [3.0 3.0];
        % 29 31
        items = cellhorzcat(items{:}, spacer);
    end % if
    % 32 34
    fspecs.Name = 'Frequency specifications';
    fspecs.Type = 'group';
    fspecs.Items = items;
    fspecs.LayoutGrid = [4.0 4.0];
    fspecs.RowStretch = [0.0 0.0 0.0 1.0];
    fspecs.ColStretch = [0.0 1.0 0.0 1.0];
    fspecs.Tag = 'FreqSpecsGroup';
end % function
