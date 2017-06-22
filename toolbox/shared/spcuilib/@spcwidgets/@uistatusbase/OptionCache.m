function cache = OptionCache(h)
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
    p = OptionCacheProps(h);
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    Nprops = numel(p);
    Nopts = numel(h.hOptionText);
    cache = cell(1.0, Nprops);
    if eq(Nopts, 1.0)
        % 23 25
        % 24 25
        for i=1.0:Nprops
            cache{i} = cellhorzcat(get(h.hOptionText, p{i}));
        end % for
    else
        for i=1.0:Nprops
            cache{i} = get(h.hOptionText, p{i});
        end % for
    end % if
end % function
