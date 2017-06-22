function [uname, index] = hdlnewsignal(name, block, porthandle, complexity, isvector, vtype, sltype, rate, forward)
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
    if lt(nargin, 8.0)
        rate = 0.0;
    end % if
    % 15 17
    % 16 17
    if lt(nargin, 9.0)
        forward = 0.0;
    end % if
    % 20 23
    % 21 23
    % 22 23
    if complexity
        error(hdlerrormsgid('complexnotsupported'), 'Complex datatypes are not supported in this release.');
        % 25 26
    end % if
    % 27 28
    if gt(length(isvector), 1.0) && not(any(eq(isvector, 0.0))) && ne(max(isvector), prod(isvector))
        error(hdlerrormsgid('matrixnotsupported'), 'Matrices are not supported in this release.');
        % 30 31
    end % if
    % 32 35
    % 33 35
    % 34 35
    if hdlisbeta2
        % 36 38
        % 37 38
        hDriver = hdlcurrentdriver;
        hN = hDriver.getCurrentNetwork;
        % 40 41
        index = pirhdlnewsignal(hN, name, porthandle, complexity, isvector, vtype, sltype, rate, forward);
        % 42 44
        % 43 44
        uname = index.Name;
    else
        % 46 48
        % 47 48
        signalTable = hdlgetsignaltable;
        % 49 50
        [uname, index] = signalTable.createNewSignal(name, porthandle, complexity, isvector, vtype, sltype, rate, forward);
        % 51 53
        % 52 53
    end % if
end % function
