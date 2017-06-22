function handleButtons(this, buttonStr)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    d = this.dialog;
    % 7 9
    switch buttonStr
    case 'Import'
        % 10 13
        % 11 13
        [success, err] = this.validate;
        if not(success)
            errordlg(err, 'Import from Workspace', 'modal');
        else
            % 16 19
            % 17 19
            delete(d);
            mplayObj = get(this.hfig, 'userdata');
            mplayObj.ConnectToDataSource(@MPlay.SrcWksp);
        end % if
    case 'ListBox'
        % 23 27
        % 24 27
        % 25 27
        row = plus(1.0, getWidgetValue(d, 'WorkspaceVars'));
        % 27 29
        ws_names = getUserData(d, 'WorkspaceVars');
        this_name = ws_names{row};
        % 30 32
        d.setWidgetValue('mlvar', this_name);
    case 'Refresh'
        % 33 35
        this.show;
    case 'Help'
        % 36 38
        doc('mplay');
    otherwise
        % 39 41
        delete(d);
    end % switch
