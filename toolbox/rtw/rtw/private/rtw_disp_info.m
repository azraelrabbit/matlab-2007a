function rtw_disp_info(iMdl, iSummary, iMsg)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    OkayToPushNag = rtwprivate('rtwattic', 'getOkayToPushNag');
    % 17 18
    if OkayToPushNag
        nag = slsfnagctlr('NagTemplate');
        nag.type = 'Log';
        nag.msg.details = iMsg;
        nag.msg.type = 'Build';
        nag.msg.summary = iSummary;
        nag.component = 'RTW';
        nag.sourceName = iMdl;
        nag.sourceFullName = iMdl;
        slsfnagctlr('Naglog', 'push', nag);
        % 28 30
        % 29 30
        disp(iMsg);
    else
        disp(iMsg);
    end % if
end % function
