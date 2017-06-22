function SetMostRecent(h, item)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    if isempty(item)
        error('spcwidgets:AddEmptyItem', 'Cannot add an empty item');
    end % if
    % 25 28
    % 26 28
    % 27 28
    items = h.GetAllRecent(true);
    N = numel(items);
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    if iscell(item)
        % 35 37
        % 36 37
        item_name = item{1.0};
        all_names = getItemNames(items);
        idx = strmatch(item_name, all_names, 'exact');
    else
        % 41 42
        idx = strmatch(item, items, 'exact');
    end % if
    % 44 45
    if isempty(idx)
        % 46 48
        % 47 48
        items = vertcat(cellhorzcat(item), items(1.0:minus(N, 1.0)));
    else
        % 50 58
        % 51 58
        % 52 58
        % 53 58
        % 54 58
        % 55 58
        % 56 58
        % 57 58
        all_idx = 1.0:N;
        all_idx(idx) = [];
        all_idx = horzcat(idx(1.0), all_idx);
        items = items(all_idx);
    end % if
    h.SetList(items);
end % function
