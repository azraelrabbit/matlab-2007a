function success = snapshotBlock(this, block)
    % 1 5
    % 2 5
    % 3 5
    snapshot = this.createBlockSnapshot(block);
    % 5 7
    success = not(isempty(snapshot)) && this.storeOneSnapshot(block, snapshot);
end
