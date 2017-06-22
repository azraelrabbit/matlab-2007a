function exploreAction(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isempty(this.PathName)
        % 9 11
        % 10 11
        refreshReportList(RptgenML.Root, false);
    else
        addReport(RptgenML.Root, fullfile(this.PathName, this.FileName));
    end % if
end % function
