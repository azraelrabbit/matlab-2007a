function mspecs = getMagnitudeSpecsFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    items = getConstraintsWidgets(this, 'Magnitude', 1.0);
    % 8 12
    % 9 12
    % 10 12
    if strcmpi(this.MagnitudeConstraints, 'stopband attenuation')
        % 12 14
        items = getMagnitudeUnitsWidgets(this, 2.0, items);
        % 14 16
        items = addConstraint(this, 3.0, 1.0, items, true, 'Astop', 'Astop', 'Stopband attenuation');
    else
        % 17 21
        % 18 21
        % 19 21
        spacer.Name = ' ';
        spacer.Type = 'text';
        spacer.ColSpan = [1.0 1.0];
        spacer.RowSpan = [2.0 2.0];
        spacer.Tag = 'Spacer';
        % 25 27
        items = cellhorzcat(items{:}, spacer);
        % 27 29
        spacer.RowSpan = [3.0 3.0];
        % 29 31
        items = cellhorzcat(items{:}, spacer);
    end % if
    % 32 34
    mspecs.Name = 'Magnitude specifications';
    mspecs.Type = 'group';
    mspecs.Items = items;
    mspecs.LayoutGrid = [4.0 4.0];
    mspecs.RowStretch = [0.0 0.0 0.0 1.0];
    mspecs.ColStretch = [0.0 1.0 0.0 1.0];
    mspecs.Tag = 'MagSpecsGroup';
end % function
