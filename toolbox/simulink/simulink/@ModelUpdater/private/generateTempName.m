function generateTempName(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(h.TempName)
        [dir, name] = fileparts(tempname);
        h.TempName = name;
        % 10 11
        new_system(h.TempName);
    end % if
    % 13 14
end % function
