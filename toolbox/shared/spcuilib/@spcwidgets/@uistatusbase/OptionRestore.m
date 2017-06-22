function OptionRestore(h, optionCache, idx)
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
    if isempty(optionCache)
        return;
    end % if
    local_CheckOptionCache(h, optionCache);
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    NCachedOpts = numel(optionCache{1.0});
    if lt(nargin, 3.0)
        % 27 30
        % 28 30
        % 29 30
        NCurrOpts = numel(h.hOptionText);
        N = min(NCachedOpts, NCurrOpts);
        idx = 1.0:N;
    end % if
    % 34 37
    % 35 37
    % 36 37
    CheckOptionIndex(h, idx, NCachedOpts);
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    props = OptionCacheProps(h);
    N = numel(idx);
    for i=1.0:numel(props)
        prop_i = props{i};
        opts_i = optionCache{i};
        opts_i = opts_i(idx);
        for j=1.0:N
            set(h.hOptionText(j), prop_i, opts_i{j});
            OptionTruncate(h, j);
        end % for
    end % for
end % function
function local_CheckOptionCache(h, cache)
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    if not(iscell(cache)) || ne(numel(cache), numel(OptionCacheProps(h)))
        % 64 65
        error('spcwidgets:uistatusbar:InvalidOptionCache', 'Invalid option cache.');
        % 66 67
    end % if
end % function
