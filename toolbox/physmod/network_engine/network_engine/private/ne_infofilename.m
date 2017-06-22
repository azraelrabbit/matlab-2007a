function infoFileName = ne_infofilename(fileName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [directory, baseName] = fileparts(fileName);
    infoFileName = fullfile(directory, 'extra', baseName);
    infoFileName = horzcat(infoFileName, '.info');
    % 11 12
end % function
