function y = disconnectForNewSource(oldSrc, newSrc)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    if eq(nargin, 1.0)
        % 23 25
        y = not(oldSrc.dataSource.isFloating);
    else
        % 26 32
        % 27 32
        % 28 32
        % 29 32
        % 30 32
        new_is_floating = isa(newSrc, 'MPlay.SrcSL') && newSrc.dataSource.isFloating;
        % 32 34
        y = oldSrc.dataSource.isFloating && not(new_is_floating);
    end
end
