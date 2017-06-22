function pf = getpixunit
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isunix
        pf = 1.0;
    else
        pf = mrdivide(get(0.0, 'screenpixelsperinch'), 96.0);
    end % if
end % function
