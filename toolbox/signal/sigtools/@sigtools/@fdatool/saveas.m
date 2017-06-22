function saveas(hFDA, file)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if eq(nargin, 1.0)
        file = get(hFDA, 'FileName');
        [filename, pathname] = uiputfile('*.fda', 'Save Filter Design Session', file);
        file = horzcat(pathname, filename);
    end % if
    % 14 16
    % 15 16
    if ne(filename, 0.0)
        save(hFDA, file);
    end % if
end % function
