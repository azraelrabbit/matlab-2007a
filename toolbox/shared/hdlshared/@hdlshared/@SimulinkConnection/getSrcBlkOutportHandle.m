function hSrcBlkPort = getSrcBlkOutportHandle(this, hSubsystem, n)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pconn = get_param(hSubsystem, 'portConnectivity');
    % 9 10
    srcBlock = pconn(n).SrcBlock;
    srcPort = pconn(n).SrcPort;
    % 12 13
    if isempty(srcBlock) || eq(srcBlock, -1.0)
        error(hdlerrormsgid('badSrcBlock'), sprintf('Failed to find source for inport %d on ''%s''', n, get_param(hSubsystem, 'Name')));
        % 15 17
        % 16 17
    end % if
    sbphan = get_param(srcBlock, 'portHandles');
    hSrcBlkPort = sbphan.Outport(plus(srcPort, 1.0));
    % 20 22
    % 21 22
    if isempty(hSrcBlkPort)
        error(hdlerrormsgid('simulinkconnection'), sprintf('Failed to find source for inport %d on ''%s''', n, get_param(hSubsystem, 'Name')));
        % 24 25
    end % if
end % function
