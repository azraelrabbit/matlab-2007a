function dn = findDisplayName(e, idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ischar(idx)
        idx = find(strcmp(e.Strings, idx));
        if isempty(idx)
            dn = '';
            return;
        end % if
    end % if
    % 14 15
    dn = e.DisplayNames{idx};
end % function
