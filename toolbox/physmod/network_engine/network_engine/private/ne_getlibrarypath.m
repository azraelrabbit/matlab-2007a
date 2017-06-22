function p = ne_getlibrarypath(elementFile, libraryName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    element_directory = fileparts(elementFile);
    p = fullfile(element_directory, 'extra', horzcat(libraryName, '.', mexext));
    % 10 11
end % function
