function h = fighandle(HG)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 0.0)
        h.Class = 'fighandle';
        h.figStoreHGHandle = [];
        h = class(h, 'fighandle');
        return;
    end % if
    % 14 15
    h.Class = 'fighandle';
    h.figStoreHGHandle = HG;
    h = class(h, 'fighandle');
end % function
