function mspecs = getMagnitudeSpecsFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    spacer.Name = ' ';
    spacer.Type = 'text';
    spacer.RowSpan = [1.0 1.0];
    spacer.ColSpan = [1.0 1.0];
    spacer.Tag = 'Spacer';
    % 12 14
    items = getConstraintsWidgets(this, 'Magnitude', 1.0);
    % 14 16
    if strcmpi(lower(this.MagnitudeConstraints), 'unconstrained')
        % 16 19
        % 17 19
        spacer.RowSpan = [2.0 2.0];
        spacer.Tag = 'Spacer2';
        % 20 22
        items = cellhorzcat(items{:}, spacer);
        % 22 24
        spacer.RowSpan = [3.0 3.0];
        % 24 26
        items = cellhorzcat(items{:}, spacer);
    else
        % 27 29
        items = getMagnitudeUnitsWidgets(this, 2.0, items);
        % 29 31
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Apass', 'Apass', 'Passband ripple');
        % 31 33
        items = addConstraint(this, 3.0, col, items, true, 'Astop', 'Astop', 'Stopband attenuation');
        % 33 36
        % 34 36
    end % if
    % 36 38
    mspecs.Name = 'Magnitude specifications';
    mspecs.Type = 'group';
    mspecs.Items = items;
    mspecs.LayoutGrid = [4.0 4.0];
    mspecs.RowStretch = [0.0 0.0 0.0 1.0];
    mspecs.ColStretch = [0.0 1.0 0.0 1.0];
    mspecs.Tag = 'MagSpecsGroup';
end % function
