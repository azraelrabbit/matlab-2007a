function SPSVerifyLinkStatus(block)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if isempty(spsLinkStatusMessage)
        spsLinkStatusMessage(1.0);
        % 14 16
    end % if
    % 16 19
    % 17 19
    if eq(spsLinkStatusMessage, 0.0)
        % 19 21
        return;
    end % if
    % 22 24
    sys = bdroot(block);
    % 24 27
    % 25 27
    if isequal('library', get_param(sys, 'BlockDiagramType'))
        return;
    end % if
    % 29 32
    % 30 32
    if not(isequal('initializing', get_param(sys, 'SimulationStatus')))
        return;
    end % if
    % 34 37
    % 35 37
    FirstSentense = 'The library link of the following SimPowerSystems block(s) is disabled or broken:';
    % 37 40
    % 38 40
    PowerguiInfo = getPowerguiInfo(sys);
    % 40 43
    % 41 43
    LinkStatus = get_param(block, 'LinkStatus');
    % 43 45
    switch LinkStatus
    case 'inactive'
        % 47 51
        % 48 51
        % 49 51
    case 'none'
        % 50 53
        % 51 53
        if isequal('yes', PowerguiInfo.RestoreLinks)
            % 53 56
            % 54 56
            PowerguiInfo.RestoreLinks = 'warning';
        end % if
    otherwise
        % 58 63
        % 59 63
        % 60 63
        % 61 63
        return;
    end % switch
    % 64 67
    % 65 67
    BlockName = getfullname(block);
    BlockNom = strrep(BlockName, char(10.0), ' ');
    % 68 70
    WarningID = 'SimPowerSystems:FoundDisabledLinkBlock';
    % 70 72
    switch PowerguiInfo.RestoreLinks
    case 'yes'
        % 73 77
        % 74 77
        % 75 77
        if PowerguiInfo.EchoMessage
            Message = horzcat('SimPowerSystems restored the library link of the ''', BlockNom, ''' block.');
            warning(WarningID, Message);
        end % if
        set_param(block, 'linkStatus', 'restore');
    case 'warning'
        % 82 85
        % 83 85
        if eq(spsLinkStatusMessage, 1.0)
            % 85 90
            % 86 90
            % 87 90
            % 88 90
            warning(WarningID, FirstSentense);
            disp(' ')
            % 91 94
            % 92 94
            spsLinkStatusMessage(2.0);
            % 94 96
        end % if
        % 96 98
        disp(horzcat('---> ', BlockNom))
        % 99 104
        % 100 104
        % 101 104
        % 102 104
    case 'no'
        % 103 110
        % 104 110
        % 105 110
        % 106 110
        % 107 110
        % 108 110
    end % switch
