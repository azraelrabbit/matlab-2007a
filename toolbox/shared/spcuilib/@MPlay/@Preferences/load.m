function load(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ~(ispref(h.GroupName))
        save(h);
    end
    % 10 14
    % 11 14
    % 12 14
    p_def = MPlay.PrefsDefs;
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    p_reg = getpref(h.GroupName);
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    for i=1.0:size(p_def, 1.0)
        % 24 26
        pref_prop = p_def{i, 1.0};
        % 26 28
        if isfield(p_reg, pref_prop)
            % 28 30
            val = p_reg.(pref_prop);
        else
            % 31 33
            val = p_def{i, 3.0};
        end
        % 34 36
        set(h, pref_prop, val);
    end % for
end
