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
    if not(strcmpi(get(hfdesign, 'Response'), 'nyquist'))
        b = false;
        return;
    end % if
    set(this, 'Band', num2str(hfdesign.Band));
    % 15 16
    abstractnyquist_setGUI(this, Hd);
end % function
