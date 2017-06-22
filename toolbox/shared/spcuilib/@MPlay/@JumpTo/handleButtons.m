function handleButtons(this, buttonStr)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch buttonStr
    case {'OK','Apply'}
        % 8 13
        % 9 13
        % 10 13
        % 11 13
        [success, err] = this.validate;
        if not(success)
            errordlg(err, 'Jump to frame', 'modal');
        else
            % 16 21
            % 17 21
            % 18 21
            % 19 21
            mplayObj = get(this.hfig, 'userdata');
            JumpTo(mplayObj.datasourceObj.playbackControls);
            % 22 25
            % 23 25
            if strcmp(lower(buttonStr), 'ok')
                delete(this.dialog);
            end % if
        end % if
    otherwise
        delete(this.dialog);
    end % switch
