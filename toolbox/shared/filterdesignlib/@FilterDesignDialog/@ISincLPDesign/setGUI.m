function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    hfdesign = getfdesign(Hd);
    if not(strcmpi(get(hfdesign, 'Response'), 'inverse-sinc lowpass'))
        b = false;
        return;
    end % if
    switch hfdesign.Specification
    case 'Fp,Fst,Ap,Ast'
        set(this, 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 17 21
        % 18 21
        % 19 21
    case 'N,Fc,Ap,Ast'
        % 20 22
        set(this, 'privFrequencyConstraints', '6dB point', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'F6dB', num2str(hfdesign.Fcutoff), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 23 28
        % 24 28
        % 25 28
        % 26 28
    case 'N,Fp,Ap,Ast'
        % 27 29
        set(this, 'privFrequencyConstraints', 'Passband edge', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'Fpass', num2str(hfdesign.Fpass), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 30 35
        % 31 35
        % 32 35
        % 33 35
    case 'N,Fst,Ap,Ast'
        % 34 36
        set(this, 'privFrequencyConstraints', 'Stopband edge', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 37 42
        % 38 42
        % 39 42
        % 40 42
    case 'N,Fp,Fst'
        % 41 43
        set(this, 'privFrequencyConstraints', 'Passband edge and stopband edge', 'privMagnitudeConstraints', 'Enconstrained', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop));
    otherwise
        % 44 48
        % 45 48
        % 46 48
        % 47 49
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: ISincLP ''%s'' incomplete', hfdesign.Specification);
        % 49 51
    end % switch
    % 51 53
    abstract_setGUI(this, Hd);
