function val = ne(a, b)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    S.type = '.';
    S.subs = 'HGHandle';
    % 9 11
    if iscell(a) || gt(length(a), 1.0)
        aH = subsref(a, S);
        aH = horzcat(aH{:});
    else
        if not(isempty(a))
            if isa(a, 'scribehandle')
                aH = a.HGHandle;
            else
                aH = a;
            end % if
        else
            aH = [];
        end % if
    end % if
    if iscell(b) || gt(length(b), 1.0)
        bH = subsref(b, S);
        bH = horzcat(bH{:});
    else
        if not(isempty(b))
            if isa(b, 'scribehandle')
                bH = b.HGHandle;
            else
                bH = b;
            end % if
        else
            bH = [];
        end % if
    end % if
    val = ne(aH, bH);
end % function
