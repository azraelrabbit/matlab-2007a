function [hChild, idx] = findparent(hGroup, varargin)
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
    % 13 14
    if eq(numel(varargin), 1.0) && iscellstr(varargin{1.0})
        % 15 16
        ChildName = varargin{1.0};
    else
        % 18 19
        ChildName = varargin;
    end % if
    % 21 24
    % 22 24
    % 23 24
    ParentName = ChildName(1.0:minus(end, 1.0));
    if isempty(ParentName)
        hChild = hGroup;
        idx = 0.0;
    else
        [hChild, idx] = findchild(hGroup, ParentName);
    end % if
end % function
