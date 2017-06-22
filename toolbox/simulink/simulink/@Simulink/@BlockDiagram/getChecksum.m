function [checksum, additionalInfo] = getChecksum(mdlH)
    % 1 79
    % 2 79
    % 3 79
    % 4 79
    % 5 79
    % 6 79
    % 7 79
    % 8 79
    % 9 79
    % 10 79
    % 11 79
    % 12 79
    % 13 79
    % 14 79
    % 15 79
    % 16 79
    % 17 79
    % 18 79
    % 19 79
    % 20 79
    % 21 79
    % 22 79
    % 23 79
    % 24 79
    % 25 79
    % 26 79
    % 27 79
    % 28 79
    % 29 79
    % 30 79
    % 31 79
    % 32 79
    % 33 79
    % 34 79
    % 35 79
    % 36 79
    % 37 79
    % 38 79
    % 39 79
    % 40 79
    % 41 79
    % 42 79
    % 43 79
    % 44 79
    % 45 79
    % 46 79
    % 47 79
    % 48 79
    % 49 79
    % 50 79
    % 51 79
    % 52 79
    % 53 79
    % 54 79
    % 55 79
    % 56 79
    % 57 79
    % 58 79
    % 59 79
    % 60 79
    % 61 79
    % 62 79
    % 63 79
    % 64 79
    % 65 79
    % 66 79
    % 67 79
    % 68 79
    % 69 79
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    mdl = get_param(mdlH, 'Name');
    simStatus = get_param(mdl, 'SimulationStatus');
    if not(strcmpi(simStatus, 'paused'))
        feval(mdl, 'initForChecksumsOnly', 'rtwgen');
        needToTerm = true;
    else
        needToTerm = false;
    end % if
    % 87 88
    try
        % 89 90
        checksum = get_param(mdl, 'ModelChecksum');
        % 91 92
        if ge(nargout, 2.0)
            additionalInfo.ContentsChecksum = get_param(mdl, 'ModelContentsChecksum');
            additionalInfo.InterfaceChecksum = get_param(mdl, 'ModelInterfaceChecksum');
            additionalInfo.ContentsChecksumItems = get_param(mdl, 'ModelContentsChecksumDetails');
            % 96 97
            additionalInfo.InterfaceChecksumItems = get_param(mdl, 'ModelInterfaceChecksumDetails');
            % 98 99
        end % if
    catch
        % 101 102
        localCleanup(mdl, needToTerm);
        rethrow(lasterror)
    end % try
    % 105 106
    localCleanup(mdl, needToTerm);
end % function
function localCleanup(mdl, needToTerm)
    % 109 110
    if needToTerm
        feval(mdl, 'term');
    end % if
end % function
