function closeReport(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isjava(this.BrowserWindow)
        this.BrowserWindow.setVisible(false);
    end % if
end % function
