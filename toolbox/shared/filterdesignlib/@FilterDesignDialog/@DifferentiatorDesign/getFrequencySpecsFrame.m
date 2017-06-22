function fspecs = getFrequencySpecsFrame(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    items = getConstraintsWidgets(this, 'Frequency', 1.0);
    % 10 12
    % 11 12
    items = getFrequencyUnitsWidgets(this, 2.0, items);
    % 13 15
    % 14 15
    if not(strcmpi(this.FrequencyConstraints, 'unconstrained'))
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Fpass', 'Fpass', 'Passband edge');
        % 17 18
        items = addConstraint(this, 3.0, col, items, true, 'Fstop', 'Fstop', 'Stopband edge');
        % 19 20
    end % if
    % 21 22
    fspecs.Name = 'Frequency specifications';
    fspecs.Type = 'group';
    fspecs.Items = items;
    fspecs.LayoutGrid = [4.0 4.0];
    fspecs.RowStretch = [0.0 0.0 0.0 1.0];
    fspecs.ColStretch = [0.0 1.0 0.0 1.0];
    fspecs.Tag = 'FreqSpecsGroup';
end % function
