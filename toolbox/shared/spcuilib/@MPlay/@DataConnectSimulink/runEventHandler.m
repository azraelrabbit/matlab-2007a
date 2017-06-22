function runEventHandler(this, event)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if this.debug
        disp('DCS run event');
        drawnow
    end % if
    if this.subscribeToData
        InstallDataSource(this.srcObj.mplayObj);
    end % if
end % function
