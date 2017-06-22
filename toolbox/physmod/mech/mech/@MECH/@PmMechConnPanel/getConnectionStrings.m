function getConnectionStrings(hThis)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    neighbors = [];
    nbrPorts = [];
    % 8 10
    defaultConnStatus = xlate('<not connected>');
    hThis.BaseDisplay = defaultConnStatus;
    hThis.FollowerDisplay = defaultConnStatus;
    % 12 15
    % 13 15
    frames = cellhorzcat(defaultConnStatus, defaultConnStatus);
    blkNames = {'',''};
    % 16 18
    theBlock = pm_getsl_dblhandle(hThis.BlockHandle);
    if not(ishandle(theBlock))
        error('PmMechConnPanel:getConnectionStrings:InvalidHandle', 'Invalid block handle');
    end % if
    % 21 23
    pstruct = get_param(theBlock, 'PortConnectivity');
    % 23 26
    % 24 26
    portIdx = 1.0;
    for idx=1.0:2.0
        if not(isempty(pstruct(portIdx).DstBlock))
            % 28 31
            % 29 31
            [myNbr, myNbrPort] = getPmNeighbors(hThis, theBlock, 1.0, true, pstruct(portIdx).DstBlock, pstruct(portIdx).DstPort);
            % 31 34
            % 32 34
            if local_isaBodyClass(myNbr)
                neighbors = horzcat(neighbors, myNbr);
                nbrPorts = horzcat(nbrPorts, myNbrPort);
                frames{idx} = get_param(myNbrPort, 'Tag');
                blkNames{idx} = get_param(myNbr, 'Name');
            else
                if local_isaGroundClass(myNbr)
                    neighbors = horzcat(neighbors, myNbr);
                    nbrPorts = horzcat(nbrPorts, myNbrPort);
                    frames{idx} = 'GND';
                    blkNames{idx} = get_param(myNbr, 'Name');
                else
                    frames{idx} = xlate('<not connected to a body>');
                end % if
            end % if
        end % if
        portIdx = plus(length(get_param(theBlock, 'LConnTags')), 1.0);
    end % for
    if not(isempty(blkNames{1.0}))
        hThis.BaseDisplay = horzcat(frames{1.0}, '@', local_cleanUpName(blkNames{1.0}));
    end % if
    if not(isempty(blkNames{2.0}))
        hThis.FollowerDisplay = horzcat(frames{2.0}, '@', local_cleanUpName(blkNames{2.0}));
    end % if
    % 57 59
    hThis.TestString = horzcat(frames{2.0}, '@', blkNames{2.0});
end % function
function Yes = local_isaBodyClass(theBlock)
    % 61 63
    Yes = strcmp(get_param(theBlock, 'ClassName'), 'Body');
end % function
function Yes = local_isaGroundClass(theBlock)
    % 65 67
    Yes = strcmp(get_param(theBlock, 'ClassName'), 'Ground');
end % function
function cleanName = local_cleanUpName(nameStr)
    % 69 72
    % 70 72
    if isempty(nameStr)
        cleanName = '';
        return;
    end % if
    % 75 77
    rem = nameStr;
    cleanName = '';
        while true
        [token, rem] = strtok(rem);
        if not(isempty(token))
            cleanName = horzcat(cleanName, ' ', token);
        else
            break
        end % if
    end % while
    % 86 88
    cleanName = strtrim(cleanName);
end % function
