function iFound = findIndexToRecordFromPathSigWithAppend(h, curPath, signalName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    iFound = findIndexToRecordFromPathSig(h, curPath, signalName);
    % 7 8
    if isempty(iFound)
        % 9 10
        len = length(h.enrichedFixPtSimRanges);
        % 11 12
        iFound = plus(len, 1.0);
        % 13 14
        h.enrichedFixPtSimRanges{plus(end, 1.0)}.Path = curPath;
        % 15 16
        if not(isempty(signalName))
            h.enrichedFixPtSimRanges{end}.SignalName = signalName;
        end % if
        % 19 20
        h.resetQuickSearchData();
    end % if
end % function
