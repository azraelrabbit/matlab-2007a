function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    hfdesign = getfdesign(Hd);
    if not(strcmpi(get(hfdesign, 'Response'), 'highpass'))
        b = false;
        return;
    end % if
    % 13 15
    switch hfdesign.Specification
    case 'Fst,Fp,Ast,Ap'
        set(this, 'Fstop', num2str(hfdesign.Fstop), 'Fpass', num2str(hfdesign.Fpass), 'Astop', num2str(hfdesign.Astop), 'Apass', num2str(hfdesign.Apass));
        % 18 22
        % 19 22
        % 20 22
    case 'N,F3dB'
        % 21 23
        set(this, 'privFrequencyConstraints', '3dB point', 'privMagnitudeConstraints', 'unconstrained', 'F3dB', num2str(hfdesign.F3db));
        % 24 27
        % 25 27
    case 'N,F3dB,Fp'
        % 26 28
        set(this, 'privFrequencyConstraints', '3dB point and passband edge', 'privMagnitudeConstraints', 'unconstrained', 'F3dB', num2str(hfdesign.F3db), 'Fpass', num2str(hfdesign.Fpass));
        % 29 33
        % 30 33
        % 31 33
    case 'N,F3dB,Ap'
        % 32 34
        set(this, 'privFrequencyConstraints', '3dB point', 'privMagnitudeConstraints', 'Passband ripple', 'F3dB', num2str(hfdesign.F3db), 'Apass', num2str(hfdesign.Apass));
        % 35 39
        % 36 39
        % 37 39
    case 'N,F3dB,Ast,Ap'
        % 38 40
        set(this, 'privFrequencyConstraints', '3dB point', 'privMagnitudeConstraints', 'Stopband attenuation and passband ripple', 'F3dB', num2str(hfdesign.F3db), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 41 46
        % 42 46
        % 43 46
        % 44 46
    case 'N,F3dB,Ast'
        % 45 47
        set(this, 'privFrequencyConstraints', '3dB point', 'privMagnitudeConstraints', 'Stopband attenuation', 'F3dB', num2str(hfdesign.F3db), 'Astop', num2str(hfdesign.Astop));
        % 48 52
        % 49 52
        % 50 52
    case 'N,Fst,F3dB'
        % 51 53
        set(this, 'privFrequencyConstraints', 'stopband edge and 3dB point', 'privMagnitudeConstraints', 'unconstrained', 'F3dB', num2str(hfdesign.F3db), 'Fstop', num2str(hfdesign.Fstop));
        % 54 58
        % 55 58
        % 56 58
    case 'N,Fc'
        % 57 59
        set(this, 'privFrequencyConstraints', '6dB point', 'privMagnitudeConstraints', 'unconstrained', 'F3dB', num2str(hfdesign.Fcutoff));
        % 60 63
        % 61 63
    case 'N,Fc,Ap,Ast'
        % 62 64
        set(this, 'privFrequencyConstraints', '6dB point', 'privMagnitudeConstraints', 'Stopband attenuation and passband ripple', 'F6dB', num2str(hfdesign.Fcutoff), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 65 70
        % 66 70
        % 67 70
        % 68 70
    case 'N,Fp,Ap'
        % 69 71
        set(this, 'privFrequencyConstraints', 'Passband edge', 'privMagnitudeConstraints', 'Passband ripple', 'Fpass', num2str(hfdesign.Fpass), 'Apass', num2str(hfdesign.Apass));
        % 72 76
        % 73 76
        % 74 76
    case 'N,Fp,Ap,Ast'
        % 75 77
        set(this, 'privFrequencyConstraints', 'Passband edge', 'privMagnitudeConstraints', 'Stopband attenuation and passband ripple', 'Fpass', num2str(hfdesign.Fpass), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 78 83
        % 79 83
        % 80 83
        % 81 83
    case 'N,Fp,F3dB'
        % 82 84
        set(this, 'privFrequencyConstraints', '3dB point and passband edge', 'privMagnitudeConstraints', 'unconstrained', 'Fpass', num2str(hfdesign.Fpass), 'F3dB', num2str(hfdesign.F3dB));
        % 85 89
        % 86 89
        % 87 89
    case 'N,Fst,Fp'
        % 88 90
        set(this, 'privFrequencyConstraints', 'Stopband edge and passband edge', 'privMagnitudeConstraints', 'unconstrained', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop));
        % 91 95
        % 92 95
        % 93 95
    case 'N,Fst,Fp,Ap'
        % 94 96
        set(this, 'privFrequencyConstraints', 'Stopband edge and passband edge', 'privMagnitudeConstraints', 'Passband ripple', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass));
        % 97 102
        % 98 102
        % 99 102
        % 100 102
    case 'N,Fst,Fp,Ast'
        % 101 103
        set(this, 'privFrequencyConstraints', 'Stopband edge and passband edge', 'privMagnitudeConstraints', 'Stopband attenuation', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop), 'Astop', num2str(hfdesign.Astop));
        % 104 109
        % 105 109
        % 106 109
        % 107 109
    case 'N,Fst,Ap,Ast'
        % 108 110
        set(this, 'privFrequencyConstraints', 'Stopband edge', 'privMagnitudeConstraints', 'Stopband attenuation and passband ripple', 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 111 116
        % 112 116
        % 113 116
        % 114 116
    case 'N,Fst,Ast'
        % 115 117
        set(this, 'privFrequencyConstraints', 'Stopband edge', 'privMagnitudeConstraints', 'Stopband attenuation', 'Fstop', num2str(hfdesign.Fstop), 'Astop', num2str(hfdesign.Astop));
        % 118 122
        % 119 122
        % 120 122
    case 'Nb,Na,Fp,Fst'
        % 121 123
        set(this, 'privFrequencyConstraints', 'Stopband edge and passband edge', 'privMagnitudeConstraints', 'Unconstrained', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop));
        % 124 128
        % 125 128
        % 126 128
    case 'N,Fst,Fp'
        % 127 129
        set(this, 'privFrequencyConstraints', 'Stopband edge and passband edge', 'privMagnitudeConstraints', 'Unconstrained', 'Fstop', num2str(hfdesign.Fstop), 'Fpass', num2str(hfdesign.Fpass));
    otherwise
        % 130 134
        % 131 134
        % 132 134
        % 133 135
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: Highpass ''%s'' incomplete', hfdesign.Specification);
        % 135 137
    end % switch
    % 137 139
    abstract_setGUI(this, Hd);
