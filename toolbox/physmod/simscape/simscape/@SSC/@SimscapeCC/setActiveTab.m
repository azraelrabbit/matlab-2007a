function setActiveTab(this, index)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    compList = this.getSubComponentList;
    this.SelectedTab = compList(plus(index, 1.0)).ProductName;
end % function
