function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    % 8 10
    hfdesign = getfdesign(Hd);
    if not(strcmpi(get(hfdesign, 'Response'), 'bandpass'))
        b = false;
        return;
    end % if
    % 14 16
    switch lower(hfdesign.Specification)
    case 'fst1,fp1,fp2,fst2,ast1,ap,ast2'
        set(this, 'Fstop1', num2str(hfdesign.Fstop1), 'Fpass1', num2str(hfdesign.Fpass1), 'Fpass2', num2str(hfdesign.Fpass2), 'Fstop2', num2str(hfdesign.Fstop2), 'Astop1', num2str(hfdesign.Astop1), 'Apass', num2str(hfdesign.Apass), 'Astop2', num2str(hfdesign.Astop2));
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
    case 'n,f3db1,f3db2'
        % 25 27
        set(this, 'privFrequencyConstraints', '3dB points', 'privMagnitudeConstraints', 'unconstrained', 'F3dB1', num2str(hfdesign.F3db1), 'F3dB2', num2str(hfdesign.F3db2));
        % 28 32
        % 29 32
        % 30 32
    case 'n,f3db1,f3db2,ap'
        % 31 33
        set(this, 'privFrequencyConstraints', '3dB points', 'privMagnitudeConstraints', 'passband ripple', 'F3dB1', num2str(hfdesign.F3db1), 'F3dB2', num2str(hfdesign.F3db2), 'Apass', num2str(hfdesign.Apass));
        % 34 39
        % 35 39
        % 36 39
        % 37 39
    case 'n,f3db1,f3db2,ast'
        % 38 40
        set(this, 'privFrequencyConstraints', '3dB points', 'privMagnitudeConstraints', 'stopband attenuation', 'F3dB1', num2str(hfdesign.F3db1), 'F3dB2', num2str(hfdesign.F3db2), 'Astop1', num2str(hfdesign.Astop));
        % 41 46
        % 42 46
        % 43 46
        % 44 46
    case 'n,f3db1,f3db2,ast1,ap,ast2'
        % 45 47
        set(this, 'privFrequencyConstraints', '3dB points', 'privMagnitudeConstraints', 'passband ripple and stopband attenuations', 'F3dB1', num2str(hfdesign.F3db1), 'F3dB2', num2str(hfdesign.F3db2), 'Astop1', num2str(hfdesign.Astop1), 'Apass', num2str(hfdesign.Apass), 'Astop2', num2str(hfdesign.Astop2));
        % 48 55
        % 49 55
        % 50 55
        % 51 55
        % 52 55
        % 53 55
    case 'n,f3db1,f3db2,bwp'
        % 54 56
        set(this, 'privFrequencyConstraints', '3dB points and passband width', 'privMagnitudeConstraints', 'unconstrained', 'F3dB1', num2str(hfdesign.F3db1), 'F3dB2', num2str(hfdesign.F3db2), 'BWpass', num2str(hfdesign.BWpass));
        % 57 62
        % 58 62
        % 59 62
        % 60 62
    case 'n,f3db1,f3db2,bwst'
        % 61 63
        set(this, 'privFrequencyConstraints', '3dB points and stopband width', 'privMagnitudeConstraints', 'unconstrained', 'F3dB1', num2str(hfdesign.F3db1), 'F3dB2', num2str(hfdesign.F3db2), 'BWstop', num2str(hfdesign.BWstop));
        % 64 69
        % 65 69
        % 66 69
        % 67 69
    case 'n,fc1,fc2'
        % 68 70
        set(this, 'privFrequencyConstraints', '6dB points', 'privMagnitudeConstraints', 'unconstrained', 'F6dB1', num2str(hfdesign.Fcutoff1), 'F6dB2', num2str(hfdesign.Fcutoff2));
        % 71 75
        % 72 75
        % 73 75
    case 'n,fp1,fp2,ap'
        % 74 76
        set(this, 'privFrequencyConstraints', 'passband edges', 'privMagnitudeConstraints', 'passband ripple', 'Fpass1', num2str(hfdesign.Fpass1), 'Fpass2', num2str(hfdesign.Fpass2), 'Apass', num2str(hfdesign.Apass));
        % 77 82
        % 78 82
        % 79 82
        % 80 82
    case 'n,fp1,fp2,ast1,ap,ast2'
        % 81 83
        set(this, 'privFrequencyConstraints', 'passband edges', 'privMagnitudeConstraints', 'passband ripple and stopband attenuations', 'Fpass1', num2str(hfdesign.Fpass1), 'Fpass2', num2str(hfdesign.Fpass2), 'Astop1', num2str(hfdesign.Astop1), 'Apass', num2str(hfdesign.Apass), 'Astop2', num2str(hfdesign.Astop2));
        % 84 91
        % 85 91
        % 86 91
        % 87 91
        % 88 91
        % 89 91
    case 'n,fst1,fp1,fp2,fst2'
        % 90 92
        set(this, 'privFrequencyConstraints', 'passband and stopband edges', 'privMagnitudeConstraints', 'unconstrained', 'Fstop1', num2str(hfdesign.Fstop1), 'Fpass1', num2str(hfdesign.Fpass1), 'Fpass2', num2str(hfdesign.Fpass2), 'Fstop2', num2str(hfdesign.Fstop2));
        % 93 99
        % 94 99
        % 95 99
        % 96 99
        % 97 99
    case 'n,fst1,fp1,fp2,fst2,ap'
        % 98 100
        set(this, 'privFrequencyConstraints', 'passband and stopband edges', 'privMagnitudeConstraints', 'passband ripple', 'Fstop1', num2str(hfdesign.Fstop1), 'Fpass1', num2str(hfdesign.Fpass1), 'Fpass2', num2str(hfdesign.Fpass2), 'Fstop2', num2str(hfdesign.Fstop2), 'Apass', num2str(hfdesign.Apass));
        % 101 108
        % 102 108
        % 103 108
        % 104 108
        % 105 108
        % 106 108
    case 'n,fst1,fst2,ast'
        % 107 109
        set(this, 'privFrequencyConstraints', 'stopband edges', 'privMagnitudeConstraints', 'stopband attenuation', 'Fstop1', num2str(hfdesign.Fstop1), 'Fstop2', num2str(hfdesign.Fstop2), 'Astop1', num2str(hfdesign.Astop));
        % 110 115
        % 111 115
        % 112 115
        % 113 115
    case 'nb,na,fst1,fp1,fp2,fst2'
    otherwise
        % 115 117
        % 116 118
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: Bandpass ''%s'' incomplete', hfdesign.Specification);
        % 118 120
    end % switch
    % 120 122
    abstract_setGUI(this, Hd);
