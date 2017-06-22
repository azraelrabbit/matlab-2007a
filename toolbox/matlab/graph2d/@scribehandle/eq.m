function val = eq(a, b)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    S.type = '.';
    S.subs = 'HGHandle';
    % 10 11
    if iscell(a) || gt(length(a), 1.0)
        aH = subsref(a, S);
        aH = horzcat(aH{:});
    else
        aH = a.HGHandle;
    end % if
    if iscell(b) || gt(length(b), 1.0)
        bH = subsref(b, S);
        bH = horzcat(bH{:});
    else
        bH = b.HGHandle;
    end % if
    % 23 24
    val = eq(aH, bH);
end % function
