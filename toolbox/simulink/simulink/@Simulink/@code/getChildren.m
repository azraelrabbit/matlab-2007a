function val = getChildren(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    val = vertcat(this.htmlReportObj(:), horzcat(this.BuildDirSrcObj), horzcat(this.BuildDirHelperObj), horzcat(this.SharedDirObj), this.submodels(:), this.subsystems(:));
end % function
