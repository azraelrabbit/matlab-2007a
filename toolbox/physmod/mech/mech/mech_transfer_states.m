function dstStates = mech_transfer_states(srcMgr, dstMgr, transferStructure, srcStates, dstStates)
    % 1 43
    % 2 43
    % 3 43
    % 4 43
    % 5 43
    % 6 43
    % 7 43
    % 8 43
    % 9 43
    % 10 43
    % 11 43
    % 12 43
    % 13 43
    % 14 43
    % 15 43
    % 16 43
    % 17 43
    % 18 43
    % 19 43
    % 20 43
    % 21 43
    % 22 43
    % 23 43
    % 24 43
    % 25 43
    % 26 43
    % 27 43
    % 28 43
    % 29 43
    % 30 43
    % 31 43
    % 32 43
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    if lt(nargin, 5.0)
        dstStates = [];
        % 44 46
        if lt(nargin, 4.0)
            srcStates = [];
        end
        % 48 50
    end
    % 50 52
    if isempty(dstStates)
        dstStates = dstMgr.X;
    end
    if isempty(srcStates)
        srcStates = srcMgr.X;
    end
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    numSrcStates = numel(srcMgr.X);
    numDstStates = numel(dstMgr.X);
    numberOfTransfers = length(transferStructure);
    % 64 67
    % 65 67
    if ne(numel(srcStates), numSrcStates) || ne(numel(dstStates), numDstStates)
        error('physmod:mech:mech:mech_transfer_states:InvalidStateVectorLength', 'The SimMechanics state vector specified is not of the correct length.');
        % 68 70
    end
    % 70 78
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    srcIndex = getIndeces(numberOfTransfers, cellhorzcat(transferStructure.src), srcMgr.StateNames);
    dstIndex = getIndeces(numberOfTransfers, cellhorzcat(transferStructure.dst), dstMgr.StateNames);
    % 79 87
    % 80 87
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    if any(gt(dstIndex, numDstStates)) || any(gt(srcIndex, numSrcStates))
        error('physmod:mech:mech:mech_transfer_states:InvalidStatesSpecified', 'The transfer indeces for the SimMechanics state vectors are out of bounds.');
        % 88 90
    end
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    zeroIndeces = or(eq(dstIndex, 0.0), eq(srcIndex, 0.0));
    dstIndex(zeroIndeces) = [];
    srcIndex(zeroIndeces) = [];
    % 97 100
    % 98 100
    dstStates(dstIndex) = srcStates(srcIndex);
    % 100 102
end
function transferIndeces = getIndeces(numberOfTransfers, transferStateNames, vmStateNames)
    % 103 113
    % 104 113
    % 105 113
    % 106 113
    % 107 113
    % 108 113
    % 109 113
    % 110 113
    % 111 113
    if ischar(transferStateNames{1.0})
        % 113 115
        transferIndeces = zeros(horzcat(1.0, numberOfTransfers));
        % 115 117
        for item=1.0:numberOfTransfers
            indeces = find(strcmp(transferStateNames{item}, vmStateNames));
            numMatches = length(indeces);
            if gt(numMatches, 1.0)
                error('physmod:mech:mech:mech_transfer_states:NonUniqueMatch', 'More than one state name matches %s.', transferStateNames{item});
            else
                if eq(numMatches, 1.0)
                    transferIndeces(item) = indeces;
                end
            end
        end % for
    else
        transferIndeces = horzcat(transferStateNames{:});
    end
    % 130 132
end
