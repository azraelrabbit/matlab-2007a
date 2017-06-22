function s = getOutlineString(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if strcmp(c.Source, 'MATFILE')
        autoName = sprintf('File %s', c.Filename);
    else
        autoName = 'MATLAB workspace';
    end % if
    % 15 16
    s = sprintf('%s - %s', c.getName, autoName);
end % function
