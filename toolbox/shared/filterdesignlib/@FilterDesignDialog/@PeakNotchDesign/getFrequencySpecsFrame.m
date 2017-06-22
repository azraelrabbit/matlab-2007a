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
    switch lower(this.FrequencyConstraints)
    case 'center frequency and quality factor'
        items = addConstraint(this, 3.0, 1.0, items, true, 'F0', 'Center frequency');
        items = addConstraint(this, 3.0, 3.0, items, true, 'Q', 'Quality factor', 'Q');
    case 'center frequency and bandwidth'
        items = addConstraint(this, 3.0, 1.0, items, true, 'F0', 'Center frequency');
        items = addConstraint(this, 3.0, 3.0, items, true, 'BW', 'Bandwidth');
    end % switch
    % 23 24
    fspecs.Name = 'Frequency specifications';
    fspecs.Type = 'group';
    fspecs.Items = items;
    fspecs.LayoutGrid = [4.0 4.0];
    fspecs.RowStretch = [0.0 0.0 0.0 1.0];
    fspecs.ColStretch = [0.0 1.0 0.0 1.0];
    fspecs.Tag = 'FreqSpecsGroup';
end % function
