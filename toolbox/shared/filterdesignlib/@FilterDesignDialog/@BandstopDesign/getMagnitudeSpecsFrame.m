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
        items = getMagnitudeUnitsWidgets(this, 2.0, items);
        switch lower(this.MagnitudeConstraints)
        case 'passband ripple'
            items = addConstraint(this, 3.0, 1.0, items, true, 'Apass1', 'Apass', 'Passband ripple');
        case 'stopband attenuation'
            % 21 23
            items = addConstraint(this, 3.0, 1.0, items, true, 'Astop', 'Astop', 'Stopband attenuation');
        case 'passband ripples and stopband attenuation'
            % 24 26
            if any(strcmpi(this.FrequencyConstraints, {'3db points','passband edges'}))
                [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Apass1', 'Apass', 'Passband ripple');
                % 27 29
                items = addConstraint(this, 3.0, col, items, true, 'Astop', 'Astop', 'Stopband attenuation');
            else
                % 30 32
                [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Apass1', 'Apass1', 'First passband ripple');
                % 32 34
                items = addConstraint(this, 3.0, col, items, true, 'Astop', 'Astop', 'Stopband attenuation');
                % 34 36
                items = addConstraint(this, 4.0, 1.0, items, true, 'Apass2', 'Apass2', 'Second passband ripple');
                % 36 38
            end % if
        end % switch
    else
        % 40 43
        % 41 43
        spacer.RowSpan = [2.0 2.0];
        spacer.Tag = 'Spacer2';
        % 44 46
        items = cellhorzcat(items{:}, spacer);
        % 46 48
        spacer.RowSpan = [3.0 3.0];
        % 48 50
        items = cellhorzcat(items{:}, spacer);
    end % if
    % 51 53
    mspecs.Name = 'Magnitude specifications';
    mspecs.Type = 'group';
    mspecs.Items = items;
    mspecs.LayoutGrid = [5.0 4.0];
    mspecs.RowStretch = [0.0 0.0 0.0 0.0 1.0];
    mspecs.ColStretch = [0.0 1.0 0.0 1.0];
    mspecs.Tag = 'MagSpecsGroup';
