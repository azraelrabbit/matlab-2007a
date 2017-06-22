function errors = validate(target)
    % 1 35
    % 2 35
    % 3 35
    % 4 35
    % 5 35
    % 6 35
    % 7 35
    % 8 35
    % 9 35
    % 10 35
    % 11 35
    % 12 35
    % 13 35
    % 14 35
    % 15 35
    % 16 35
    % 17 35
    % 18 35
    % 19 35
    % 20 35
    % 21 35
    % 22 35
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    target.registered_blocks = {};
    % 36 37
    nodes = target.activeList.find('-class', 'RTWConfiguration.Node');
    % 38 41
    % 39 41
    % 40 41
    keys = get(nodes, 'sourceLibrary');
    if iscell(keys)
        [y, idx] = sort(keys);
        nodes = nodes(idx);
    end % if
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    errors = {};
    for i=1.0:length(nodes)
        err = validate(nodes(i), target);
        if not(isempty(err))
            if iscell(err)
                errors = cellhorzcat(errors{:}, err{:});
            else
                errors = cellhorzcat(errors{:}, err);
            end % if
        end % if
    end % for
    % 61 62
    target.errors = errors;
end % function
