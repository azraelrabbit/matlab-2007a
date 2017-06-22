function index = getActiveTab(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    compList = this.getSubComponentList;
    currentTab = this.SelectedTab;
    % 8 10
    index = find(strcmp(cellhorzcat(compList.TabName), currentTab));
    % 10 12
    if isempty(index)
        % 12 16
        % 13 16
        % 14 16
        index = 0.0;
    else
        % 17 20
        % 18 20
        if gt(length(index), 1.0)
            pm_error('platform:SSC:SimscapeCC:getActiveTab:RepeatedProductEntries', currentTab, getComponentName);
            % 21 23
            index = 1.0;
        end % if
        % 24 27
        % 25 27
        index = minus(index, 1.0);
    end % if
end % function
