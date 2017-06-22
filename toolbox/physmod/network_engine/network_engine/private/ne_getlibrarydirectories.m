function directories = ne_getlibrarydirectories(name)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    files = which(name, '-all');
    if not(iscell(files))
        files = cellhorzcat(files);
    end % if
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    directories = {};
    for i=1.0:length(files)
        directories{plus(end, 1.0)} = fileparts(files{i});
    end % for
    % 27 28
    directories = unique(directories);
end % function
