function [checksum, additionalInfo] = getChecksum(subsys)
    % 1 77
    % 2 77
    % 3 77
    % 4 77
    % 5 77
    % 6 77
    % 7 77
    % 8 77
    % 9 77
    % 10 77
    % 11 77
    % 12 77
    % 13 77
    % 14 77
    % 15 77
    % 16 77
    % 17 77
    % 18 77
    % 19 77
    % 20 77
    % 21 77
    % 22 77
    % 23 77
    % 24 77
    % 25 77
    % 26 77
    % 27 77
    % 28 77
    % 29 77
    % 30 77
    % 31 77
    % 32 77
    % 33 77
    % 34 77
    % 35 77
    % 36 77
    % 37 77
    % 38 77
    % 39 77
    % 40 77
    % 41 77
    % 42 77
    % 43 77
    % 44 77
    % 45 77
    % 46 77
    % 47 77
    % 48 77
    % 49 77
    % 50 77
    % 51 77
    % 52 77
    % 53 77
    % 54 77
    % 55 77
    % 56 77
    % 57 77
    % 58 77
    % 59 77
    % 60 77
    % 61 77
    % 62 77
    % 63 77
    % 64 77
    % 65 77
    % 66 77
    % 67 77
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    % 76 77
    mdl = get_param(bdroot(subsys), 'name');
    simStatus = get_param(mdl, 'SimulationStatus');
    if not(strcmpi(simStatus, 'paused'))
        feval(mdl, 'initForChecksumsOnly', 'rtwgen');
        needToTerm = true;
    else
        needToTerm = false;
    end % if
    % 85 86
    try
        checksum = get_param(subsys, 'StructuralChecksum');
        % 88 89
        if ge(nargout, 2.0)
            additionalInfo.ContentsChecksum = get_param(subsys, 'ContentsChecksum');
            additionalInfo.InterfaceChecksum = get_param(subsys, 'InterfaceChecksum');
            additionalInfo.ContentsChecksumItems = get_param(subsys, 'ContentsChecksumDetails');
            % 93 94
            additionalInfo.InterfaceChecksumItems = get_param(subsys, 'InterfaceChecksumDetails');
            % 95 96
        end % if
    catch
        localCleanup(mdl, needToTerm)
        rethrow(lasterror)
    end % try
    % 101 102
    localCleanup(mdl, needToTerm)
end % function
function localCleanup(mdl, needToTerm)
    % 105 107
    % 106 107
    if needToTerm
        feval(mdl, 'term');
    end % if
end % function
