function resetFcnImplementationCounts(hRtwFcnLib)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    RtwFcnEntries = getChildren(hRtwFcnLib);
    for i=1.0:length(RtwFcnEntries)
        RtwFcnImps = getChildren(RtwFcnEntries(i));
        for j=1.0:length(RtwFcnImps)
            RtwFcnImps(j).resetUsage;
        end % for
    end % for
    % 19 21
    % 20 21
    hRtwFcnLib.MCallList = [];
    hRtwFcnLib.TLCCallList = [];
end % function
