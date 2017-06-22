function valid = validate(hObj)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if not(hObj.IsValid)
        files = which(hObj.Name, '-all');
        fileExists = eq(cellfun(@exist, files), 4.0);
        if any(fileExists)
            % 16 19
            % 17 19
            % 18 19
            hObj.File = files{find(fileExists, 1.0)};
            hObj.IsValid = true;
        else
            pm_warning('pm_sli:PmSli:LibraryEntry:InvalidLibraryName', hObj.Name);
        end % if
    end % if
    valid = hObj.IsValid;
end % function
