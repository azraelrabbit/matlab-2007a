function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    hfdesign = getfdesign(Hd);
    if not(strcmpi(get(hfdesign, 'Response'), 'lowpass'))
        b = false;
        return;
    end % if
    switch hfdesign.Specification
    case 'Fp,Fst,Ap,Ast'
        set(this, 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 17 21
        % 18 21
        % 19 21
    case 'N,F3dB'
        % 20 22
        set(this, 'privFrequencyConstraints', '3dB point', 'privMagnitudeConstraints', 'unconstrained', 'F3dB', num2str(hfdesign.F3db));
        % 23 26
        % 24 26
    case 'N,F3dB,Ap'
        % 25 27
        set(this, 'privFrequencyConstraints', '3dB point', 'privMagnitudeConstraints', 'Passband ripple', 'F3dB', num2str(hfdesign.F3db), 'Apass', num2str(hfdesign.Apass));
        % 28 32
        % 29 32
        % 30 32
    case 'N,F3dB,Ap,Ast'
        % 31 33
        set(this, 'privFrequencyConstraints', '3dB point', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'F3dB', num2str(hfdesign.F3db), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 34 39
        % 35 39
        % 36 39
        % 37 39
    case 'N,F3dB,Ast'
        % 38 40
        set(this, 'privFrequencyConstraints', '3dB point', 'privMagnitudeConstraints', 'Stopband attenuation', 'F3dB', num2str(hfdesign.F3db), 'Astop', num2str(hfdesign.Astop));
        % 41 45
        % 42 45
        % 43 45
    case 'N,F3dB,Fst'
        % 44 46
        set(this, 'privFrequencyConstraints', '3dB point and stopband edge', 'privMagnitudeConstraints', 'unconstrained', 'F3dB', num2str(hfdesign.F3db), 'Fstop', num2str(hfdesign.Fstop));
        % 47 51
        % 48 51
        % 49 51
    case 'N,Fc'
        % 50 52
        set(this, 'privFrequencyConstraints', '6dB point', 'privMagnitudeConstraints', 'unconstrained', 'F6dB', num2str(hfdesign.Fcutoff));
        % 53 56
        % 54 56
    case 'N,Fc,Ap,Ast'
        % 55 57
        set(this, 'privFrequencyConstraints', '6dB point', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'F6dB', num2str(hfdesign.Fcutoff), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 58 63
        % 59 63
        % 60 63
        % 61 63
    case 'N,Fp,Ap'
        % 62 64
        set(this, 'privFrequencyConstraints', 'Passband edge', 'privMagnitudeConstraints', 'Passband ripple', 'Fpass', num2str(hfdesign.Fpass), 'Apass', num2str(hfdesign.Apass));
        % 65 69
        % 66 69
        % 67 69
    case 'N,Fp,Ap,Ast'
        % 68 70
        set(this, 'privFrequencyConstraints', 'Passband edge', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'Fpass', num2str(hfdesign.Fpass), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 71 76
        % 72 76
        % 73 76
        % 74 76
    case 'N,Fp,F3dB'
        % 75 77
        set(this, 'privFrequencyConstraints', 'Passband edge and 3dB point', 'privMagnitudeConstraints', 'unconstrained', 'Fpass', num2str(hfdesign.Fpass), 'F3dB', num2str(hfdesign.F3dB));
        % 78 82
        % 79 82
        % 80 82
    case 'N,Fp,Fst'
        % 81 83
        set(this, 'privFrequencyConstraints', 'Passband edge and stopband edge', 'privMagnitudeConstraints', 'unconstrained', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop));
        % 84 88
        % 85 88
        % 86 88
    case 'N,Fp,Fst,Ap'
        % 87 89
        set(this, 'privFrequencyConstraints', 'Passband edge and stopband edge', 'privMagnitudeConstraints', 'Passband ripple', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass));
        % 90 95
        % 91 95
        % 92 95
        % 93 95
    case 'N,Fp,Fst,Ast'
        % 94 96
        set(this, 'privFrequencyConstraints', 'Passband edge and stopband edge', 'privMagnitudeConstraints', 'Stopband attenuation', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop), 'Astop', num2str(hfdesign.Astop));
        % 97 102
        % 98 102
        % 99 102
        % 100 102
    case 'N,Fst,Ap,Ast'
        % 101 103
        set(this, 'privFrequencyConstraints', 'Stopband edge', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 104 109
        % 105 109
        % 106 109
        % 107 109
    case 'N,Fst,Ast'
        % 108 110
        set(this, 'privFrequencyConstraints', 'Stopband edge', 'privMagnitudeConstraints', 'Stopband attenuation', 'Fstop', num2str(hfdesign.Fstop), 'Astop', num2str(hfdesign.Astop));
        % 111 115
        % 112 115
        % 113 115
    case 'Nb,Na,Fp,Fst'
        % 114 116
        set(this, 'privFrequencyConstraints', 'Passband edge and stopband edge', 'privMagnitudeConstraints', 'unconstrained', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop));
    otherwise
        % 117 121
        % 118 121
        % 119 121
        % 120 122
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: Lowpass ''%s'' incomplete', hfdesign.Specification);
        % 122 124
    end % switch
    % 124 126
    abstract_setGUI(this, Hd);
