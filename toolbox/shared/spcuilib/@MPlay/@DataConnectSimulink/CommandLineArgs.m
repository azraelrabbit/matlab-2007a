function args = CommandLineArgs(dcs)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    theBlock = dcs.sourceName;
    if isempty(dcs.hSLConnectMgr)
        thePort = [];
    else
        thePort = dcs.hSLConnectMgr.getPortIndices;
    end % if
    args = cellhorzcat(cellhorzcat(theBlock, thePort));
end % function
