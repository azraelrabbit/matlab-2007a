function h = init(h, names, props)
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
    if not(iscell(names)) || isempty(names) || not(isvector(names))
        % 14 15
        error('NAMES must be a non-empty cell-array of strings');
    end % if
    N = numel(names);
    if ne(numel(unique(names)), N)
        error('NAMES must all be unique');
    end % if
    % 21 24
    % 22 24
    % 23 24
    if lt(nargin, 3.0)
        props = repmat(cellhorzcat(handle([])), 1.0, N);
    else
        % 27 28
        if not(iscell(props))
            % 29 30
            error('SETS must be passed as a cell-array of handles to objects');
        end % if
        if ne(numel(props), N)
            % 33 34
            error('Number of property sets (%d) does not match number of names (%d).', numel(props), N);
            % 35 36
        end % if
    end % if
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    ena = true(1.0, N);
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    h.prop_set_names = names;
    h.prop_sets = props;
    h.prop_set_enables = ena;
end % function
