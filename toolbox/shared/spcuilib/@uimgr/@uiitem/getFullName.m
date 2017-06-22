function s = getFullName(h, delimit)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if lt(nargin, 2.0)
        delimit = '';
    end % if
    s = h.Name;
    h = h.up;
    if isempty(delimit)
        s = cellhorzcat(s);
            while not(isempty(h))
            s = horzcat(cellhorzcat(h.Name), s);
            h = h.up;
        end % while
    else
            while not(isempty(h))
            s = sprintf('%s%s%s', h.Name, delimit, s);
            h = h.up;
        end % while
    end % if
end % function
