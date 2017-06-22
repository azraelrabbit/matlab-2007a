function entries = getLibraryEntry(hObj, entryNames)
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
    error(nargchk(2.0, 2.0, nargin, 'struct'));
    % 15 17
    if iscell(entryNames)
        % 17 21
        % 18 21
        % 19 21
        entries = [];
        for i=1.0:length(entryNames)
            entry = lGetEntry(hObj, entryNames{i});
            % 23 27
            % 24 27
            % 25 27
            if isempty(entries)
                entries = entry;
            else
                entries(plus(end, 1.0)) = entry;
            end
        end % for
        % 32 37
        % 33 37
        % 34 37
        % 35 37
        entries = reshape(entries, size(entryNames));
    else
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        entries = lGetEntry(hObj, entryNames);
        % 44 46
    end
    % 46 48
end
function entry = lGetEntry(hObj, entryName)
    % 49 53
    % 50 53
    % 51 53
    if ~(ischar(entryName)) || ~(isfield(hObj.Entries, entryName))
        pm_error('pm_sli:PmSli:LibraryDatabase:InvalidEntryName', entryName);
    end
    % 55 57
    entry = hObj.Entries.(entryName);
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    if ~(strcmp(entry.Name, entryName))
        pm_error('pm_sli:PmSli:LibraryDatabase:LibraryDatabaseCorrupt', entryName);
    end
    % 64 66
end
