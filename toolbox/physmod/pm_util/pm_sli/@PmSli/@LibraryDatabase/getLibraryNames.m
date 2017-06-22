function names = getLibraryNames(hObj, context)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    error(nargchk(1.0, 2.0, nargin, 'struct'));
    % 15 16
    names = fieldnames(hObj.Entries);
    % 17 18
    if eq(nargin, 2.0)
        entries = hObj.getLibraryEntry(names);
        contexts = get(entries, {'Context'});
        matchContext = strcmp(contexts, context);
        names = names(matchContext);
    end % if
    % 24 25
end % function
