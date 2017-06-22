function getLicenseOrFail(this, block, errorMsg_configId)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    product = cellhorzcat(this.determineBlockProduct(block));
    % 11 12
    try
        % 13 14
        this.getProductLicenses(product);
    catch
        % 16 18
        % 17 18
        configData = RunTimeModule_config;
        errorData = configData.Error;
        error_msgid = getfield(errorData, errorMsg_configId);
        pm_error(error_msgid, pm_sanitize_name(block.Name), product{1.0});
        % 22 23
    end % try
end % function
