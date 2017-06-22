function writeCachedDataToModel(this, mdl)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    [topologyChecksum, parameterChecksum] = this.getCachedModelChecksum(mdl);
    products = this.getModelProducts(mdl);
    % 12 13
    configData = RunTimeModule_config;
    % 14 15
    getConfigSetCC = ssc_private('ssc_get_configset');
    [activeSimscapeCC, allSimscapeCC] = getConfigSetCC(mdl);
    % 17 18
    numCC = numel(allSimscapeCC);
    for j=1.0:numCC
        allSimscapeCC(j).set(configData.ProductsUsed.PropertyName, products);
        allSimscapeCC(j).set(configData.ModelTopologyChecksum.PropertyName, topologyChecksum);
        allSimscapeCC(j).set(configData.ModelParameterChecksum.PropertyName, parameterChecksum);
    end % for
end % function
