function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    b = true;
    hfdesign = getfdesign(Hd);
    if not(any(strcmpi(get(hfdesign, 'Response'), {'hilbert','hilbert transformer'})))
        b = false;
        return;
    end % if
    % 14 15
    switch hfdesign.Specification
    case 'N,TW'
        set(this, 'TransitionWidth', num2str(hfdesign.TransitionWidth));
    case 'TW,Ap'
        set(this, 'TransitionWidth', num2str(hfdesign.TransitionWidth), 'Apass', num2str(hfdesign.Apass));
    otherwise
        % 21 22
        % 22 23
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: Hilbert ''%s'' incomplete', hfdesign.Specification);
        % 24 25
    end % switch
    % 26 27
    abstract_setGUI(this, Hd);
end % function
