function hEventData = EventData(hSource, theEventName, theData)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    hEventData = uiservices.EventData(hSource, theEventName);
    % 15 16
    if gt(nargin, 2.0)
        hEventData.Data = theData;
    end % if
end % function
