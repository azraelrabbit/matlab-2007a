function postLoadBlock(this, hBlock)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(this.isLibraryBlock(hBlock))
        % 10 11
        this.initializeModelEditingMode(hBlock);
        this.addBlock(hBlock, true);
        % 13 14
    end % if
end % function
