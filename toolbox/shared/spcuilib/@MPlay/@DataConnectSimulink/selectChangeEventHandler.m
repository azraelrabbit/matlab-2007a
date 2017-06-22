function selectChangeEventHandler(this, event)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if this.debug
        fprintf('DCS connect event');
        drawnow
    end % if
    if this.isPersistent || not(isRunning(this.hSLConnectMgr.hSimState))
        return;
    end % if
    % 15 17
    retval = this.hSLConnectMgr.resubscribeToData(this.srcObj);
    if not(retval)
        if this.debug
            disp('local_attach failed');
        end % if
        if this.isFloating
            this.errorStatus = 'success';
            this.srcObj.mplayObj.ScreenMsg(this.hSLConnectMgr.errMsg);
        else
            this.errorStatus = 'failure';
            this.errorMsg = this.hSLConnectMgr.errMsg;
            disconnect_state(this);
        end % if
        return;
    end % if
    % 31 35
    % 32 35
    % 33 35
    errMsg = cacheVideoSignalData(this);
    if not(isempty(errMsg))
        this.errorStatus = 'cancel';
        this.srcObj.mplayObj.ScreenMsg(errMsg);
        % 38 41
        % 39 41
        if not(this.isFloating)
            disconnect_state(this);
        end % if
        return;
    end % if
    % 45 47
    InstallDataSource(this.srcObj.mplayObj);
end % function
