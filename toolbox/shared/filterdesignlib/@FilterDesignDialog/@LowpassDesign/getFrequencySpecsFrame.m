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
    hasfpass = not(isempty(strfind(lower(this.FrequencyConstraints), 'passband edge')));
    hasfstop = not(isempty(strfind(lower(this.FrequencyConstraints), 'stopband edge')));
    hasf3db = not(isempty(strfind(lower(this.FrequencyConstraints), '3db point')));
    hasf6db = not(isempty(strfind(lower(this.FrequencyConstraints), '6db point')));
    % 19 20
    [items, col] = addConstraint(this, 3.0, 1.0, items, hasf3db, 'F3dB', 'F3dB', '3dB point');
    % 21 22
    [items, col] = addConstraint(this, 3.0, col, items, hasf6db, 'F6dB', 'F6dB', '6dB point');
    % 23 24
    [items, col] = addConstraint(this, 3.0, col, items, hasfpass, 'Fpass', 'Fpass', 'Passband edge');
    % 25 26
    items = addConstraint(this, 3.0, col, items, hasfstop, 'Fstop', 'Fstop', 'Stopband edge');
    % 27 29
    % 28 29
    fspecs.Name = 'Frequency specifications';
    fspecs.Type = 'group';
    fspecs.Items = items;
    fspecs.LayoutGrid = [4.0 4.0];
    fspecs.RowStretch = [0.0 0.0 0.0 1.0];
    fspecs.ColStretch = [0.0 1.0 0.0 1.0];
    fspecs.Tag = 'FreqSpecsGroup';
end % function
