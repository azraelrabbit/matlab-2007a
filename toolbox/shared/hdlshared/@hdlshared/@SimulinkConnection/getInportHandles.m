function inportHandles = getInportHandles(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dutName = this.StartNode.FullPath;
    % 8 10
    % 9 10
    hSubsystem = get_param(dutName, 'handle');
    % 11 13
    % 12 13
    phan = get_param(hSubsystem, 'PortHandles');
    % 14 16
    % 15 16
    inportHandles = phan.Inport;
end % function
