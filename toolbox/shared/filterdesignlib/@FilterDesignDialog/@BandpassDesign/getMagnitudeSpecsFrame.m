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
    if not(strcmpi(this.MagnitudeConstraints, 'unconstrained'))
        % 16 18
        items = getMagnitudeUnitsWidgets(this, 2.0, items);
        % 18 20
        switch lower(this.MagnitudeConstraints)
        case 'passband ripple'
            items = addConstraint(this, 3.0, 1.0, items, true, 'Apass', 'Apass', 'Passband ripple');
        case 'stopband attenuation'
            % 23 25
            items = addConstraint(this, 3.0, 1.0, items, true, 'Astop1', 'Astop', 'Stopband attenuation');
        case 'passband ripple and stopband attenuations'
            % 26 28
            [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Astop1', 'Astop1', 'First stopband attenuation');
            % 28 30
            items = addConstraint(this, 3.0, col, items, true, 'Apass', 'Apass', 'Passband ripple');
            % 30 32
            items = addConstraint(this, 4.0, 1.0, items, true, 'Astop2', 'Astop2', 'Second stopband attenuation');
            % 32 34
        end % switch
    else
        % 35 39
        % 36 39
        % 37 39
        spacer.RowSpan = [2.0 2.0];
        spacer.Tag = 'Spacer2';
        % 40 42
        items = cellhorzcat(items{:}, spacer);
        % 42 44
        spacer.RowSpan = [3.0 3.0];
        % 44 46
        items = cellhorzcat(items{:}, spacer);
    end % if
    % 47 49
    mspecs.Name = 'Magnitude specifications';
    mspecs.Type = 'group';
    mspecs.Items = items;
    mspecs.LayoutGrid = [5.0 4.0];
    mspecs.RowStretch = [0.0 0.0 0.0 0.0 1.0];
    mspecs.ColStretch = [0.0 1.0 0.0 1.0];
    mspecs.Tag = 'MagSpecsGroup';
end % function
