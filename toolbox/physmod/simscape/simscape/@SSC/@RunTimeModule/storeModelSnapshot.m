function success = storeModelSnapshot(this, mdl)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    success = true;
    % 10 11
    actualTopologyChecksum = this.computeModelTopologyChecksum(mdl);
    actualParameterChecksum = this.computeModelParameterChecksum(mdl);
    this.storeCachedModelChecksum(mdl, actualTopologyChecksum, actualParameterChecksum);
    this.storeModelBlocksSnapshot(mdl);
end % function
