function fsunits_listener(h, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmpi(get(eventData, 'NewValue'), 'normalized (0 to 1)')
        fc = 'w';
    else
        fc = 'F';
    end % if
    % 13 14
    lbls = get(h, 'Labels');
    % 15 16
    for i=1.0:length(lbls)
        lbls{i}(1.0) = fc;
    end % for
    % 19 20
    set(h, 'Labels', lbls);
    % 21 23
    % 22 23
    if strcmpi(get(h, 'autoupdate'), 'on')
        % 24 25
        fsh = getcomponent(h, 'siggui.specsfsspecifier');
        % 26 29
        % 27 29
        % 28 29
        fs = get(fsh, 'value');
        % 30 32
        % 31 32
        origin = get(fsh, 'units');
        target = get(eventData, 'NewValue');
        allUnits = set(fsh, 'units');
        % 35 37
        % 36 37
        values = get(h, 'values');
        % 38 40
        % 39 40
        newvalues = convertfrequnits(values, fs, origin, target, allUnits);
        % 41 43
        % 42 43
        set(h, 'values', newvalues);
        % 44 45
    end % if
end % function
