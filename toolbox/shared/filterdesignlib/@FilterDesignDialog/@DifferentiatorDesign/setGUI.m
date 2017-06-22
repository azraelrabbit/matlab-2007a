function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    hfdesign = getfdesign(Hd);
    if not(strcmpi(get(hfdesign, 'Response'), 'differentiator'))
        b = false;
        return;
    end % if
    switch hfdesign.Specification
    case 'Fp,Fst,Ap,Ast'
        set(this, 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 17 21
        % 18 21
        % 19 21
    case 'N'
        % 20 22
        set(this, 'privFrequencyConstraints', 'unconstrained', 'privMagnitudeConstraints', 'unconstrained', 'Order', num2str(hfdesign.FilterOrder));
        % 23 26
        % 24 26
    case 'Ap'
        % 26 28
    case 'N,Fp,Fst'
        % 27 29
        set(this, 'privFrequencyConstraints', 'Passband edge and stopband edge', 'privMagnitudeConstraints', 'unconstrained', 'Order', num2str(hfdesign.FilterOrder), 'Fpass', num2str(hfdesign.Fpass), 'Fstop', num2str(hfdesign.Fstop));
    otherwise
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        % 34 36
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: Differentiator ''%s'' incomplete', hfdesign.Specification);
        % 36 38
    end % switch
    % 38 40
    abstract_setGUI(this, Hd);
