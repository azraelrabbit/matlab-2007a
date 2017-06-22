function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    hfdesign = getfdesign(Hd);
    if not(strcmpi(get(hfdesign, 'Response'), 'cic compensator'))
        b = false;
        return;
    end % if
    % 13 15
    set(this, 'NumberOfSections', num2str(hfdesign.NumberOfSections), 'DifferentialDelay', num2str(hfdesign.DifferentialDelay));
    % 15 19
    % 16 19
    % 17 19
    switch hfdesign.Specification
    case 'Fp,Fst,Ap,Ast'
        set(this, 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 22 26
        % 23 26
        % 24 26
    case 'N,Fc,Ap,Ast'
        % 25 27
        set(this, 'privFrequencyConstraints', '6dB point', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'F6dB', num2str(hfdesign.Fcutoff), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 28 33
        % 29 33
        % 30 33
        % 31 33
    case 'N,Fp,Ap,Ast'
        % 32 34
        set(this, 'privFrequencyConstraints', 'Passband edge', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'Fpass', num2str(hfdesign.Fpass), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 35 40
        % 36 40
        % 37 40
        % 38 40
    case 'N,Fst,Ap,Ast'
        % 39 41
        set(this, 'privFrequencyConstraints', 'Stopband edge', 'privMagnitudeConstraints', 'Passband ripple and stopband attenuation', 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 42 47
        % 43 47
        % 44 47
        % 45 47
    case 'N,Fp,Fst'
        % 46 48
        set(this, 'privFrequencyConstraints', 'Passband edge and stopband edge', 'privMagnitudeConstraints', 'Unconstrained', 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop));
    otherwise
        % 49 53
        % 50 53
        % 51 53
        % 52 54
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: CICComp ''%s'' incomplete', hfdesign.Specification);
        % 54 56
    end % switch
    % 56 58
    abstract_setGUI(this, Hd);
