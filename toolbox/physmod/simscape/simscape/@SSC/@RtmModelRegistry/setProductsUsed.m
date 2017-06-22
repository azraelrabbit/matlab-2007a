function setProductsUsed(this, mdl, productList)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    modelIdx = this.findModelEntry(mdl);
    howManyModels = length(modelIdx);
    % 11 12
    switch howManyModels
    case 1.0
        % 14 15
        this.modelInfo(modelIdx).modelData.productsUsed = productList;
    case 0.0
        % 17 19
        % 18 19
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.ModelNotRegistered_templ_msgid, pm_sanitize_name(mdl.Name));
    otherwise
        % 22 24
        % 23 24
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.MultiplyRegisteredModel_templ_msgid, pm_sanitize_name(mdl.Name));
        % 26 27
    end % switch
end % function
