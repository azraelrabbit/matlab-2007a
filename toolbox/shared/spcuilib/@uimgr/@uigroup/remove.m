function remove(h, varargin)
    % 1 27
    % 2 27
    % 3 27
    % 4 27
    % 5 27
    % 6 27
    % 7 27
    % 8 27
    % 9 27
    % 10 27
    % 11 27
    % 12 27
    % 13 27
    % 14 27
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    if gt(nargin, 1.0)
        % 28 29
        h = h.findchild(varargin{:});
        if isempty(h)
            error('uimgr:ChildNotFound', 'Child not found.');
        end % if
    end % if
    % 34 36
    % 35 36
    h.unrender;
    % 37 40
    % 38 40
    % 39 40
    h.disconnect;
end % function
