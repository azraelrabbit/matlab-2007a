function getProductLicenses(this, products)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    if not(this.validatePlatformLicense)
        configData = RunTimeModule_config;
        pm_error(configData.Error.NoPlatformProductLicense_msgid);
    end % if
    % 15 17
    unlicensedProducts = {};
    % 17 19
    testDeniedProducts = SSC.RunTimeModule.denyProductLicense;
    % 19 21
    for aProduct=products
        theProduct = aProduct{1.0};
        % 22 28
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        if not(isempty(theProduct)) && not(pm_checklicense(theProduct))
            unlicensedProducts{plus(end, 1.0)} = theProduct;
        end % if
    end % for
    % 31 33
    for aDeniedProduct=testDeniedProducts
        if any(strcmp(products, aDeniedProduct))
            unlicensedProducts{plus(end, 1.0)} = aDeniedProduct{1.0};
        end % if
    end % for
    % 37 39
    if not(isempty(unlicensedProducts))
        % 39 41
        configData = RunTimeModule_config;
        % 41 43
        unlicensedProducts = sort(unique(unlicensedProducts));
        productList = sprintf('%s\n', unlicensedProducts{:});
        % 44 46
        platformProduct = pm_defaultproduct;
        % 46 48
        if any(strcmp(unlicensedProducts, platformProduct))
            pm_error(configData.Error.NoPlatformProductLicense_msgid);
        else
            pm_error(configData.Error.UnlicensedProducts_templ_msgid, productList);
        end % if
        % 52 54
    end % if
