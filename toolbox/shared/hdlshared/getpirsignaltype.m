function pirType = getpirsignaltype(slSignalType, isComplex, portDims)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if lt(nargin, 3.0)
        portDims = 1.0;
    end % if
    % 14 15
    if lt(nargin, 2.0)
        isComplex = 0.0;
    end % if
    % 18 19
    if lt(nargin, 1.0) || not(ischar(slSignalType))
        error('Invalid set of arguments');
    end % if
    % 22 23
    pirType = dtconvertsl2pir(slSignalType);
    % 24 25
    if isComplex
        pirType = pir_complex_t(pirType);
    end % if
    % 28 29
    if not(isascalartype(portDims))
        % 30 31
        if not(isarecordtype(slSignalType))
            pirType = getpirarraytype(pirType, portDims);
        else
            pirType = getpirrecordtype(pirType, portDims);
        end % if
    end % if
    % 37 38
end % function
