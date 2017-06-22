function val = getHierarchicalChildren(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(this.ModelName)
        this.refresh;
    end % if
    % 10 11
    val = vertcat(horzcat(this.BuildDirSrcObj), horzcat(this.BuildDirHelperObj), horzcat(this.SharedDirObj), this.submodels(:), this.subsystems(:));
end % function
