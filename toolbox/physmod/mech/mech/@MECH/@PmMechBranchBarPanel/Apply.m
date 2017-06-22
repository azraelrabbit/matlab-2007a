function retStatus = Apply(hThis)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    retStatus = false;
    % 9 11
    % 10 11
    retVal = applyChildren(hThis);
    % 12 14
    % 13 14
    hSpinner = hThis.Items(1.0).Items(1.0);
    % 15 16
    nPorts = hSpinner.Value;
    nRightPorts = nPorts;
    % 18 20
    % 19 20
    rightPortNames = {};
    rightPortNames = {'__newr0'};
    for idx=2.0:nRightPorts
        rightPortNames(plus(end, 1.0)) = cellhorzcat(horzcat('SA', num2str(idx)));
    end % for
    % 25 26
    mech_support('CleanSetParam', pm_getsl_dblhandle(hThis.BlockHandle), 'RConnTags', rightPortNames);
    % 27 29
    % 28 29
    retStatus = true;
end % function
