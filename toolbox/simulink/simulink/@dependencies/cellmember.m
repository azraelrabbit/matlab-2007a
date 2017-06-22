function [m, loc] = cellmember(a, b)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if not(iscell(a))
        a = cellstr(a);
    end % if
    if not(iscell(b))
        b = cellstr(b);
    end % if
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    sb = cellfun('length', b);
    sa = cellfun('length', a);
    % 26 27
    m = false(size(a));
    loc = zeros(size(a));
    for i=1.0:numel(a)
        % 30 31
        sizematch = eq(sa(i), sb);
        if any(sizematch)
            ind = find(sizematch);
            % 34 35
            contentmatch = strcmp(a{i}, b(sizematch));
            if any(contentmatch)
                % 37 38
                x = find(contentmatch, 1.0, 'last');
                m(i) = true;
                loc(i) = ind(x);
            end % if
            % 42 52
            % 43 52
            % 44 52
            % 45 52
            % 46 52
            % 47 52
            % 48 52
            % 49 52
            % 50 52
            % 51 52
        end % if
    end % for
end % function
