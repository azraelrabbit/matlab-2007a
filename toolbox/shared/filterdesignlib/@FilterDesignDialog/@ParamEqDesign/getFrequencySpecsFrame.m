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
    items{1.0}.Visible = true;
    items{2.0}.Visible = true;
    % 12 14
    % 13 14
    items = getFrequencyUnitsWidgets(this, 2.0, items);
    % 15 17
    % 16 17
    switch lower(this.FrequencyConstraints)
    case 'center frequency, bandwidth, passband width'
        items = addConstraint(this, 3.0, 1.0, items, true, 'F0', 'Center frequency');
        items = addConstraint(this, 3.0, 3.0, items, true, 'BW', 'Bandwidth');
        items = addConstraint(this, 4.0, 1.0, items, true, 'BWpass', 'Passband width');
    case 'center frequency, bandwidth, stopband width'
        items = addConstraint(this, 3.0, 1.0, items, true, 'F0', 'Center frequency');
        items = addConstraint(this, 3.0, 3.0, items, true, 'BW', 'Bandwidth');
        items = addConstraint(this, 4.0, 1.0, items, true, 'BWstop', 'Stopband width');
    case 'center frequency, bandwidth'
        items = addConstraint(this, 3.0, 1.0, items, true, 'F0', 'Center frequency');
        items = addConstraint(this, 3.0, 3.0, items, true, 'BW', 'Bandwidth');
    case 'low frequency, high frequency'
        items = addConstraint(this, 3.0, 1.0, items, true, 'Flow', 'Low frequency');
        items = addConstraint(this, 3.0, 3.0, items, true, 'Fhigh', 'High frequency');
    end % switch
    % 33 34
    fspecs.Name = 'Frequency specifications';
    fspecs.Type = 'group';
    fspecs.Items = items;
    fspecs.LayoutGrid = [4.0 4.0];
    fspecs.RowStretch = [0.0 0.0 0.0 1.0];
    fspecs.ColStretch = [0.0 1.0 0.0 1.0];
    fspecs.Tag = 'FreqSpecsGroup';
end % function
