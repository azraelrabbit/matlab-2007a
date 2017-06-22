function h = initObj(h, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    checkVararginPVPairsFormatOK(varargin);
    % 9 13
    % 10 13
    % 11 13
    genPoly = parseFromArgs('GenPoly', varargin);
    initStates = parseFromArgs('InitialStates', varargin);
    currStates = parseFromArgs('CurrentStates', varargin);
    numBitsOut = parseFromArgs('NumBitsOut', varargin);
    mask = parseFromArgs('Mask', varargin);
    shift = parseFromArgs('Shift', varargin);
    % 18 22
    % 19 22
    % 20 22
    if isempty(initStates)
        % 22 24
        initStates = currStates;
    else
        if not(isempty(currStates)) && not(isequal(initStates, currStates))
            error('comm:seqgen:pn:ObjConstructorInitAndCurrStatesNotEqual', 'IntialStates and CurrentStates must be equal at object construction.');
            % 27 29
        end
    end
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    if not(isempty(genPoly))
        h.GenPoly = genPoly;
    end
    % 38 42
    % 39 42
    % 40 42
    if not(isempty(currStates))
        h.CurrentStates = currStates;
    end
    % 44 46
    if not(isempty(initStates))
        h.InitialStates = initStates;
    end
    % 48 50
    if not(isempty(numBitsOut))
        h.NumBitsOut = numBitsOut;
    end
    % 52 56
    % 53 56
    % 54 56
    if not(isempty(mask)) && not(isempty(shift))
        % 56 58
        error('comm:seqgen:pn:BothMaskAndShiftSpecified', 'Only one of the Mask or Shift properties can be specified (but not both).');
    else
        if isempty(mask) && isempty(shift)
            % 60 62
            h = createMaskProperty(h, horzcat(zeros(1.0, minus(length(h.GenPoly), 2.0)), 1.0));
        else
            if isempty(shift)
                h = createMaskProperty(h, mask);
            else
                h = createShiftProperty(h, shift);
            end
        end
    end
end
function checkVararginPVPairsFormatOK(varargin)
    pvPairArgs = varargin{:};
    numPVPairs = mrdivide(length(pvPairArgs), 2.0);
    if check_posint(numPVPairs)
        for count=1.0:numPVPairs
            vIdx = mtimes(2.0, count);
            pIdx = minus(vIdx, 1.0);
            pStr = pvPairArgs{pIdx};
            if not(isParamStringOK(pStr))
                if ischar(pStr)
                    error('comm:seqgen:pn:ObjConstructorUnrecognizedParam', horzcat('There is no property named ''', pStr, ''' in the seqgen.pn class.'));
                else
                    % 83 85
                    % 84 86
                    error('comm:seqgen:pn:ObjConstructorBadPVPairFormat', 'Input arguments must be parameter-value pairs.');
                    % 86 88
                end
            end
        end % for
    else
        % 91 93
        error('comm:seqgen:pn:ObjConstructorBadPVPairFormat', 'Input arguments must be parameter-value pairs.');
        % 93 95
    end
end
function success = isParamStringOK(pStr)
    % 97 101
    % 98 101
    % 99 101
    success = any(strncmpi(pStr, {'GenPoly','InitialStates','CurrentStates','NumBitsOut','Mask','Shift'}, 1.0));
    % 101 108
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
end
function propValue = parseFromArgs(propStr, varargin)
    % 109 113
    % 110 113
    % 111 113
    pvPairArgs = varargin{:};
    propValue = [];
    numPVPairs = floor(mrdivide(length(pvPairArgs), 2.0));
    for count=1.0:numPVPairs
        vIdx = mtimes(2.0, count);
        pIdx = minus(vIdx, 1.0);
        % 118 121
        % 119 121
        if strncmpi(propStr, pvPairArgs{pIdx}, 1.0)
            propValue = pvPairArgs{vIdx};
            break
        end
    end % for
end
function success = check_posint(values)
    % 127 133
    % 128 133
    % 129 133
    % 130 133
    % 131 133
    success = not(any(rem(values, 1.0))) && gt(min(values), 0.0);
end
