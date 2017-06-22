function runAction(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.MAC))
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('MESleep');
        try
            this.MAObj.runAction(this.MACIndex, this);
        catch
            ed.broadcastEvent('MEWake');
            rethrow(lasterror);
        end % try
        ed.broadcastEvent('MEWake');
    end % if
end % function
