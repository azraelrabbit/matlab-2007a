function settag(h, tag)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if lt(nargin, 2.0)
        tag = class(h);
    end % if
    set(h, 'Tag', tag);
end % function