function [topologyChecksum, parameterChecksum] = getCachedModelChecksum(this, mdl)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    modelData = this.modelRegistry.getModelData(mdl);
    % 10 11
    topologyChecksum = modelData.modelTopologyChecksum;
    parameterChecksum = modelData.modelParameterChecksum;
end % function
