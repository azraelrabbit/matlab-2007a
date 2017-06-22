function [allNeighbors, allPorts] = getPmNeighbors(hThis, blk, levels, ignoreBranchingBar, nbrBlk, nbrPort)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    hNeighborFunc = mech_private('pmNeighbors');
    % 26 27
    switch nargin
    case 3.0
        [allNeighbors, allPorts] = hNeighborFunc(blk, levels);
    case 4.0
        blank = [];
        [allNeighbors, allPorts] = hNeighborFunc(blk, levels, blank, blank, ignoreBranchingBar);
    case 6.0
        [allNeighbors, allPorts] = hNeighborFunc(blk, levels, nbrBlk, nbrPort, ignoreBranchingBar);
    otherwise
        error('MECH:PmMechGuiObj:getPmNeighbors:NumArgs', 'Wrong number of arguments.');
    end % switch
end % function
