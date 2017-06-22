function hMessageLog = MessageLog(titlePrefix, hAppInst)
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
    hMessageLog = uiservices.MessageLog;
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    if lt(nargin, 1.0)
        titlePrefix = 'Message Log';
    end
    if lt(nargin, 2.0)
        hAppInst = [];
    end
    hMessageLog.init(titlePrefix, hAppInst);
    % 30 40
    % 31 40
    % 32 40
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    eventData = uiservices.EventData(hMessageLog, 'LogUpdated', hMessageLog);
    hMessageLog.listen_prop_LinkedLogs = handle.listener(hMessageLog, hMessageLog.findprop('LinkedLogs'), 'PropertyPostSet', @(hh,ev)updateForLinkedLog(hMessageLog,eventData));
    % 41 43
end
