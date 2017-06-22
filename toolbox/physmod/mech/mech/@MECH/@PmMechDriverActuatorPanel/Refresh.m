function retStatus = Refresh(hThis)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    retStatus = true;
    theBlock = pm_getsl_dblhandle(hThis.BlockHandle);
    connInfo = get_param(theBlock, 'PortConnectivity');
    % 12 14
    % 13 14
    nextBlock = connInfo(2.0).DstBlock;
    nextBlockPort = connInfo(2.0).DstPort;
    % 16 17
    targetBlk = [];
    % 18 20
    % 19 20
    ignoreBrachingBars = true;
    [myNbr, myNbrPort] = getPmNeighbors(hThis, theBlock, 1.0, ignoreBrachingBars, nextBlock, nextBlockPort);
    % 22 25
    % 23 25
    % 24 25
    if l_IsAllowedBlock(myNbr)
        targetBlk = myNbr;
    end % if
    % 28 29
    if not(isempty(targetBlk)) && ne(targetBlk, 0.0)
        targetClsName = get_param(targetBlk, 'ClassName');
        hThis.ConnectToBlockType = targetClsName;
    else
        hThis.ConnectToBlockType = '';
    end % if
    % 35 36
    try
        hThis.refreshChildren();
    catch
        retStatus = false;
        rethrow(lasterror);
    end % try
    % 42 43
end % function
function retVal = l_IsAllowedBlock(hBlk)
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    paramInfo = get_param(hBlk, 'ObjectParameters');
    if not(isfield(paramInfo, 'ClassName'))
        retVal = false;
    else
        clsName = get_param(hBlk, 'ClassName');
        % 57 59
        % 58 59
        retVal = any(strcmp(clsName, {'DistanceDriver','AngleDriver','LinearDriver','ConstantVelocity'}));
        % 60 61
    end % if
end % function
