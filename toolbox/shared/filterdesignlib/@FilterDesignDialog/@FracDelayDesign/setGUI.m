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
    if not(strcmpi(get(hfdesign, 'Response'), 'fractional delay'))
        b = false;
        return;
    end % if
    % 14 15
    set(this, 'FracDelay', num2str(hfdesign.FracDelay), 'Order', num2str(hfdesign.FilterOrder));
    % 16 19
    % 17 19
    % 18 19
    abstract_setGUI(this, Hd);
end % function
