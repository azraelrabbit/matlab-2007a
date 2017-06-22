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
    % 12 13
    switch lower(this.FrequencyConstraints)
    case 'passband edges'
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Fpass1', 'Fpass1', 'First passband edge');
        % 16 17
        items = addConstraint(this, 3.0, col, items, true, 'Fpass2', 'Fpass2', 'Second passband edge');
    case 'stopband edges'
        % 19 20
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Fstop1', 'Fstop1', 'First stopband edge');
        % 21 22
        items = addConstraint(this, 3.0, col, items, true, 'Fstop2', 'Fstop2', 'Second stopband edge');
    case 'passband and stopband edges'
        % 24 25
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'Fstop1', 'Fstop1', 'First stopband edge');
        % 26 27
        items = addConstraint(this, 3.0, col, items, true, 'Fpass1', 'Fpass1', 'First passband edge');
        % 28 29
        [items, col] = addConstraint(this, 4.0, 1.0, items, true, 'Fpass2', 'Fpass2', 'Second passband edge');
        % 30 31
        items = addConstraint(this, 4.0, col, items, true, 'Fstop2', 'Fstop2', 'Second stopband edge');
    case '3db points'
        % 33 34
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'F3dB1', 'F3dB1', 'First 3dB point');
        % 35 36
        items = addConstraint(this, 3.0, col, items, true, 'F3dB2', 'F3dB2', 'Second 3dB point');
    case '6db points'
        % 38 39
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'F6dB1', 'F6dB1', 'First 6dB point');
        % 40 41
        items = addConstraint(this, 3.0, col, items, true, 'F6dB2', 'F6dB2', 'Second 6dB point');
    case '3db points and stopband width'
        % 43 44
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'F3dB1', 'F3dB1', 'First 3dB point');
        % 45 46
        items = addConstraint(this, 3.0, col, items, true, 'F3dB2', 'F3dB2', 'Second 3dB point');
        % 47 48
        items = addConstraint(this, 4.0, 1.0, items, true, 'BWstop', 'Stopband width:');
    case '3db points and passband width'
        % 50 51
        [items, col] = addConstraint(this, 3.0, 1.0, items, true, 'F3dB1', 'F3dB1', 'First 3dB point');
        % 52 53
        items = addConstraint(this, 3.0, col, items, true, 'F3dB2', 'F3dB2', 'Second 3dB point');
        % 54 55
        items = addConstraint(this, 4.0, 1.0, items, true, 'BWpass', 'Passband width:');
        % 56 57
    end % switch
    % 58 59
    fspecs.Name = 'Frequency specifications';
    fspecs.Type = 'group';
    fspecs.Items = items;
    fspecs.LayoutGrid = [5.0 4.0];
    fspecs.RowStretch = [0.0 0.0 0.0 0.0 1.0];
    fspecs.ColStretch = [0.0 1.0 0.0 1.0];
    fspecs.Tag = 'FreqSpecsGroup';
end % function
