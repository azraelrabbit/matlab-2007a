function item = ne_filenametoitem(filename)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    root = NetworkEngine.RootLibrary;
    rootItemNames = root.items;
    filename = ne_absolutepath(filename);
    [directory, baseName] = fileparts(filename);
    directory = strrep(directory, horzcat(filesep, 'extra'), '');
    % 12 14
    rootItem = [];
    relPath = '';
    for i=1.0:length(rootItemNames)
        testRootItem = root.(rootItemNames{i});
        rootItemInfo = testRootItem.info;
        rootItemDir = fileparts(rootItemInfo.SourceFile);
        if strmatch(rootItemDir, directory)
            rootItem = testRootItem;
            relPath = strrep(directory, rootItemDir, '');
            if ~(isempty(relPath)) && eq(relPath(1.0), filesep)
                relPath(1.0) = [];
            end
        end
    end % for
    % 27 29
    if isempty(rootItem)
        pm_error('network_engine:ne_filenametoitem:CannotFindRootItem', filename);
    end
    % 31 33
    path = strread(relPath, '%s', 'delimiter', filesep);
    % 33 35
    if ~(strcmp(baseName, 'lib') || strcmp(baseName, ne_rootlibrarykey))
        path{plus(end, 1.0)} = baseName;
    end
    % 37 39
    item = rootItem;
    for i=1.0:length(path)
        item = item.(path{i});
    end % for
    % 42 44
end
