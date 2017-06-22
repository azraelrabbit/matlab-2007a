function inportHandles = getInportSrcHandles(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    subsystemName = this.StartNode.FullPath;
    % 9 11
    % 10 11
    hSubsystem = get_param(subsystemName, 'handle');
    % 12 14
    % 13 14
    phan = get_param(hSubsystem, 'PortHandles');
    % 15 16
    inportHandleArray = zeros(1.0, length(phan.Inport));
    % 17 18
    for m=1.0:length(phan.Inport)
        % 19 20
        hInport = phan.Inport(m);
        % 21 22
        inportHandleArray(m) = this.getSrcBlkOutportHandle(hSubsystem, m);
        % 23 24
    end % for
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    inportHandles = unique(inportHandleArray);
end % function
