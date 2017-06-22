function mspecs = getMagnitudeSpecsFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    items = getConstraintsWidgets(this, 'Magnitude', 1.0);
    items{1.0}.Name = 'Gain constraints: ';
    items{1.0}.Visible = true;
    items{2.0}.Visible = true;
    % 12 13
    items = getMagnitudeUnitsWidgets(this, 2.0, items);
    items{minus(end, 1.0)}.Name = 'Gain units: ';
    % 15 16
    items = addConstraint(this, 3.0, 1.0, items, true, 'Gref', 'Reference');
    % 17 19
    % 18 19
    switch lower(this.MagnitudeConstraints)
    case 'reference, center frequency, bandwidth, passband'
        items = addConstraint(this, 3.0, 3.0, items, true, 'G0', 'Center frequency');
        items = addConstraint(this, 4.0, 1.0, items, true, 'GBW', 'Bandwidth');
        items = addConstraint(this, 4.0, 3.0, items, true, 'Gpass', 'Passband');
    case 'reference, center frequency, bandwidth, stopband'
        items = addConstraint(this, 3.0, 3.0, items, true, 'G0', 'Center frequency');
        items = addConstraint(this, 4.0, 1.0, items, true, 'GBW', 'Bandwidth');
        items = addConstraint(this, 4.0, 3.0, items, true, 'Gstop', 'Stopband');
    case 'reference, center frequency, bandwidth, passband, stopband'
        items = addConstraint(this, 3.0, 3.0, items, true, 'G0', 'Center frequency');
        items = addConstraint(this, 4.0, 1.0, items, true, 'GBW', 'Bandwidth');
        items = addConstraint(this, 4.0, 3.0, items, true, 'Gpass', 'Passband');
        items = addConstraint(this, 5.0, 1.0, items, true, 'Gstop', 'Stopband');
    case 'reference, center frequency, bandwidth'
        items = addConstraint(this, 3.0, 3.0, items, true, 'G0', 'Center frequency');
        items = addConstraint(this, 4.0, 1.0, items, true, 'GBW', 'Bandwidth');
    end % switch
    % 37 38
    mspecs.Name = 'Gain specifications';
    mspecs.Type = 'group';
    mspecs.Items = items;
    mspecs.LayoutGrid = [6.0 4.0];
    mspecs.RowStretch = [0.0 0.0 0.0 0.0 0.0 1.0];
    mspecs.ColStretch = [0.0 1.0 0.0 1.0];
    mspecs.Tag = 'MagSpecsGroup';
end % function
