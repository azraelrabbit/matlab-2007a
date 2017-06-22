function [items, N] = GetAllRecent(h, includeEmpty)
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
    items = getpref(h.PrefsGroup, h.PrefsRecentFiles);
    shortList = lt(nargin, 2.0) || not(includeEmpty);
    if shortList || gt(nargout, 1.0)
        % 16 33
        % 17 33
        % 18 33
        % 19 33
        % 20 33
        % 21 33
        % 22 33
        % 23 33
        % 24 33
        % 25 33
        % 26 33
        % 27 33
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        i = find(cellfun('isempty', items), 1.0);
        if isempty(i)
            N = numel(items);
        else
            N = minus(i, 1.0);
        end
        if shortList
            % 39 41
            items = items(1.0:N);
        end
    end
end
