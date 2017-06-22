function viewReport(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.MAObj)) && not(isempty(this.MAObj.AtticData)) && not(isempty(this.MAObj.AtticData.DiagnoseRightFrame))
        this.MAObj.displayReport(this.MAObj.AtticData.DiagnoseRightFrame);
    end % if
end % function
