function h = specsfsspecifier(defaultUnits, defaultFs)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(0.0, 2.0, nargin));
    % 8 11
    % 9 11
    h = siggui.specsfsspecifier;
    % 11 14
    % 12 14
    allUnits = set(h, 'Units');
    % 14 16
    if lt(nargin, 1.0)
        defaultUnits = allUnits{2.0};
    end % if
    if lt(nargin, 2.0)
        defaultFs = '48000';
    end % if
    set(h, 'Version', 1.0);
    set(h, 'Units', defaultUnits);
    set(h, 'Value', defaultFs);
    settag(h);
end % function
