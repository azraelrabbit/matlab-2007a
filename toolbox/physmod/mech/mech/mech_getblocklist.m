function pmList = mech_getblocklist(handle, excludeList, ignoreList, portNum)
    % 1 28
    % 2 28
    % 3 28
    % 4 28
    % 5 28
    % 6 28
    % 7 28
    % 8 28
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    if lt(nargin, 2.0)
        excludeList = [];
    end
    % 30 32
    if lt(nargin, 3.0)
        ignoreList = [];
    end
    % 34 36
    if lt(nargin, 4.0)
        portNum = [];
    end
    % 38 40
    numberOfExclusions = mrdivide(length(excludeList), 2.0);
    excludeParams = cellhorzcat(excludeList{1.0:2.0:mtimes(2.0, numberOfExclusions)});
    excludeVals = cellhorzcat(excludeList{2.0:2.0:mtimes(2.0, numberOfExclusions)});
    % 42 44
    numberOfIgnore = mrdivide(length(ignoreList), 2.0);
    ignoreParams = cellhorzcat(ignoreList{1.0:2.0:mtimes(2.0, numberOfIgnore)});
    ignoreVals = cellhorzcat(ignoreList{2.0:2.0:mtimes(2.0, numberOfIgnore)});
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    haveVisited = [];
    blocksToVisit = get_param(handle, 'Handle');
    % 53 55
    while not(isempty(blocksToVisit))
        % 55 57
        handle = blocksToVisit(1.0);
        if isempty(portNum)
            newNeighbors = pmNeighbors(handle, 1.0);
        else
            pstruct = get_param(handle, 'PortConnectivity');
            nbrBlock = pstruct(portNum).DstBlock;
            nbrPort = pstruct(portNum).DstPort;
            newNeighbors = pmNeighbors(handle, 1.0, nbrBlock, nbrPort);
            portNum = [];
        end
        % 66 69
        % 67 69
        haveVisited = horzcat(haveVisited, handle);
        blocksToVisit(1.0) = [];
        % 70 72
        doNotVisit = or(ismember(newNeighbors, haveVisited), isexcluded(newNeighbors, excludeParams, excludeVals));
        % 72 75
        % 73 75
        blocksToVisit = horzcat(blocksToVisit, newNeighbors(not(doNotVisit)));
    end % while
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    pmList = haveVisited;
    pmList(1.0) = [];
    pmList = pmList(not(isexcluded(pmList, ignoreParams, ignoreVals)));
    % 83 85
end
function result = isexcluded(neighborList, excludeParams, excludeVals)
    % 86 94
    % 87 94
    % 88 94
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    numNbrs = length(neighborList);
    result = zeros(size(neighborList));
    numberOfExclusions = length(excludeParams);
    for idx=1.0:numNbrs
        for excl=1.0:numberOfExclusions
            value = get_param(neighborList(idx), excludeParams{excl});
            result(idx) = result(idx) || strcmpi(value, excludeVals{excl});
        end % for
    end % for
    % 102 104
    result = logical(result);
    % 104 106
end
