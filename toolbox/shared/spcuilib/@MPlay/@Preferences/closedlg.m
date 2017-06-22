function closedlg(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.dialog))
        this.DialogPosition = this.dialog.position;
        this.dialog.delete;
        this.dialog = [];
    end % if
end % function
