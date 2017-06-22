function handleButtons(this, arg)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hDlg = this.dialog;
    switch lower(arg)
    case 'select'
        % 9 19
        % 10 19
        % 11 19
        % 12 19
        % 13 19
        % 14 19
        % 15 19
        % 16 19
        % 17 19
        treeNodeStr = hDlg.getWidgetValue('tree');
        if isempty(treeNodeStr)
            treeNodeStr = '';
        end % if
        this.dialogSelection = treeNodeStr;
        hDlg.refresh;
    case 'refresh'
        % 25 27
        this.show;
    otherwise
        % 28 30
        delete(hDlg);
    end % switch
