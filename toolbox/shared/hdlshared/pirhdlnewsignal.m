function hS = pirhdlnewsignal(hN, name, port, isComplex, dims, vType, slType, rate, forward, fake)
    % 1 31
    % 2 31
    % 3 31
    % 4 31
    % 5 31
    % 6 31
    % 7 31
    % 8 31
    % 9 31
    % 10 31
    % 11 31
    % 12 31
    % 13 31
    % 14 31
    % 15 31
    % 16 31
    % 17 31
    % 18 31
    % 19 31
    % 20 31
    % 21 31
    % 22 31
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    hDriver = hdlcurrentdriver;
    % 32 33
    if lt(nargin, 8.0)
        rate = 0.0;
    end % if
    % 36 37
    if lt(nargin, 9.0)
        forward = 0.0;
    end % if
    % 40 41
    if lt(nargin, 10.0)
        fake = 0.0;
    end % if
    % 44 45
    if gt(length(dims), 1.0) && all(eq(dims, [0.0 0.0]))
        % 46 47
        dims = 0.0;
    end % if
    % 49 50
    hT = getpirsignaltype(slType, isComplex, dims);
    % 51 53
    % 52 53
    if fake
        % 54 55
        hS = hN.addFakeSignal(hT, name);
    else
        % 57 59
        % 58 59
        hS = hN.addSignal(hT, name);
    end % if
    % 61 62
    hS.SimulinkHandle = port;
    hS.SimulinkRate = rate;
    hS.VType(vType);
    % 65 66
    if eq(forward, 0.0)
        hS.Forward([]);
    else
        hS.Forward(forward);
    end % if
    % 71 72
    if eq(isComplex, 1.0)
        % 73 74
        if fake
            % 75 78
            % 76 78
            % 77 78
            hS2 = hN.addFakeSignal(hT, name);
        else
            % 80 82
            % 81 82
            hS2 = hN.addSignal(hT, name);
        end % if
        hS2.SimulinkHandle = port;
        hS2.SimulinkRate = rate;
        hS2.VType(vType);
        % 87 88
        if eq(forward, 0.0)
            hS2.Forward([]);
        else
            hS2.Forward(forward);
        end % if
        % 93 94
        hS2.Imag([]);
        hS.Imag(hS2);
    else
        % 97 99
        % 98 99
        hS.Imag([]);
        % 100 101
    end % if
end % function
