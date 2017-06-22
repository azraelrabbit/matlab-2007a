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
    % 10 11
    items = getFrequencyUnitsWidgets(this, 2.0, items);
    % 12 14
    % 13 14
    hasfpass = not(isempty(strfind(lower(this.FrequencyConstraints), 'passband edge')));
    hasfstop = not(isempty(strfind(lower(this.FrequencyConstraints), 'stopband edge')));
    hasf3db = not(isempty(strfind(lower(this.FrequencyConstraints), '3db point')));
    hasf6db = not(isempty(strfind(lower(this.FrequencyConstraints), '6db point')));
    % 18 19
    [items, col] = addConstraint(this, 3.0, 1.0, items, hasfstop, 'Fstop', 'Fstop', 'Stopband edge');
    % 20 21
    [items, col] = addConstraint(this, 3.0, col, items, hasf6db, 'F6dB', 'F6dB', '6dB point');
    % 22 23
    [items, col] = addConstraint(this, 3.0, col, items, hasf3db, 'F3dB', 'F3dB', '3dB point');
    % 24 25
    items = addConstraint(this, 3.0, col, items, hasfpass, 'Fpass', 'Fpass', 'Passband edge');
    % 26 28
    % 27 28
    fspecs.Name = 'Frequency specifications';
    fspecs.Type = 'group';
    fspecs.Items = items;
    fspecs.LayoutGrid = [4.0 4.0];
    fspecs.RowStretch = [0.0 0.0 0.0 1.0];
    fspecs.ColStretch = [0.0 1.0 0.0 1.0];
    fspecs.Tag = 'FreqSpecsGroup';
end % function
