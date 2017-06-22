function result = DialogManager(method, emcProj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent cache;
    result = [];
    % 7 9
    if isempty(cache)
        cache = cell(0.0, 3.0);
        mlock;
    end
    % 12 14
    switch method
    case 'open'
        me = emc_manager_cache_find_entry(cache, emcProj);
        if isempty(me)
            [me, listener] = DialogCreate(emcProj);
            cache(plus(end, 1.0), :) = cellhorzcat(emcProj, me, listener);
        else
            me.show;
        end
        result = me;
    case 'close'
        [me, listener, index] = emc_manager_cache_find_entry(cache, emcProj);
        if not(isempty(me))
            delete(listener);
            delete(me);
            cache(index, :) = [];
        end
    case 'find'
        me = emc_manager_cache_find_entry(cache, emcProj);
        result = me;
    end
end
function [me, listener, index] = emc_manager_cache_find_entry(cache, emcProj)
    % 36 39
    % 37 39
    me = [];
    listener = [];
    index = 0.0;
    % 41 43
    len = size(cache, 1.0);
    for i=1.0:len
        if eq(cache{i, 1.0}, emcProj)
            index = i;
            me = cache{i, 2.0};
            listener = cache{i, 3.0};
            break
        end
    end % for
end
