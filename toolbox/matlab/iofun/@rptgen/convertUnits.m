function newDims = convertUnits(oldDims, oldUnit, newUnit)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if not(strcmpi(oldUnit, newUnit))
        % 12 13
        oldUnits = get(0.0, 'units');
        % 14 15
        set(0.0, 'Units', oldUnit);
        oldScreenSize = get(0.0, 'screensize');
        % 17 18
        set(0.0, 'units', newUnit);
        newScreenSize = get(0.0, 'screensize');
        % 20 21
        set(0.0, 'units', oldUnits);
        % 22 23
        newDims = rdivide(times(oldDims, newScreenSize(3.0)), oldScreenSize(3.0));
    else
        newDims = oldDims;
    end % if
end % function
