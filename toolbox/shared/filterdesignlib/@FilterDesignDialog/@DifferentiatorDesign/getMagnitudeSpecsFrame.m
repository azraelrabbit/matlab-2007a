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
    if isminorder(this)
        % 16 18
        items = getMagnitudeUnitsWidgets(this, 2.0, items);
        % 18 20
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Apass', 'Apass', 'Passband ripple');
        % 20 22
        items = addConstraint(this, 3.0, col, items, true, 'Astop', 'Astop', 'Stopband attenuation');
    else
        % 23 27
        % 24 27
        % 25 27
        spacer.RowSpan = [2.0 2.0];
        spacer.Tag = 'Spacer2';
        % 28 30
        items = cellhorzcat(items{:}, spacer);
        % 30 32
        spacer.RowSpan = [3.0 3.0];
        % 32 34
        items = cellhorzcat(items{:}, spacer);
    end % if
    % 35 37
    mspecs.Name = 'Magnitude specifications';
    mspecs.Type = 'group';
    mspecs.Items = items;
    mspecs.LayoutGrid = [4.0 4.0];
    mspecs.RowStretch = [0.0 0.0 0.0 1.0];
    mspecs.ColStretch = [0.0 1.0 0.0 1.0];
    mspecs.Tag = 'MagSpecsGroup';
end % function
