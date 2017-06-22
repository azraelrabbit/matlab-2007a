function rout = rectconv(rin, style)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    switch lower(style)
    case {'handlegraphics','hg'}
        % 21 22
        rout = InternalSimRect2HGRect(rin);
    case {'simulink','sl'}
        % 24 25
        rout = InternalHGRect2SimRect(rin);
    otherwise
        % 27 28
        error('Rectangle style is either ''simulink'' or ''handlegraphics''');
        % 29 30
    end % switch
end % function
function rout = InternalSimRect2HGRect(rin)
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    origRootUnits = get(0.0, 'Units');
    set(0.0, 'Units', 'pixel');
    screen = get(0.0, 'ScreenSize');
    set(0.0, 'Units', origRootUnits);
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    rout = zeros(1.0, 4.0);
    rout(1.0) = rin(1.0);
    rout(2.0) = minus(screen(4.0), rin(4.0));
    rout(3.0) = minus(rin(3.0), rin(1.0));
    rout(4.0) = minus(rin(4.0), rin(2.0));
end % function
function rout = InternalHGRect2SimRect(rin)
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    origRootUnits = get(0.0, 'Units');
    set(0.0, 'Units', 'pixel');
    screen = get(0.0, 'ScreenSize');
    set(0.0, 'Units', origRootUnits);
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    rout = zeros(1.0, 4.0);
    rout(1.0) = rin(1.0);
    rout(2.0) = minus(minus(screen(4.0), rin(2.0)), rin(4.0));
    rout(3.0) = plus(rin(1.0), rin(3.0));
    rout(4.0) = minus(screen(4.0), rin(2.0));
end % function
