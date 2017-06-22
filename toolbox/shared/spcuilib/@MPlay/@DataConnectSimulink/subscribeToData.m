function retval = subscribeToData(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(this.hSLConnectMgr)
        retval = false;
        if this.debug
            disp('connectiong manager object is not empty');
        end % if
        return;
    end % if
    % 16 17
    retval = this.hSLConnectMgr.subscribeToData(this.srcObj);
    if not(retval)
        % 19 20
        if this.debug
            disp('local_attach failed');
        end % if
        % 23 24
        if this.isFloating
            this.errorStatus = 'success';
        else
            this.errorStatus = 'failure';
            this.errorMsg = this.hSLConnectMgr.errMsg;
            disconnect_state(this);
        end % if
        % 31 32
        this.srcObj.mplayObj.ScreenMsg(this.hSLConnectMgr.errMsg);
        return;
    end % if
    % 35 38
    % 36 38
    % 37 38
    errMsg = cacheVideoSignalData(this);
    if not(isempty(errMsg))
        this.errorStatus = 'cancel';
        this.srcObj.mplayObj.ScreenMsg(errMsg);
        % 42 44
        % 43 44
        if not(this.isFloating)
            disconnect_state(this);
        end % if
        retval = false;
        return;
    end % if
end % function
