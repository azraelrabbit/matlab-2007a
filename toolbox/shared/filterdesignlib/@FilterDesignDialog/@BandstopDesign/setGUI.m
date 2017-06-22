function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    hfdesign = getfdesign(Hd);
    if not(strcmpi(get(hfdesign, 'Response'), 'bandstop'))
        b = false;
        return;
    end % if
    % 13 15
    switch lower(hfdesign.Specification)
    case 'fp1,fst1,fst2,fp2,ap1,ast,ap2'
        set(this, 'Fpass1', num2str(hfdesign.Fpass1), 'Fstop1', num2str(hfdesign.Fstop1), 'Fstop2', num2str(hfdesign.Fstop2), 'Fpass2', num2str(hfdesign.Fpass2), 'Apass1', num2str(hfdesign.Apass1), 'Astop', num2str(hfdesign.Astop), 'Apass1', num2str(hfdesign.Apass2));
        % 18 25
        % 19 25
        % 20 25
        % 21 25
        % 22 25
        % 23 25
    case 'n,f3db1,f3db2'
        % 24 26
        set(this, 'privFrequencyConstraints', '3db points', 'privMagnitudeConstraints', 'unconstrained', 'F3db1', num2str(hfdesign.F3db1), 'F3db2', num2str(hfdesign.F3db2));
        % 27 31
        % 28 31
        % 29 31
    case 'n,f3db1,f3db2,ap'
        % 30 32
        set(this, 'privFrequencyConstraints', '3db points', 'privMagnitudeConstraints', 'Passband ripple', 'F3db1', num2str(hfdesign.F3db1), 'F3db2', num2str(hfdesign.F3db2), 'Apass1', num2str(hfdesign.Apass));
        % 33 38
        % 34 38
        % 35 38
        % 36 38
    case 'n,f3db1,f3db2,ast'
        % 37 39
        set(this, 'privFrequencyConstraints', '3db points', 'privMagnitudeConstraints', 'Stopband attenuation', 'F3db1', num2str(hfdesign.F3db1), 'F3db2', num2str(hfdesign.F3db2), 'Astop', num2str(hfdesign.Astop));
        % 40 45
        % 41 45
        % 42 45
        % 43 45
    case 'n,f3db1,f3db2,ap,ast'
        % 44 46
        set(this, 'privFrequencyConstraints', '3dB points', 'privMagnitudeConstraints', 'passband ripples and stopband attenuation', 'F3dB1', num2str(hfdesign.F3db1), 'F3dB2', num2str(hfdesign.F3db2), 'Apass1', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 47 53
        % 48 53
        % 49 53
        % 50 53
        % 51 53
    case 'n,f3db1,f3db2,bwp'
        % 52 54
        set(this, 'privFrequencyConstraints', '3db points and passband width', 'privMagnitudeConstraints', 'unconstrained', 'F3db1', num2str(hfdesign.F3db1), 'F3db2', num2str(hfdesign.F3db2), 'BWpass', num2str(hfdesign.BWpass));
        % 55 60
        % 56 60
        % 57 60
        % 58 60
    case 'n,f3db1,f3db2,bwst'
        % 59 61
        set(this, 'privFrequencyConstraints', '3db points and stopband width', 'privMagnitudeConstraints', 'unconstrained', 'F3db1', num2str(hfdesign.F3db1), 'F3db2', num2str(hfdesign.F3db2), 'BWstop', num2str(hfdesign.BWstop));
        % 62 67
        % 63 67
        % 64 67
        % 65 67
    case 'n,fc1,fc2'
        % 66 68
        set(this, 'privFrequencyConstraints', '6db points', 'privMagnitudeConstraints', 'unconstrained', 'F6db1', num2str(hfdesign.Fcutoff1), 'F6db2', num2str(hfdesign.Fcutoff2));
        % 69 73
        % 70 73
        % 71 73
    case 'n,fp1,fp2,ap'
        % 72 74
        set(this, 'privFrequencyConstraints', 'passband edges', 'privMagnitudeConstraints', 'Passband ripple', 'Fpass1', num2str(hfdesign.Fpass1), 'Fpass2', num2str(hfdesign.Fpass2), 'Apass1', num2str(hfdesign.Apass));
        % 75 80
        % 76 80
        % 77 80
        % 78 80
    case 'n,fp1,fp2,ap,ast'
        % 79 81
        set(this, 'privFrequencyConstraints', 'passband edges', 'privMagnitudeConstraints', 'Passband ripples and stopband attenuation', 'Fpass1', num2str(hfdesign.Fpass1), 'Fpass2', num2str(hfdesign.Fpass2), 'Astop', num2str(hfdesign.Astop));
        % 82 87
        % 83 87
        % 84 87
        % 85 87
    case 'n,fp1,fst1,fst2,fp2'
        % 86 88
        set(this, 'privFrequencyConstraints', 'passband and stopband edges', 'privMagnitudeConstraints', 'unconstrained', 'Fpass1', num2str(hfdesign.Fpass1), 'Fstop1', num2str(hfdesign.Fstop1), 'Fstop2', num2str(hfdesign.Fstop2), 'Fpass2', num2str(hfdesign.Fpass2));
        % 89 95
        % 90 95
        % 91 95
        % 92 95
        % 93 95
    case 'n,fst1,fst2,ast'
        % 94 96
        set(this, 'privFrequencyConstraints', 'stopband edges', 'privMagnitudeConstraints', 'stopband attenuation', 'Fstop1', num2str(hfdesign.Fstop1), 'Fstop2', num2str(hfdesign.Fstop2), 'Astop', num2str(hfdesign.Astop));
    otherwise
        % 97 102
        % 98 102
        % 99 102
        % 100 102
        % 101 103
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: Bandstop ''%s'' incomplete', hfdesign.Specification);
        % 103 105
    end % switch
    % 105 107
    abstract_setGUI(this, Hd);
