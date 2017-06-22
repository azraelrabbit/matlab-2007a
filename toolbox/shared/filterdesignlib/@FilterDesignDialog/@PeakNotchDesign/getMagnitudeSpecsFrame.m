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
    % 14 17
    % 15 17
    hasapass = not(isempty(strfind(lower(this.MagnitudeConstraints), 'passband ripple')));
    hasastop = not(isempty(strfind(lower(this.MagnitudeConstraints), 'stopband attenuation')));
    % 18 20
    if hasapass || hasastop
        % 20 22
        items = getMagnitudeUnitsWidgets(this, 2.0, items);
        % 22 24
        [items, col] = addConstraint(this, 3.0, 1.0, items, hasapass, 'Apass', 'Apass', 'Passband ripple');
        % 24 26
        items = addConstraint(this, 3.0, col, items, hasastop, 'Astop', 'Astop', 'Stopband attenuation');
    else
        % 27 31
        % 28 31
        % 29 31
        spacer.RowSpan = [2.0 2.0];
        spacer.Tag = 'Spacer2';
        % 32 34
        items = cellhorzcat(items{:}, spacer);
        % 34 36
        spacer.RowSpan = [3.0 3.0];
        % 36 38
        items = cellhorzcat(items{:}, spacer);
    end % if
    % 39 41
    mspecs.Name = 'Magnitude specifications';
    mspecs.Type = 'group';
    mspecs.Items = items;
    mspecs.LayoutGrid = [4.0 4.0];
    mspecs.RowStretch = [0.0 0.0 0.0 1.0];
    mspecs.ColStretch = [0.0 1.0 0.0 1.0];
    mspecs.Tag = 'MagSpecsGroup';
end % function
