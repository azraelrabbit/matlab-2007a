function success = storeOneSnapshot(this, hBlock, snapshot)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        this.modelRegistry.storeBlockData(hBlock, snapshot);
        success = true;
    catch
        success = false;
    end % try
end % function
