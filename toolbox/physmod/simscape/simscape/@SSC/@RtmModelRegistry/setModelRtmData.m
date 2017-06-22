function setModelRtmData(this, mdl, modelTopologyChecksum, modelParameterChecksum, productList)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    idx = this.createModelEntry(mdl);
    % 8 9
    this.modelInfo(idx).modelData.modelTopologyChecksum = modelTopologyChecksum;
    this.modelInfo(idx).modelData.modelParameterChecksum = modelParameterChecksum;
    % 11 12
    if ge(nargin, 5.0)
        this.setProductsUsed(mdl, productList);
        if isempty(productList) || not(iscell(productList))
            this.modelInfo(idx).modelData.isModelPreRtm = true;
        end % if
    end % if
end % function
