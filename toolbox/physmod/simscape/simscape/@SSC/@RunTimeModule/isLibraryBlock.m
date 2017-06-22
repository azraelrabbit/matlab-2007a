function isLib = isLibraryBlock(this, hBlock)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    isLib = strcmp(get_param(ssc_bdroot(objectToHandle(hBlock)), 'BlockDiagramType'), 'library');
end % function
