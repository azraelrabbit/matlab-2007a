function products = getModelProducts(this, mdl)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    products = this.modelRegistry.getProductsUsed(mdl);
    % 12 13
    if isempty(products) || not(strcmp(class(products), 'cell'))
        % 14 15
        products = this.determineModelProducts(mdl);
        this.storeModelProducts(mdl, products);
        % 17 18
    end % if
end % function
