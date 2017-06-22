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
    if not(strcmpi(hfdesign.Response, 'cic'))
        b = false;
        return;
    end % if
    % 14 15
    set(this, 'DifferentialDelay', num2str(hfdesign.DifferentialDelay));
    % 16 17
    switch hfdesign.Specification
    case 'Fp,Ast'
        set(this, 'Fpass', num2str(hfdesign.Fpass), 'Astop', num2str(hfdesign.Astop));
    otherwise
        % 21 22
        % 22 23
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: CIC ''%s'' incomplete', hfdesign.Specification);
        % 24 25
    end % switch
    % 26 27
    abstract_setGUI(this, Hd);
end % function
