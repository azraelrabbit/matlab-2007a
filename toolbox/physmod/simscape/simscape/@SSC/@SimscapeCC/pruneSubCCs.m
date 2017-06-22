function pruneSubCCs(this, products)
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
    subCCs = this.getSubComponentList;
    for ccInfo=subCCs
        % 13 14
        if not(strcmp(ccInfo.ProductName, this.getComponentName)) && not(any(strcmp(ccInfo.ProductName, products))) && not(isempty(this.getComponent(ccInfo.ProductName)))
            % 15 19
            % 16 19
            % 17 19
            % 18 19
            this.detachComponent(ccInfo.ProductName);
            % 20 21
        end % if
        % 22 23
    end % for
end % function
