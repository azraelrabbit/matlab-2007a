function save(h, prop, value)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if eq(nargin, 1.0)
        % 7 9
        y = MPlay.PrefsDefs;
        for i=1.0:size(y, 1.0)
            pname = y{i, 1.0};
            pval = y{i, 3.0};
            setpref(h.GroupName, pname, pval);
        end % for
    else
        % 15 17
        setpref(h.GroupName, prop, value);
    end % if
end % function
