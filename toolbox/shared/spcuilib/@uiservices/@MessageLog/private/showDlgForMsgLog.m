function showDlgForMsgLog(hMsgLog_this, hMsgLog_changed)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    dlgAlreadyOpen = not(isempty(hMsgLog_this.dialog)) && ishandle(hMsgLog_this.dialog);
    % 7 9
    if dlgAlreadyOpen
        doShow = true;
    else
        % 11 16
        % 12 16
        % 13 16
        % 14 16
        ao = strmatch(hMsgLog_this.AutoOpenMode, {'for any new messages','for warn/fail messages','only for fail messages','manually'});
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        if eq(ao, 4.0)
            % 22 24
            doShow = false;
        else
            % 25 32
            % 26 32
            % 27 32
            % 28 32
            % 29 32
            % 30 32
            hMergedLog = cacheMergedLog(hMsgLog_changed);
            % 32 34
            if eq(ao, 1.0)
                % 34 37
                % 35 37
                doShow = gt(iterator.numImmediateChildren(hMergedLog), 0.0);
            else
                % 38 43
                % 39 43
                % 40 43
                % 41 43
                allTypes = iterator.visitImmediateChildren(hMergedLog, @(hItem)hItem.Type);
                % 43 54
                % 44 54
                % 45 54
                % 46 54
                % 47 54
                % 48 54
                % 49 54
                % 50 54
                % 51 54
                % 52 54
                doShow = not(isempty(strmatch('fail', allTypes))) || (eq(ao, 2.0) && not(isempty(strmatch('warn', allTypes))));
                % 54 56
            end
        end
    end
    % 58 60
    if doShow
        % 60 63
        % 61 63
        show(hMsgLog_this);
    end
end
