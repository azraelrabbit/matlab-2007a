function abstractnyquist_setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hfdesign = getfdesign(Hd);
    switch lower(hfdesign.Specification)
    case 'tw,ast'
        set(this, 'TransitionWidth', num2str(hfdesign.TransitionWidth), 'Astop', num2str(hfdesign.Astop));
        % 12 14
    case 'n'
        % 13 15
        set(this, 'privFrequencyConstraints', 'unconstrained', 'privMagnitudeConstraints', 'unconstrained');
        % 16 18
    case 'n,tw'
        % 17 19
        set(this, 'privFrequencyConstraints', 'transition width', 'privMagnitudeConstraints', 'unconstrained', 'TransitionWidth', num2str(hfdesign.TransitionWidth));
        % 20 23
        % 21 23
    case 'n,ast'
        % 22 24
        set(this, 'privFrequencyConstraints', 'unconstrained', 'privMagnitudeConstraints', 'Stopband attenuation', 'Astop', num2str(hfdesign.Astop));
    otherwise
        % 25 28
        % 26 28
        % 27 29
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: Nyquist ''%s'' incomplete', hfdesign.Specification);
        % 29 31
    end % switch
    % 31 33
    abstract_setGUI(this, Hd);
