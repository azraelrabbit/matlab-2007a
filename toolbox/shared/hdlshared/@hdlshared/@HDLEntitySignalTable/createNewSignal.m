function [uname, index] = createNewSignal(this, name, port, isComplex, dims, vType, slType, rate, forward)
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
    if lt(nargin, 8.0)
        rate = 0.0;
    end % if
    % 34 35
    if lt(nargin, 9.0)
        forward = 0.0;
    end % if
    % 38 39
    if gt(length(dims), 1.0) && all(eq(dims, [0.0 0.0]))
        % 40 41
        dims = 0.0;
    end % if
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    if eq(port, -1.0)
        port = [];
    end % if
    % 52 54
    % 53 54
    if eq(isComplex, 1.0)
        % 55 56
        [realSigName, imagSigName] = this.getUniqueComplexSignalName(name);
        % 57 58
        uname = horzcat(realSigName, imagSigName);
        % 59 60
        realSig = hdlshared.HDLEntitySignal(realSigName, '', port, isComplex, dims, vType, slType, rate, forward);
        % 61 64
        % 62 64
        % 63 64
        index = this.addSignal(realSig);
        % 65 66
        imagSig = hdlshared.HDLEntitySignal(imagSigName, '', port, isComplex, dims, vType, slType, rate, forward);
        % 67 70
        % 68 70
        % 69 70
        index2 = this.addSignal(imagSig);
    else
        % 72 73
        % 73 75
        % 74 75
        uname = this.getUniqueSignalName(name);
        % 76 77
        signal = hdlshared.HDLEntitySignal(uname, '', port, isComplex, dims, vType, slType, rate, forward);
        % 78 81
        % 79 81
        % 80 81
        index = this.addSignal(signal);
        % 82 83
    end % if
end % function
