function success = clearModelSnapshot(this, hModel)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    success = true;
    % 8 11
    % 9 11
    success = this.clearModelTopologySnapshot(hModel) && this.clearModelBlocksSnapshot(hModel);
end
