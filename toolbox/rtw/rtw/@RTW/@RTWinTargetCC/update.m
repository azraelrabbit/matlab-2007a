function update(hSrc, event)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if strcmp(event, 'attach')
        registerPropList(hSrc, 'NoDuplicate', 'All', []);
    end % if
end % function
