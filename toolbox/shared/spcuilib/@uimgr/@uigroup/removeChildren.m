function removeChildren(h, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if gt(nargin, 1.0)
        % 14 15
        h = h.findchild(varargin{:});
        if isempty(h)
            error('uimgr:ChildNotFound', 'Child not found.');
        end % if
    end % if
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    hChild = h.down('last');
        while not(isempty(hChild))
        hNext = hChild.left;
        % 28 29
        if hChild.isGroup
            removeChildren(hChild);
        end % if
        % 32 36
        % 33 36
        % 34 36
        % 35 36
        hChild.disconnect;
        hChild.unrender;
        hChild = hNext;
    end % while
end % function
