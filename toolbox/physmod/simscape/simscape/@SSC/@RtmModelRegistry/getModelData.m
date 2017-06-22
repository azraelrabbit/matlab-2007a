function modelData = getModelData(this, mdl)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    idx = this.findModelEntry(mdl);
    % 8 9
    if not(isempty(idx))
        % 10 11
        modelDataEntry = this.modelInfo(idx).modelData;
    else
        % 13 15
        % 14 15
        modelEntry = newModelEntry;
        modelDataEntry = modelEntry.modelData;
        % 17 18
    end % if
    % 19 20
    modelData.isRegistered = modelDataEntry.registered;
    modelData.isBeingExamined = modelDataEntry.examining;
    modelData.modelTopologyChecksum = modelDataEntry.modelTopologyChecksum;
    modelData.isModelPreRtm = modelDataEntry.isModelPreRtm;
    modelData.modelParameterChecksum = modelDataEntry.modelParameterChecksum;
end % function
