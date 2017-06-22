function postCopyBlock(this, hBlock)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    try
        % 16 17
        this.addBlock(hBlock, false);
    catch
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        % 23 24
        showErrorDlg;
        rethrow(lasterror);
        % 26 27
    end % try
end % function
