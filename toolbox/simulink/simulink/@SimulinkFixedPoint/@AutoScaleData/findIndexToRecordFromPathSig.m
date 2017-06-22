function iFound = findIndexToRecordFromPathSig(h, curPath, signalName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    curPathClean = strrep(curPath, sprintf('\n'), ' ');
    % 7 8
    haveResetCache = false;
    % 9 10
    if ne(length(h.enrichedPathsForQuickSearch), length(h.enrichedFixPtSimRanges))
        % 11 13
        % 12 13
        h.resetQuickSearchData();
        haveResetCache = true;
    end % if
    % 16 17
    iFound = [];
    % 18 19
    iSetFound = find(strcmp(h.enrichedPathsForQuickSearch, curPathClean));
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if not(haveResetCache)
        % 26 27
        for jj=1.0:length(iSetFound)
            % 28 29
            curIdx = iSetFound(jj);
            % 30 31
            truePathClean = strrep(h.enrichedFixPtSimRanges{curIdx}.Path, sprintf('\n'), ' ');
            % 32 33
            if not(strcmp(truePathClean, curPathClean))
                % 34 35
                h.resetQuickSearchData();
                iSetFound = find(strcmp(h.enrichedPathsForQuickSearch, curPathClean));
                haveResetCache = true;
                break
            end % if
        end % for
    end % if
    % 42 43
    if not(isempty(iSetFound))
        % 44 47
        % 45 47
        % 46 47
        if isempty(signalName)
            % 48 51
            % 49 51
            % 50 51
            iFound = iSetFound(1.0);
        else
            for jj=1.0:length(iSetFound)
                % 54 55
                curIdx = iSetFound(jj);
                % 56 57
                if strcmp(h.enrichedFixPtSimRanges{curIdx}.SignalName, signalName)
                    % 58 59
                    iFound = curIdx;
                    break
                end % if
            end % for
        end % if
    end % if
end % function
