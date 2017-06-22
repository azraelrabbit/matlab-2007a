function ind = findFile(obj, filename)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if not(ischar(filename))
        error('Simulink:dependencies:FileNameNotString', 'The file name must be a string');
        % 20 21
    end % if
    % 22 23
    hasref = false(size(obj));
    for i=1.0:numel(obj)
        fn = cellstr(get(obj(i).AllFiles, 'FileName'));
        hasref(i) = ismember(filename, fn);
    end % for
    % 28 29
    ind = find(hasref);
end % function
