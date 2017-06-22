function contains = containsEntry(hObj, entryName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if ~(iscell(entryName))
        entryName = cellhorzcat(entryName);
    end
    contains = repmat(false, 1.0, numel(entryName));
    isLibraryInDatabase = isfield(hObj.Entries, entryName);
    entriesInDatabase = entryName(isLibraryInDatabase);
    containsEntry = repmat(false, 1.0, numel(entriesInDatabase));
    for idx=1.0:numel(entriesInDatabase)
        entry = hObj.Entries.(entriesInDatabase{idx});
        containsEntry(idx) = entry.validate();
    end % for
    % 19 21
    contains(isLibraryInDatabase) = containsEntry;
end
